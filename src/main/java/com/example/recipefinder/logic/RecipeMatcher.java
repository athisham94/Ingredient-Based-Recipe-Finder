package com.example.recipefinder.logic;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.example.recipefinder.db.RecipeDAO;
import com.example.recipefinder.model.Recipe;


 //RecipeMatcher with simple token normalization and paging support.
 
public class RecipeMatcher {

    
    //normalize a single token: lowercase, strip punctuation, simple plural
     
    public static String normalizeToken(String token) {
        if (token == null) return "";
        String s = token.trim().toLowerCase();
        // remove common punctuation
        s = s.replaceAll("[^a-z0-9\\s]", "").trim();
        if (s.isEmpty()) return s;
        // simple plural rules:
        if (s.endsWith("ies") && s.length() > 3) {
            // berries -> berry
            s = s.substring(0, s.length() - 3) + "y";
        } else if (s.endsWith("ves") && s.length() > 3) {
            // leaves -> leaf
            s = s.substring(0, s.length() - 3) + "f";
        } else if (s.endsWith("es") && s.length() > 2) {
            // boxes -> box, sauces -> sauce (not perfect)
            s = s.substring(0, s.length() - 2);
        } else if (s.endsWith("s") && s.length() > 1) {
            // eggs -> egg
            s = s.substring(0, s.length() - 1);
        }
        return s;
    }

    private static List<String> parseAndNormalizeIngredients(String raw) {
        if (raw == null || raw.isBlank()) return List.of();
        return Arrays.stream(raw.split(","))
                .map(String::trim)
                .filter(x -> !x.isEmpty())
                .map(String::toLowerCase)
                .map(RecipeMatcher::normalizeToken)
                .filter(x -> !x.isEmpty())
                .collect(Collectors.toList());
    }

    /*
    tokens: user tokens (already raw)
     onlyDoable: whether to only return 100% matches
     ingredientFreq: map for rarity weighting
     limit, offset: paging
     */
    public static List<Recipe> matchRecipes(List<String> rawTokens, boolean onlyDoable,
                                            Map<String, Integer> ingredientFreq,
                                            int limit, int offset) {

        if (rawTokens == null || rawTokens.isEmpty()) return List.of();

        // normalize input tokens
        List<String> tokens = rawTokens.stream()
                .map(String::trim)
                .filter(t -> !t.isEmpty())
                .map(RecipeMatcher::normalizeToken)
                .filter(t -> !t.isEmpty())
                .collect(Collectors.toList());

        if (tokens.isEmpty()) return List.of();

        RecipeDAO dao = new RecipeDAO();
        List<Recipe> candidates;
        try {
            // ask DAO for a reasonably sized candidate set (use larger than limit to allow ranking)
            candidates = dao.findByTokens(tokens, Math.max(500, limit + offset));
        } catch (SQLException e) {
            e.printStackTrace();
            return List.of();
        }

        List<Scored> scored = new ArrayList<>(candidates.size());

        for (Recipe r : candidates) {
            List<String> recipeIngs = parseAndNormalizeIngredients(r.getIngredients());

            if (recipeIngs.isEmpty()) {
                r.setMatchPercent(0.0);
                r.setMissingIngredients(List.of());
                scored.add(new Scored(r, 0.0, 0.0));
                continue;
            }

            int matchedCount = 0;
            double rarityScore = 0.0;
            List<String> missing = new ArrayList<>();

            for (String ing : recipeIngs) {
                boolean matched = tokens.stream().anyMatch(t -> ingredientMatches(t, ing));
                if (matched) {
                    matchedCount++;
                    int f = ingredientFreq == null ? 1 : ingredientFreq.getOrDefault(ing, 1);
                    if (f <= 0) f = 1;
                    rarityScore += 1.0 / (double) f;
                } else {
                    missing.add(ing);
                }
            }

            double pct = ((double) matchedCount / (double) recipeIngs.size()) * 100.0;
            r.setMatchPercent(pct);
            r.setMissingIngredients(missing);
            double finalScore = pct * 1000.0 + rarityScore;
            scored.add(new Scored(r, pct, finalScore));
        }

        // sort by score
        scored.sort((a, b) -> {
            int c = Double.compare(b.finalScore, a.finalScore);
            if (c != 0) return c;
            return Double.compare(b.matchPercent, a.matchPercent);
        });

        // apply only- doable and then paging (offset, limit)
        List<Recipe> filtered = scored.stream()
                .map(s -> s.recipe)
                .filter(r -> !onlyDoable || r.getMatchPercent() >= 100.0)
                .collect(Collectors.toList());

        int from = Math.min(Math.max(0, offset), filtered.size());
        int to = Math.min(filtered.size(), from + Math.max(0, limit));
        return filtered.subList(from, to);
    }

    // match token vs ingredient after normalization (both should be normalized)
    private static boolean ingredientMatches(String tokenNorm, String ingredientNorm) {
        if (tokenNorm == null || ingredientNorm == null) return false;
        // exact or substring match
        if (tokenNorm.equals(ingredientNorm)) return true;
        if (ingredientNorm.contains(tokenNorm)) return true;
        if (tokenNorm.contains(ingredientNorm)) return true;
        // word boundary match
        String[] words = ingredientNorm.split("\\s+");
        for (String w : words) if (w.equals(tokenNorm)) return true;
        return false;
    }

    private static class Scored {
        final Recipe recipe;
        final double matchPercent;
        final double finalScore;
        Scored(Recipe r, double pct, double fs) { this.recipe = r; this.matchPercent = pct; this.finalScore = fs; }
    }
}
