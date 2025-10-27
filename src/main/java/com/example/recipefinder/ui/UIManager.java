package com.example.recipefinder.ui;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import com.example.recipefinder.db.DatabaseHandler;
import com.example.recipefinder.db.RecipeDAO;
import com.example.recipefinder.logic.RecipeMatcher;
import com.example.recipefinder.model.Recipe;

import javafx.animation.PauseTransition;
import javafx.application.Platform;
import javafx.collections.ObservableList;
import javafx.concurrent.Task;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.geometry.Side;
import javafx.scene.Node;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.CheckBox;
import javafx.scene.control.ComboBox;
import javafx.scene.control.ContextMenu;
import javafx.scene.control.CustomMenuItem;
import javafx.scene.control.Dialog;
import javafx.scene.control.Label;
import javafx.scene.control.ListCell;
import javafx.scene.control.ListView;
import javafx.scene.control.ProgressBar;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyCode;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.Region;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.util.Duration;

/**
 * UIManager - full-featured UI for Ingredient-Based Recipe Finder
 * - paste this file in src/main/java/com/example/recipefinder/ui/UIManager.java
 */
public class UIManager {

    private final BorderPane root;

    // Top controls
    private final TextField inputField;
    private final Button searchBtn;
    private final CheckBox doableOnlyCheck;
    private final ComboBox<String> categoryBox;
    private final Button viewFavoritesBtn;

    // Results
    private final ListView<Recipe> resultsList;
    private final Label statusLabel;
    private final ContextMenu suggestionsMenu = new ContextMenu();

    // Pagination
    private final Button loadMoreBtn = new Button("Load more");
    private final int PAGE_SIZE = 30;
    private int currentOffset = 0;

    // DAO + caches
    private final RecipeDAO dao = new RecipeDAO();
    private final Map<String, Integer> ingredientFreq = new HashMap<>();
    private List<String> allDistinctIngredients = new ArrayList<>();

    // Debounce
    private final PauseTransition debounce = new PauseTransition(Duration.millis(350));

    public UIManager() {
        root = new BorderPane();
        VBox main = new VBox(12);
        main.setPadding(new Insets(16));
        main.setAlignment(Pos.TOP_CENTER);

        Label title = new Label("🍳 Ingredient-Based Recipe Finder");
        title.setFont(new Font("Arial", 24));

        // Input row: ingredients, search, doable toggle, category, favorites
        inputField = new TextField();
        inputField.setPromptText("Enter ingredients (comma-separated) — e.g. egg, rice, salt");
        inputField.setPrefWidth(520);
        inputField.setStyle("-fx-background-radius: 8; -fx-border-radius: 8; -fx-border-color: #ddd; -fx-padding: 6 8 6 8;");

        searchBtn = createPrimaryButton("🔍 Search");
        doableOnlyCheck = new CheckBox("Only doable");
        categoryBox = new ComboBox<>();
        categoryBox.setPromptText("Category");
        categoryBox.getItems().addAll("All", "Breakfast", "Lunch", "Dinner", "Dessert", "Snack");
        categoryBox.setValue("All");

        viewFavoritesBtn = createSecondaryButton("★ Favorites");
        viewFavoritesBtn.setOnAction(e -> showFavoritesDialog());

        HBox topRow = new HBox(8, inputField, searchBtn, doableOnlyCheck, categoryBox, viewFavoritesBtn);
        topRow.setAlignment(Pos.CENTER_LEFT);

        statusLabel = new Label("Ready");
        resultsList = new ListView<>();
        resultsList.setPrefHeight(520);

        // List cell factory: virtualized card rendering
        resultsList.setCellFactory(lv -> new ListCell<>() {
            @Override
            protected void updateItem(Recipe recipe, boolean empty) {
                super.updateItem(recipe, empty);
                if (empty || recipe == null) {
                    setGraphic(null);
                } else {
                    setGraphic(buildCard(recipe));
                }
            }
        });

        // Load more handler
        loadMoreBtn.setOnAction(e -> fetchPageAndAppend());

        main.getChildren().addAll(title, topRow, statusLabel, resultsList);
        root.setCenter(main);

        // Events: debounce, enter key, search button
        searchBtn.setOnAction(e -> performSearch());
        debounce.setOnFinished(ev -> performSearch());
        inputField.setOnKeyReleased(ev -> {
            if (ev.getCode() == KeyCode.ENTER) performSearch();
            else {
                debounce.playFromStart();
                showSuggestionsForCurrentToken(inputField.getText());
            }
        });

        // Load autocompletes and ingredient frequencies in background
        loadDistinctIngredientsInBackground();
        loadIngredientFrequenciesInBackground();
    }

