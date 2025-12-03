package com.example.recipefinder.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import com.example.recipefinder.model.Recipe;


 //RecipeDAO — database access for recipes and favorites.
 //getDistinctIngredients() for autocomplete
 //findByTokens() returns candidate recipes (UI computes match % / ranking)
 //favorites: save, list, remove
 
public class RecipeDAO {

    
     // Return a list of distinct ingredient tokens 
     // Used for autocomplete suggestions.
     
    public List<String> getDistinctIngredients() throws SQLException {
        String sql = "SELECT DISTINCT trim(lower(unnest(string_to_array(ingredients, ',')))) AS name FROM recipes WHERE ingredients IS NOT NULL";
        List<String> out = new ArrayList<>();
        try (Connection conn = DatabaseHandler.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                String name = rs.getString("name");
                if (name != null && !name.isBlank()) out.add(name);
            }
        }
        return out;
    }

    /*
     return candidate recipes.
     This implementation reads up to 'limit' recipes
     and returns them for the UI to compute match% and ranking
     */
    public List<Recipe> findByTokens(List<String> tokens, int limit) throws SQLException {
        String sql = "SELECT id, name, description, category, ingredients, recipeingredientquantities, " +
                "calories, fat_content, fiber_content, sugar_content, protein_content, instructions, image_path " +
                "FROM recipes WHERE ingredients IS NOT NULL LIMIT ?";
        List<Recipe> out = new ArrayList<>();
        try (Connection conn = DatabaseHandler.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, Math.max(1, limit));
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Recipe r = mapRowToRecipe(rs);
                    out.add(r);
                }
            }
        }
        return out;
    }

    private Recipe mapRowToRecipe(ResultSet rs) throws SQLException {
        Recipe r = new Recipe();
        r.setId(rs.getInt("id"));
        r.setName(rs.getString("name"));
        r.setDescription(rs.getString("description"));
        r.setCategory(rs.getString("category"));
        r.setIngredients(rs.getString("ingredients"));
        r.setRecipeIngredientQuantities(rs.getString("recipeingredientquantities"));
        // numeric columns may be null — handle gracefully
        r.setCalories(getNullableDouble(rs, "calories"));
        r.setFatContent(getNullableDouble(rs, "fat_content"));
        r.setFiberContent(getNullableDouble(rs, "fiber_content"));
        r.setSugarContent(getNullableDouble(rs, "sugar_content"));
        r.setProteinContent(getNullableDouble(rs, "protein_content"));
        r.setInstructions(rs.getString("instructions"));
        r.setImagePath(rs.getString("image_path"));
        return r;
    }

    private Double getNullableDouble(ResultSet rs, String col) throws SQLException {
        double v = rs.getDouble(col);
        return rs.wasNull() ? null : v;
    }

    // Favorites methods
    
    public void saveFavorite(int recipeId, String note) throws SQLException {
        String sql = "INSERT INTO favorites (recipe_id, note) VALUES (?, ?)";
        try (Connection conn = DatabaseHandler.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, recipeId);
            if (note == null || note.isBlank()) ps.setNull(2, Types.VARCHAR);
            else ps.setString(2, note);
            ps.executeUpdate();
        }
    }

    /*
      List favorite recipes (most recent first).
     */
    public List<Recipe> listFavorites() throws SQLException {
        String sql = "SELECT r.id, r.name, r.description, r.category, r.ingredients, r.recipeingredientquantities, " +
                "r.calories, r.fat_content, r.fiber_content, r.sugar_content, r.protein_content, r.instructions, r.image_path " +
                "FROM favorites f JOIN recipes r ON f.recipe_id = r.id ORDER BY f.saved_at DESC";
        List<Recipe> out = new ArrayList<>();
        try (Connection conn = DatabaseHandler.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                out.add(mapRowToRecipe(rs));
            }
        }
        return out;
    }

    
    //remove a favorite by recipe id.
     
    public void removeFavorite(int recipeId) throws SQLException {
        String sql = "DELETE FROM favorites WHERE recipe_id = ?";
        try (Connection conn = DatabaseHandler.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, recipeId);
            ps.executeUpdate();
        }
    }
}
