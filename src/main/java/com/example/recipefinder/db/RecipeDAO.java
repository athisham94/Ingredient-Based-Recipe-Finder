package com.example.recipefinder.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.recipefinder.model.Recipe;

/**
 * DAO for reading recipes from the recipes table.
 * - Uses tokenized LIKE search (LOWER(ingredients) LIKE ?).
 * - Keeps methods simple and synchronous (call from background thread in UI).
 */
public class RecipeDAO {

    /**
     * Find recipes containing ANY of the tokens. We return candidates and let
     * caller compute a match percentage.
     */
    public List<Recipe> findByTokens(List<String> tokens, int limit) throws SQLException {
        if (tokens == null || tokens.isEmpty()) return new ArrayList<>();

        // Build WHERE clause: LOWER(ingredients) LIKE ? OR LOWER(ingredients) LIKE ? ...
        StringBuilder sql = new StringBuilder("SELECT id, name, description, category, ingredients, recipeingredientquantities, calories, fat_content, fiber_content, sugar_content, protein_content, instructions, image_path FROM recipes WHERE ");
        for (int i = 0; i < tokens.size(); i++) {
            if (i > 0) sql.append(" OR ");
            sql.append("LOWER(ingredients) LIKE ?");
        }
        sql.append(" ORDER BY id LIMIT ").append(limit > 0 ? limit : 200);

        try (Connection conn = DatabaseHandler.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            for (int i = 0; i < tokens.size(); i++) {
                ps.setString(i + 1, "%" + tokens.get(i) + "%");
            }
            try (ResultSet rs = ps.executeQuery()) {
                List<Recipe> out = new ArrayList<>();
                while (rs.next()) {
                    Recipe r = new Recipe();
                    r.setId(rs.getInt("id"));
                    r.setName(rs.getString("name"));
                    r.setDescription(rs.getString("description"));
                    r.setCategory(rs.getString("category"));
                    r.setIngredients(rs.getString("ingredients"));
                    r.setRecipeIngredientQuantities(rs.getString("recipeingredientquantities"));
                    // numeric columns may be null
                    r.setCalories(getNullableDouble(rs, "calories"));
                    r.setFatContent(getNullableDouble(rs, "fat_content"));
                    r.setFiberContent(getNullableDouble(rs, "fiber_content"));
                    r.setSugarContent(getNullableDouble(rs, "sugar_content"));
                    r.setProteinContent(getNullableDouble(rs, "protein_content"));
                    r.setInstructions(rs.getString("instructions"));
                    r.setImagePath(rs.getString("image_path"));
                    out.add(r);
                }
                return out;
            }
        }
    }

    public List<Recipe> listAll(int limit) throws SQLException {
        String sql = "SELECT id, name, description, category, ingredients, recipeingredientquantities, calories, fat_content, fiber_content, sugar_content, protein_content, instructions, image_path FROM recipes ORDER BY id LIMIT ?";
        try (Connection conn = DatabaseHandler.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, limit > 0 ? limit : 200);
            try (ResultSet rs = ps.executeQuery()) {
                List<Recipe> out = new ArrayList<>();
                while (rs.next()) {
                    Recipe r = new Recipe();
                    r.setId(rs.getInt("id"));
                    r.setName(rs.getString("name"));
                    r.setDescription(rs.getString("description"));
                    r.setCategory(rs.getString("category"));
                    r.setIngredients(rs.getString("ingredients"));
                    r.setRecipeIngredientQuantities(rs.getString("recipeingredientquantities"));
                    r.setCalories(getNullableDouble(rs, "calories"));
                    r.setFatContent(getNullableDouble(rs, "fat_content"));
                    r.setFiberContent(getNullableDouble(rs, "fiber_content"));
                    r.setSugarContent(getNullableDouble(rs, "sugar_content"));
                    r.setProteinContent(getNullableDouble(rs, "protein_content"));
                    r.setInstructions(rs.getString("instructions"));
                    r.setImagePath(rs.getString("image_path"));
                    out.add(r);
                }
                return out;
            }
        }
    }

    public Recipe getById(int id) throws SQLException {
        String sql = "SELECT id, name, description, category, ingredients, recipeingredientquantities, calories, fat_content, fiber_content, sugar_content, protein_content, instructions, image_path FROM recipes WHERE id = ?";
        try (Connection conn = DatabaseHandler.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Recipe r = new Recipe();
                    r.setId(rs.getInt("id"));
                    r.setName(rs.getString("name"));
                    r.setDescription(rs.getString("description"));
                    r.setCategory(rs.getString("category"));
                    r.setIngredients(rs.getString("ingredients"));
                    r.setRecipeIngredientQuantities(rs.getString("recipeingredientquantities"));
                    r.setCalories(getNullableDouble(rs, "calories"));
                    r.setFatContent(getNullableDouble(rs, "fat_content"));
                    r.setFiberContent(getNullableDouble(rs, "fiber_content"));
                    r.setSugarContent(getNullableDouble(rs, "sugar_content"));
                    r.setProteinContent(getNullableDouble(rs, "protein_content"));
                    r.setInstructions(rs.getString("instructions"));
                    r.setImagePath(rs.getString("image_path"));
                    return r;
                } else {
                    return null;
                }
            }
        }
    }

    private static Double getNullableDouble(ResultSet rs, String col) throws SQLException {
        double v = rs.getDouble(col);
        return rs.wasNull() ? null : v;
    }
}