    public Node getRoot() {
        return root;
    }

    // small helper button creators
    private Button createPrimaryButton(String text) {
        Button b = new Button(text);
        b.setStyle("-fx-background-color: linear-gradient(#4b6cb7, #182848); -fx-text-fill: white; -fx-background-radius: 8; -fx-padding: 6 12 6 12; -fx-font-weight: 600;");
        return b;
    }
    private Button createSecondaryButton(String text) {
        Button b = new Button(text);
        b.setStyle("-fx-background-color: transparent; -fx-border-color: #ccc; -fx-border-radius: 8; -fx-padding: 6 10 6 10;");
        return b;
    }

    // ---------- Autocomplete ----------
    private void loadDistinctIngredientsInBackground() {
        Task<List<String>> t = new Task<>() {
            @Override
            protected List<String> call() {
                try {
                    return dao.getDistinctIngredients();
                } catch (Exception ex) {
                    ex.printStackTrace();
                    return List.of();
                }
            }
        };
        t.setOnSucceeded(e -> allDistinctIngredients = t.getValue().stream()
                .map(String::trim).filter(s -> !s.isEmpty()).sorted().collect(Collectors.toList()));
        new Thread(t).start();
    }

    private void showSuggestionsForCurrentToken(String raw) {
        if (raw == null) { suggestionsMenu.hide(); return; }
        String token = raw;
        int idx = raw.lastIndexOf(',');
        if (idx >= 0) token = raw.substring(idx + 1);
        token = token.trim().toLowerCase();
        if (token.isEmpty()) { suggestionsMenu.hide(); return; }

        final String tokenFinal = token;
        List<String> filtered = allDistinctIngredients.stream()
                .filter(s -> s.contains(tokenFinal))
                .sorted()
                .limit(8)
                .collect(Collectors.toList());
        if (filtered.isEmpty()) { suggestionsMenu.hide(); return; }

        List<CustomMenuItem> items = new ArrayList<>();
        for (String s : filtered) {
            final String suggestion = s;
            Label lbl = new Label(suggestion);
            lbl.setPadding(new Insets(6));
            CustomMenuItem item = new CustomMenuItem(lbl, true);
            item.setOnAction(evt -> {
                String before = "";
                int i = inputField.getText().lastIndexOf(',');
                if (i >= 0) before = inputField.getText().substring(0, i + 1);
                inputField.setText(before + " " + suggestion);
                inputField.positionCaret(inputField.getText().length());
                suggestionsMenu.hide();
            });
            items.add(item);
        }
        suggestionsMenu.getItems().setAll(items);
        if (!suggestionsMenu.isShowing()) suggestionsMenu.show(inputField, Side.BOTTOM, 0, 0);
    }

