package com.example.recipefinder;

import com.example.recipefinder.ui.UIManager;

import javafx.application.Application;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

/**
 * Ingredient-Based Recipe Finder - fixed MainApp
 * Casts UIManager.getRoot() (Node) to Parent so Scene creation compiles.
 */
public class MainApp extends Application {

    @Override
    public void start(Stage primaryStage) {
        UIManager ui = new UIManager();

        // ui.getRoot() returns a Node; Scene requires a Parent.
        // Cast to Parent to satisfy the API without modifying UIManager.
        Parent root = (Parent) ui.getRoot();

        Scene scene = new Scene(root, 950, 650);
        primaryStage.setTitle("Ingredient-Based Recipe Finder");
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
