DROP TABLE IF EXISTS recipes CASCADE;

CREATE TABLE recipes (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    category TEXT,
    ingredients TEXT,
    recipeingredientquantities TEXT,
    calories NUMERIC,
    fat_content NUMERIC,
    fiber_content NUMERIC,
    sugar_content NUMERIC,
    protein_content NUMERIC,
    instructions TEXT,
    image_path TEXT
);
