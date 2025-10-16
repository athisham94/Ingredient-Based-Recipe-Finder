package com.example.recipefinder.db;

import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.example.recipefinder.model.Recipe;

public class RecipeDAO {

    public List<Recipe> findByIngredients(List<String> userIngredients) throws SQLException {
        if (userIngredients == null || userIngredients.isEmpty()) return Collections.emptyList();

        String sql =
            "SELECT r.id, r.name, r.instructions, " +
            "       COUNT(ri.ingredient_id) FILTER (WHERE i.name = ANY (?::text[])) AS matched_count, " +
            "       (SELECT COUNT(*) FROM recipe_ingredients ri2 WHERE ri2.recipe_id = r.id) AS total_count " +
            "FROM recipes r " +
            "JOIN recipe_ingredients ri ON r.id = ri.recipe_id " +
            "JOIN ingredients i ON ri.ingredient_id = i.id " +
            "GROUP BY r.id, r.name, r.instructions " +
            "HAVING COUNT(ri.ingredient_id) FILTER (WHERE i.name = ANY (?::text[])) > 0 " +
            "ORDER BY matched_count DESC, r.name;";

        try (Connection conn = DatabaseHandler.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            Array arr = conn.createArrayOf("text", userIngredients.toArray(new String[0]));
            ps.setArray(1, arr);
            ps.setArray(2, arr); // same array for HAVING's ANY

            ResultSet rs = ps.executeQuery();
            List<Recipe> results = new ArrayList<>();
            while (rs.next()) {
                Recipe r = new Recipe(rs.getInt("id"),
                                      rs.getString("name"),
                                      rs.getString("instructions"));
                r.setMatchedCount(rs.getInt("matched_count"));
                r.setTotalCount(rs.getInt("total_count"));
                // lazy: don't fetch full ingredient list here (use getMissingIngredients when needed)
                results.add(r);
            }
            return results;
        }
    }

    public List<String> getMissingIngredients(int recipeId, List<String> userIngredients) throws SQLException {
        if (userIngredients == null) userIngredients = new ArrayList<>();
        String sql = "SELECT i.name " +
                     "FROM recipe_ingredients ri " +
                     "JOIN ingredients i ON ri.ingredient_id = i.id " +
                     "WHERE ri.recipe_id = ? AND i.name <> ALL (?::text[])";

        try (Connection conn = DatabaseHandler.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, recipeId);
            Array arr = conn.createArrayOf("text", userIngredients.toArray(new String[0]));
            ps.setArray(2, arr);
            ResultSet rs = ps.executeQuery();
            List<String> missing = new ArrayList<>();
            while (rs.next()) {
                missing.add(rs.getString("name"));
            }
            return missing;
        }
    }

    public List<String> listAllIngredientNames() throws SQLException {
        String sql = "SELECT name FROM ingredients ORDER BY name";
        try (Connection conn = DatabaseHandler.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            List<String> out = new ArrayList<>();
            while (rs.next()) out.add(rs.getString("name"));
            return out;
        }
    }

    // ---------- Favorites support ----------
    // Save a recipe as favorite (optional note)
    public void saveFavorite(int recipeId, String note) throws SQLException {
        String sql = "INSERT INTO favorites (recipe_id, note) VALUES (?, ?)";
        try (Connection conn = DatabaseHandler.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, recipeId);
            ps.setString(2, note);
            ps.executeUpdate();
        }
    }

    // Remove favorite by id (favorites table id)
    public void removeFavorite(int favoriteId) throws SQLException {
        String sql = "DELETE FROM favorites WHERE id = ?";
        try (Connection conn = DatabaseHandler.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, favoriteId);
            ps.executeUpdate();
        }
    }

    // List favorites with recipe details (returns Recipe objects with an overloaded id representing recipe id;
    // favorite database id will be set as negative id in Recipe.matchedCount field for later removal convenience)
    public List<Recipe> listFavorites() throws SQLException {
        String sql = "SELECT f.id AS fav_id, r.id AS recipe_id, r.name, r.instructions " +
                     "FROM favorites f JOIN recipes r ON f.recipe_id = r.id ORDER BY f.saved_at DESC";
        try (Connection conn = DatabaseHandler.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            List<Recipe> out = new ArrayList<>();
            while (rs.next()) {
                Recipe r = new Recipe(rs.getInt("recipe_id"),
                                      rs.getString("name"),
                                      rs.getString("instructions"));
                // store favorites table id into matchedCount temporarily so UI can remove by fav id
                r.setMatchedCount(rs.getInt("fav_id"));
                out.add(r);
            }
            return out;
        }
    }
}
