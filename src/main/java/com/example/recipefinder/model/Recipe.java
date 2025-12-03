package com.example.recipefinder.model;

import java.util.ArrayList;
import java.util.List;


 //Recipe model:includes runtime fields for matching & scoring.
 
public class Recipe {
    private int id;
    private String name;
    private String description;
    private String category;
    private String ingredients;                   
    private String recipeIngredientQuantities;    
    private Double calories;
    private Double fatContent;
    private Double fiberContent;
    private Double sugarContent;
    private Double proteinContent;
    private String instructions;
    private String imagePath;

    // Runtime-only
    private double matchPercent = 0.0;
    private double matchScore = 0.0;              // rarity, weighted score
    private List<String> missingIngredients = new ArrayList<>();

    // getters setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getIngredients() { return ingredients; }
    public void setIngredients(String ingredients) { this.ingredients = ingredients; }

    public String getRecipeIngredientQuantities() { return recipeIngredientQuantities; }
    public void setRecipeIngredientQuantities(String recipeIngredientQuantities) {
        this.recipeIngredientQuantities = recipeIngredientQuantities;
    }

    public Double getCalories() { return calories; }
    public void setCalories(Double calories) { this.calories = calories; }

    public Double getFatContent() { return fatContent; }
    public void setFatContent(Double fatContent) { this.fatContent = fatContent; }

    public Double getFiberContent() { return fiberContent; }
    public void setFiberContent(Double fiberContent) { this.fiberContent = fiberContent; }

    public Double getSugarContent() { return sugarContent; }
    public void setSugarContent(Double sugarContent) { this.sugarContent = sugarContent; }

    public Double getProteinContent() { return proteinContent; }
    public void setProteinContent(Double proteinContent) { this.proteinContent = proteinContent; }

    public String getInstructions() { return instructions; }
    public void setInstructions(String instructions) { this.instructions = instructions; }

    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }

    // Runtime fields
    public double getMatchPercent() { return matchPercent; }
    public void setMatchPercent(double matchPercent) { this.matchPercent = matchPercent; }

    public double getMatchScore() { return matchScore; }
    public void setMatchScore(double matchScore) { this.matchScore = matchScore; }

    public List<String> getMissingIngredients() { return missingIngredients; }
    public void setMissingIngredients(List<String> missingIngredients) {
        this.missingIngredients = missingIngredients == null ? new ArrayList<>() : missingIngredients;
    }
}