    // ---------- Ingredient frequency loader (for rarity scoring) ----------
    private void loadIngredientFrequenciesInBackground() {
        Task<Map<String, Integer>> t = new Task<>() {
            @Override
            protected Map<String, Integer> call() {
                Map<String, Integer> map = new HashMap<>();
                String sql = "SELECT lower(trim(unnest(string_to_array(ingredients, ',')))) AS ing, count(*) AS cnt FROM recipes GROUP BY ing";
                try (Connection conn = DatabaseHandler.getConnection();
                     PreparedStatement ps = conn.prepareStatement(sql);
                     ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        String ing = rs.getString("ing");
                        int cnt = rs.getInt("cnt");
                        if (ing != null && !ing.isBlank()) map.put(ing.trim(), cnt);
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                return map;
            }
        };
        t.setOnSucceeded(e -> ingredientFreq.putAll(t.getValue()));
        new Thread(t).start();
    }

    // ---------- parse tokens helper ----------
    private List<String> parseTokens(String raw) {
        if (raw == null || raw.isBlank()) return List.of();
        return Arrays.stream(raw.split(","))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .map(String::toLowerCase)
                .collect(Collectors.toList());
    }

    // ---------- Search & pagination ----------
    private void performSearch() {
        currentOffset = 0;
        resultsList.getItems().clear();
        fetchPageAndAppend();
    }

    private void fetchPageAndAppend() {
        final List<String> tokens = parseTokens(inputField.getText());
        if (tokens.isEmpty()) {
            statusLabel.setText("Please enter ingredient(s).");
            return;
        }
        searchBtn.setDisable(true);
        statusLabel.setText("Searching...");

        // call matcher in background with pagination and category filter
        Task<List<Recipe>> task = new Task<>() {
            @Override
            protected List<Recipe> call() {
                String selectedCategory = categoryBox.getValue();
                // get page from matcher (it normalizes tokens and computes match %)
                List<Recipe> page = RecipeMatcher.matchRecipes(tokens, doableOnlyCheck.isSelected(), ingredientFreq, PAGE_SIZE, currentOffset);
                if (selectedCategory != null && !"All".equalsIgnoreCase(selectedCategory)) {
                    page = page.stream().filter(r -> selectedCategory.equalsIgnoreCase(Optional.ofNullable(r.getCategory()).orElse(""))).collect(Collectors.toList());
                }
                return page;
            }
        };

        task.setOnSucceeded(e -> {
            List<Recipe> page = task.getValue();
            if ((page == null || page.isEmpty()) && currentOffset == 0) {
                statusLabel.setText("No recipes found.");
                root.setBottom(null);
            } else {
                ObservableList<Recipe> items = resultsList.getItems();
                items.addAll(page);
                resultsList.setItems(items);
                statusLabel.setText("Showing " + (currentOffset + 1) + " - " + (currentOffset + page.size()));
                if (page.size() == PAGE_SIZE) {
                    HBox bottom = new HBox(loadMoreBtn);
                    bottom.setPadding(new Insets(8));
                    bottom.setAlignment(Pos.CENTER);
                    root.setBottom(bottom);
                } else {
                    root.setBottom(null);
                }
                currentOffset += page.size();
            }
            searchBtn.setDisable(false);
        });

        task.setOnFailed(e -> {
            statusLabel.setText("Search failed: " + task.getException().getMessage());
            searchBtn.setDisable(false);
            root.setBottom(null);
        });

        new Thread(task).start();
    }
    
    private Node buildCard(Recipe r) {
        HBox container = new HBox(10);
        container.setPadding(new Insets(10));
        container.setStyle("-fx-background-color: white; -fx-border-color: #eee; -fx-border-radius: 8; -fx-background-radius: 8;");

        // left: optional image
        if (r.getImagePath() != null && !r.getImagePath().isBlank()) {
            try {
                Image img = new Image("file:" + r.getImagePath(), 100, 80, true, true, true);
                ImageView iv = new ImageView(img);
                iv.setFitWidth(100);
                iv.setFitHeight(80);
                container.getChildren().add(iv);
            } catch (Exception ignored) { /* ignore bad image paths */ }
        }

        // right: details column
        VBox col = new VBox(6);
        col.setPrefWidth(620);

        HBox header = new HBox();
        header.setAlignment(Pos.CENTER_LEFT);
        Text title = new Text(r.getName());
        title.setStyle("-fx-font-weight: 700; -fx-font-size: 13;");
        Region spacer = new Region();
        HBox.setHgrow(spacer, Priority.ALWAYS);
        Label pct = new Label(String.format("%.0f%%", r.getMatchPercent()));
        pct.setStyle("-fx-font-weight: 600;");
        header.getChildren().addAll(title, spacer, pct);

        ProgressBar pb = new ProgressBar(Math.min(1.0, r.getMatchPercent() / 100.0));
        pb.setPrefWidth(260);

        Label ingred = new Label("Ingredients: " + Optional.ofNullable(r.getIngredients()).orElse("—"));
        ingred.setWrapText(true);

        HBox chips = new HBox(6);
        List<String> missing = Optional.ofNullable(r.getMissingIngredients()).orElse(List.of());
        for (String m : missing) {
            Label chip = new Label(m);
            chip.setStyle("-fx-background-color: #ffecec; -fx-text-fill: #9a1f1f; -fx-padding: 4 8 4 8; -fx-background-radius: 999;");
            chips.getChildren().add(chip);
        }

        HBox actions = new HBox(8);
        Button viewBtn = createSecondaryButton("View");
        viewBtn.setOnAction(e -> showRecipeDetails(r));
        Button saveBtn = createPrimaryButton("Save");
        saveBtn.setOnAction(e -> {
            Task<Void> saveTask = new Task<>() {
                @Override
                protected Void call() throws Exception {
                    dao.saveFavorite(r.getId(), null);
                    return null;
                }
            };
            saveTask.setOnSucceeded(ev -> Platform.runLater(() ->
                    new Alert(Alert.AlertType.INFORMATION, "Saved: " + r.getName(), ButtonType.OK).showAndWait()));
            saveTask.setOnFailed(ev -> Platform.runLater(() ->
                    new Alert(Alert.AlertType.ERROR, "Failed to save favorite: " + saveTask.getException().getMessage(), ButtonType.OK).showAndWait()));
            new Thread(saveTask).start();
        });
        actions.getChildren().addAll(viewBtn, saveBtn);

        col.getChildren().addAll(header, pb, ingred, chips, actions);
        container.getChildren().add(col);
        return container;
    }

    
    private void showRecipeDetails(Recipe r) {
        Dialog<Void> d = new Dialog<>();
        d.setTitle(r.getName());
        d.getDialogPane().getButtonTypes().add(ButtonType.CLOSE);
        VBox box = new VBox(10);
        box.setPadding(new Insets(12));

        Label cat = new Label("Category: " + Optional.ofNullable(r.getCategory()).orElse("—"));
        Label qty = new Label("Quantities: " + Optional.ofNullable(r.getRecipeIngredientQuantities()).orElse("—"));
        qty.setWrapText(true);
        Label ingred = new Label("Ingredients: " + Optional.ofNullable(r.getIngredients()).orElse("—"));
        ingred.setWrapText(true);
        Label instr = new Label("Instructions:\n" + Optional.ofNullable(r.getInstructions()).orElse("—"));
        instr.setWrapText(true);

        box.getChildren().addAll(cat, qty, ingred);

        // nutrition bar / labels
        boolean hasNutrition = r.getCalories() != null || r.getProteinContent() != null || r.getFatContent() != null || r.getSugarContent() != null;
        if (hasNutrition) {
            HBox nut = new HBox(12);
            nut.getChildren().add(new Label("Calories: " + Optional.ofNullable(r.getCalories()).map(Object::toString).orElse("—")));
            nut.getChildren().add(new Label("Protein: " + Optional.ofNullable(r.getProteinContent()).map(Object::toString).orElse("—")));
            nut.getChildren().add(new Label("Fat: " + Optional.ofNullable(r.getFatContent()).map(Object::toString).orElse("—")));
            nut.getChildren().add(new Label("Sugar: " + Optional.ofNullable(r.getSugarContent()).map(Object::toString).orElse("—")));
            box.getChildren().add(nut);
        }

        box.getChildren().add(instr);

        ScrollPane sp = new ScrollPane(box);
        sp.setFitToWidth(true);
        d.getDialogPane().setContent(sp);
        d.showAndWait();
    }

    // ---------- Favorites dialog ----------
    private void showFavoritesDialog() {
        Task<List<Recipe>> t = new Task<>() {
            @Override
            protected List<Recipe> call() throws Exception {
                return dao.listFavorites();
            }
        };
        t.setOnSucceeded(e -> {
            List<Recipe> favs = t.getValue();
            Platform.runLater(() -> {
                Dialog<Void> d = new Dialog<>();
                d.setTitle("Favorites");
                d.getDialogPane().getButtonTypes().add(ButtonType.CLOSE);
                VBox box = new VBox(8);
                box.setPadding(new Insets(8));
                if (favs == null || favs.isEmpty()) {
                    box.getChildren().add(new Label("No favorites saved."));
                } else {
                    for (Recipe r : favs) {
                        HBox row = new HBox(8);
                        Label lbl = new Label(r.getName());
                        Button open = createSecondaryButton("Open");
                        open.setOnAction(ev -> {
                            d.close();
                            showRecipeDetails(r);
                        });
                        Button remove = createSecondaryButton("Remove");
                        remove.setOnAction(ev -> {
                            Task<Void> rem = new Task<>() {
                                @Override
                                protected Void call() throws Exception {
                                    dao.removeFavorite(r.getId());
                                    return null;
                                }
                            };
                            rem.setOnSucceeded(ev2 -> box.getChildren().remove(row));
                            rem.setOnFailed(ev2 -> Platform.runLater(() -> new Alert(Alert.AlertType.ERROR, "Failed to remove: " + rem.getException().getMessage(), ButtonType.OK).showAndWait()));
                            new Thread(rem).start();
                        });
                        row.getChildren().addAll(lbl, open, remove);
                        box.getChildren().add(row);
                    }
                }
                d.getDialogPane().setContent(new ScrollPane(box));
                d.showAndWait();
            });
        });
        t.setOnFailed(e -> Platform.runLater(() -> new Alert(Alert.AlertType.ERROR, "Failed to load favorites: " + t.getException().getMessage(), ButtonType.OK).showAndWait()));
        new Thread(t).start();
    }

    
}

