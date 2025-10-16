package com.example.recipefinder.ui;

import com.example.recipefinder.db.RecipeDAO;
import com.example.recipefinder.model.Recipe;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.geometry.Insets;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.control.*;
import javafx.scene.input.KeyCode;
import javafx.scene.layout.*;

import java.util.*;
import java.util.stream.Collectors;

public class UIManager {
    private BorderPane root;
    private TextField inputField;
    private CheckBox onlyExact;
    private RecipeDAO dao;
    private List<String> knownIngredients;

    public UIManager() {
        root = new BorderPane();
        root.setPadding(new Insets(12));
        try {
            dao = new RecipeDAO();
            knownIngredients = dao.listAllIngredientNames();
        } catch (Exception e) {
            knownIngredients = new ArrayList<>();
        }
        root.setTop(buildInputArea());
        root.setCenter(new Label("Enter ingredients and press Search"));
    }

    public Parent getRoot() { return root; }

    private Node buildInputArea() {
        HBox topBox = new HBox(8);
        topBox.setPadding(new Insets(8, 0, 8, 0));

        inputField = new TextField();
        inputField.setPromptText("Enter ingredients (comma separated), e.g. egg, bread, butter");
        HBox.setHgrow(inputField, Priority.ALWAYS);

        // Simple autocomplete: press TAB to complete the last token
        inputField.setOnKeyPressed(evt -> {
            if (evt.getCode() == KeyCode.TAB) {
                String txt = inputField.getText();
                String[] parts = txt.split(",");
                String last = parts[parts.length - 1].trim().toLowerCase();
                if (!last.isEmpty()) {
                    Optional<String> match = knownIngredients.stream()
                            .filter(i -> i.startsWith(last))
                            .findFirst();
                    match.ifPresent(m -> {
                        parts[parts.length - 1] = " " + m;
                        inputField.setText(String.join(",", parts));
                        inputField.positionCaret(inputField.getText().length());
                    });
                }
                evt.consume();
            }
        });

        Button searchBtn = new Button("Search");
        searchBtn.setOnAction(e -> {
            List<String> userIngredients = parseInput(inputField.getText());
            performSearch(userIngredients);
        });

        onlyExact = new CheckBox("Only show recipes I can make now");
        onlyExact.setSelected(false);

        Button viewFavBtn = new Button("View Favorites");
        viewFavBtn.setOnAction(e -> showFavoritesDialog());

        topBox.getChildren().addAll(inputField, searchBtn, onlyExact, viewFavBtn);
        return topBox;
    }

    private List<String> parseInput(String raw) {
        return Arrays.stream(raw.split(","))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .map(String::toLowerCase)
                .collect(Collectors.toList());
    }

    private void performSearch(List<String> userIngredients) {
        VBox resultsBox = new VBox(8);
        resultsBox.setPadding(new Insets(10));
        if (userIngredients.isEmpty()) {
            resultsBox.getChildren().add(new Label("Please enter at least one ingredient."));
            root.setCenter(resultsBox);
            return;
        }

        try {
            List<Recipe> matches = dao.findByIngredients(userIngredients);
            if (onlyExact.isSelected()) {
                matches = matches.stream()
                        .filter(r -> r.getMatchedCount() == r.getTotalCount())
                        .collect(Collectors.toList());
            }

            if (matches.isEmpty()) {
                resultsBox.getChildren().add(new Label("No recipes found. Try adding more ingredients."));
            } else {
                for (Recipe r : matches) {
                    double pct = (r.getTotalCount() == 0) ? 0.0 : (r.getMatchedCount() * 100.0 / r.getTotalCount());
                    VBox card = new VBox(6);
                    card.setPadding(new Insets(8));
                    card.setStyle("-fx-border-color: #d0d0d0; -fx-background-color: #fff;");

                    Label title = new Label(r.getName() + String.format("  (%.0f%% match)", pct));
                    title.setStyle("-fx-font-weight: bold; -fx-font-size: 14px;");

                    Label instr = new Label("Instructions: " + r.getInstructions());
                    List<String> missing = dao.getMissingIngredients(r.getId(), userIngredients);
                    Label missLabel = new Label("Missing: " + (missing.isEmpty() ? "None" : String.join(", ", missing)));

                    HBox actions = new HBox(8);
                    Button saveFav = new Button("Save to Favorites");
                    saveFav.setOnAction(ev -> {
                        TextInputDialog dialog = new TextInputDialog();
                        dialog.setHeaderText("Optional note for favorite (or leave empty)");
                        dialog.setTitle("Save Favorite");
                        dialog.setContentText("Note:");
                        Optional<String> res = dialog.showAndWait();
                        String note = res.orElse("");
                        try {
                            dao.saveFavorite(r.getId(), note);
                            Alert a = new Alert(Alert.AlertType.INFORMATION, "Saved to favorites.");
                            a.show();
                        } catch (Exception ex) {
                            Alert a = new Alert(Alert.AlertType.ERROR, "Error saving favorite: " + ex.getMessage());
                            a.show();
                            ex.printStackTrace();
                        }
                    });

                    Button details = new Button("Show Details");
                    details.setOnAction(ev -> {
                        Alert d = new Alert(Alert.AlertType.INFORMATION);
                        d.setTitle(r.getName());
                        d.setHeaderText(r.getName());
                        String body = "Instructions:\n" + r.getInstructions() + "\n\nMissing: " + (missing.isEmpty() ? "None" : String.join(", ", missing));
                        d.setContentText(body);
                        d.showAndWait();
                    });

                    actions.getChildren().addAll(saveFav, details);
                    card.getChildren().addAll(title, instr, missLabel, actions);
                    resultsBox.getChildren().add(card);
                }
            }
        } catch (Exception ex) {
            resultsBox.getChildren().add(new Label("Error: " + ex.getMessage()));
            ex.printStackTrace();
        }
        root.setCenter(new ScrollPane(resultsBox));
    }

    private void showFavoritesDialog() {
        try {
            List<Recipe> favs = dao.listFavorites();
            if (favs.isEmpty()) {
                Alert a = new Alert(Alert.AlertType.INFORMATION, "No favorites saved yet.");
                a.show();
                return;
            }

            Dialog<ButtonType> dialog = new Dialog<>();
            dialog.setTitle("Favorites");
            DialogPane pane = dialog.getDialogPane();

            VBox content = new VBox(8);
            content.setPadding(new Insets(10));

            for (Recipe r : favs) {
                VBox card = new VBox(6);
                card.setPadding(new Insets(8));
                card.setStyle("-fx-border-color: #cfcfcf; -fx-background-color: #fff;");
                Label title = new Label(r.getName());
                title.setStyle("-fx-font-weight: bold;");
                Label instr = new Label("Instructions: " + r.getInstructions());
                Button remove = new Button("Remove Favorite");
                // recall: we put favorites.id into matchedCount to carry it through
                int favId = r.getMatchedCount();
                remove.setOnAction(ev -> {
                    try {
                        dao.removeFavorite(favId);
                        dialog.close();
                        showFavoritesDialog(); // refresh
                    } catch (Exception ex) {
                        new Alert(Alert.AlertType.ERROR, "Error removing favorite: " + ex.getMessage()).show();
                    }
                });
                card.getChildren().addAll(title, instr, remove);
                content.getChildren().add(card);
            }

            pane.setContent(new ScrollPane(content));
            pane.getButtonTypes().add(ButtonType.CLOSE);
            dialog.showAndWait();

        } catch (Exception ex) {
            new Alert(Alert.AlertType.ERROR, "Error loading favorites: " + ex.getMessage()).show();
            ex.printStackTrace();
        }
    }
}
