INSERT INTO ingredients (name) VALUES
('egg'), ('milk'), ('bread'), ('butter'), ('cheese'),
('tomato'), ('onion'), ('rice'), ('salt'), ('pepper'),
('pasta'), ('olive oil'), ('garlic'), ('potato');

INSERT INTO recipes (name, instructions) VALUES
('Scrambled Eggs', 'Beat eggs with milk, cook in butter, season with salt and pepper.'),
('Grilled Cheese', 'Butter bread, add cheese, grill until golden.'),
('Tomato Pasta', 'Cook pasta, make sauce with tomato, garlic and olive oil.'),
('Fried Rice', 'Cook rice, stir-fry with egg, onion, garlic, and soy/salt.'),
('Mashed Potato', 'Boil potatoes, mash with butter and milk.');


INSERT INTO recipe_ingredients (recipe_id, ingredient_id) VALUES
(1, (SELECT id FROM ingredients WHERE name='egg')),
(1, (SELECT id FROM ingredients WHERE name='milk')),
(1, (SELECT id FROM ingredients WHERE name='butter')),
(1, (SELECT id FROM ingredients WHERE name='salt')),

(2, (SELECT id FROM ingredients WHERE name='bread')),
(2, (SELECT id FROM ingredients WHERE name='cheese')),
(2, (SELECT id FROM ingredients WHERE name='butter')),

(3, (SELECT id FROM ingredients WHERE name='pasta')),
(3, (SELECT id FROM ingredients WHERE name='tomato')),
(3, (SELECT id FROM ingredients WHERE name='garlic')),
(3, (SELECT id FROM ingredients WHERE name='olive oil')),
(3, (SELECT id FROM ingredients WHERE name='salt')),

(4, (SELECT id FROM ingredients WHERE name='rice')),
(4, (SELECT id FROM ingredients WHERE name='egg')),
(4, (SELECT id FROM ingredients WHERE name='onion')),
(4, (SELECT id FROM ingredients WHERE name='garlic')),
(4, (SELECT id FROM ingredients WHERE name='salt')),

(5, (SELECT id FROM ingredients WHERE name='potato')),
(5, (SELECT id FROM ingredients WHERE name='butter')),
(5, (SELECT id FROM ingredients WHERE name='milk')),
(5, (SELECT id FROM ingredients WHERE name='salt'));
