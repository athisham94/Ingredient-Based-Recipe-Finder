INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES
('Egg Fried Rice', 'Quick rice dish with eggs and soy sauce.', 'Main Course',
 'eggs, rice, soy sauce, oil', '2 eggs, 1 cup rice, 1 tbsp soy sauce, 1 tbsp oil',
 300, 10, 2, 3, 12, '1. Cook rice.\n2. Scramble eggs.\n3. Mix everything.', NULL),

('Pancakes', 'Fluffy breakfast pancakes.', 'Breakfast',
 'flour, egg, milk, sugar, butter', '1 cup flour, 1 egg, 1 cup milk, 2 tbsp sugar, 1 tbsp butter',
 220, 6, 1, 10, 5, '1. Mix. 2. Cook on pan.', NULL);
