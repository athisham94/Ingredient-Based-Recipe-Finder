package com.example.recipefinder.logic;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import com.example.recipefinder.model.Recipe;

public class RecipeMatcher {

    /** normalize and split comma-separated ingredients into tokens */
    private static Set<String> splitTokens(String ingredients) {
        if (ingredients == null) return new HashSet<>();
        return Arrays.stream(ingredients.split(","))
                .map(s -> s.trim().toLowerCase())
                .filter(s -> !s.isEmpty())
                .collect(Collectors.toSet());
    }

    /**
     * Compute match percent given user's tokens and recipe's ingredient string.
     * Returns a value between 0..100.
     */
    public static double computeMatchPercent(List<String> userTokens, Recipe recipe) {
        if (userTokens == null || userTokens.isEmpty()) return 0.0;
        Set<String> recipeTokens = splitTokens(recipe.getIngredients());
        if (recipeTokens.isEmpty()) return 0.0;

        int matched = 0;
        Set<String> lowerUser = userTokens.stream()
                .map(String::toLowerCase)
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .collect(Collectors.toSet());

        for (String ut : lowerUser) {
            // match if any recipe token contains the user token (handles "makki atta" vs "atta")
            for (String rt : recipeTokens) {
                if (rt.contains(ut) || ut.contains(rt)) {
                    matched++;
                    break;
                }
            }
        }

        double percent = (matched * 100.0) / recipeTokens.size();
        recipe.setMatchPercent(percent);
        return percent;
    }
}
