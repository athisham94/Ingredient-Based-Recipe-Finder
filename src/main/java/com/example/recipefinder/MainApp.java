package com.example.recipefinder;

import com.example.recipefinder.ui.UIManager;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class MainApp extends Application {
    @Override
    public void start(Stage stage) throws Exception {
        UIManager ui = new UIManager();
        Scene scene = new Scene(ui.getRoot(), 900, 600);
        stage.setTitle("Ingredient-Based Recipe Finder");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}
