package com.example.recipefinder.ui;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.example.recipefinder.db.RecipeDAO;
import com.example.recipefinder.logic.RecipeMatcher;
import com.example.recipefinder.model.Recipe;

import javafx.application.Platform;
import javafx.concurrent.Task;
import javafx.geometry.Insets;
import javafx.scene.Node;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.Region;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;

/**
 * JavaFX UI Manager
 * Builds the complete frontend dynamically in Java code (no FXML).
 * Features:
 *  - Input TextField for comma-separated ingredients
 *  - Search button to query DB
 *  - Scrollable list of result “cards”
 *  - Each card shows name, ingredients, instructions, and match %
 */
public class UIManager {
    private final VBox root;
    private final TextField inputField;
    private final Button searchBtn;
    private final VBox resultsBox;
    private final Label statusLabel;
    private final RecipeDAO dao = new RecipeDAO();

    public UIManager() {
        root = new VBox(10);
        root.setPadding(new Insets(12));

        // Top input bar
        HBox top = new HBox(8);
        inputField = new TextField();
        inputField.setPromptText("Enter ingredients, comma-separated (e.g. egg, rice, salt)");
        inputField.setPrefWidth(480);
        searchBtn = new Button("Search");
        searchBtn.setOnAction(e -> onSearch());
        top.getChildren().addAll(inputField, searchBtn);

        statusLabel = new Label();
        resultsBox = new VBox(10);

        ScrollPane sp = new ScrollPane(resultsBox);
        sp.setFitToWidth(true);
        sp.setPrefHeight(500);

        root.getChildren().addAll(top, statusLabel, sp);
    }

    public Node getRoot() {
        return root;
    }

    /** Parse user input into lowercase tokens */
    private List<String> parseTokens(String raw) {
        if (raw == null || raw.isBlank()) return new ArrayList<>();
        return Arrays.stream(raw.split(","))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .map(String::toLowerCase)
                .toList();
    }

    /** Triggered when user clicks Search */
    private void onSearch() {
        String raw = inputField.getText();
        List<String> tokens = parseTokens(raw);
        if (tokens.isEmpty()) {
            statusLabel.setText("Please enter one or more ingredients.");
            return;
        }

        statusLabel.setText("Searching...");
        resultsBox.getChildren().clear();

        // Run search in background to avoid freezing UI
        Task<List<Recipe>> task = new Task<>() {
            @Override
            protected List<Recipe> call() {
                try {
                    List<Recipe> candidates = dao.findByTokens(tokens, 500);
                    List<Recipe> matched = new ArrayList<>();
                    for (Recipe r : candidates) {
                        double pct = RecipeMatcher.computeMatchPercent(tokens, r);
                        if (pct > 0) matched.add(r);
                    }
                    matched.sort((a, b) -> Double.compare(b.getMatchPercent(), a.getMatchPercent()));
                    return matched;
                } catch (SQLException ex) {
                    ex.printStackTrace();
                    return List.of();
                }
            }
        };

        task.setOnSucceeded(evt -> {
            List<Recipe> results = task.getValue();
            if (results.isEmpty()) {
                statusLabel.setText("No recipes found. Try adding more ingredients.");
            } else {
                statusLabel.setText("Found " + results.size() + " recipes.");
                results.forEach(r -> resultsBox.getChildren().add(buildCard(r)));
            }
        });

        task.setOnFailed(evt -> {
            statusLabel.setText("Search failed: " + task.getException().getMessage());
            task.getException().printStackTrace();
        });

        Thread t = new Thread(task);
        t.setDaemon(true);
        t.start();
    }

    /** Create a styled card for each recipe */
    private Node buildCard(Recipe r) {
        VBox card = new VBox(6);
        card.setPadding(new Insets(10));
        card.setStyle("""
                -fx-background-color: white;
                -fx-border-color: #ccc;
                -fx-border-radius: 8;
                -fx-background-radius: 8;
                -fx-effect: dropshadow(two-pass-box, rgba(0,0,0,0.08), 5, 0, 2, 2);
                """);

        HBox header = new HBox(10);
        Text title = new Text(r.getName());
        title.setStyle("-fx-font-weight: bold; -fx-font-size: 14;");
        Text meta = new Text(String.format("%.0f%% match • %s",
                r.getMatchPercent(),
                r.getCategory() == null ? "Uncategorized" : r.getCategory()));
        meta.setStyle("-fx-fill: #555; -fx-font-size: 11;");
        Region spacer = new Region();
        HBox.setHgrow(spacer, Priority.ALWAYS);
        header.getChildren().addAll(title, spacer, meta);

        Label ingred = new Label("Ingredients: " + safe(r.getIngredients()));
        ingred.setWrapText(true);
        Label instr = new Label("Instructions: " + safe(r.getInstructions()));
        instr.setWrapText(true);

        HBox actions = new HBox(6);
        Button viewBtn = new Button("View Details");
        viewBtn.setOnAction(e -> showRecipeDetails(r));
        actions.getChildren().addAll(viewBtn);

        card.getChildren().addAll(header, ingred, instr, actions);
        return card;
    }

    /** Display a pop-up dialog with full recipe details */
    private void showRecipeDetails(Recipe r) {
        Platform.runLater(() -> {
            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle(r.getName());
            alert.setHeaderText(null);

            StringBuilder sb = new StringBuilder();
            sb.append("Category: ").append(safe(r.getCategory())).append("\n\n");
            sb.append("Ingredients:\n").append(safe(r.getIngredients())).append("\n\n");
            sb.append("Quantities:\n").append(safe(r.getRecipeIngredientQuantities())).append("\n\n");
            sb.append("Instructions:\n").append(safe(r.getInstructions())).append("\n\n");
            sb.append("Calories: ").append(safeNum(r.getCalories())).append("\n");
            sb.append("Protein: ").append(safeNum(r.getProteinContent())).append("\n");
            sb.append("Fat: ").append(safeNum(r.getFatContent())).append("\n");
            sb.append("Fiber: ").append(safeNum(r.getFiberContent())).append("\n");
            sb.append("Sugar: ").append(safeNum(r.getSugarContent())).append("\n");

            TextArea area = new TextArea(sb.toString());
            area.setEditable(false);
            area.setWrapText(true);
            area.setPrefWidth(500);
            area.setPrefHeight(300);
            alert.getDialogPane().setContent(area);
            alert.showAndWait();
        });
    }

    private String safe(String s) {
        return (s == null || s.isBlank()) ? "—" : s;
    }

    private String safeNum(Double d) {
        return d == null ? "—" : String.format("%.1f", d);
    }
}
