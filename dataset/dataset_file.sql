//connect db as owner

psql -U ahtisham -d recipefinder

//permissiom 

ALTER TABLE recipes OWNER TO recipe_user;
ALTER SEQUENCE recipes_id_seq OWNER TO recipe_user;

//view

SELECT * FROM recipes;
SELECT id, name, category, calories FROM recipes;


INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Egg Fried Rice',
  'Quick rice dish with eggs and soy sauce.',
  'Main Course',
  'eggs, rice, soy sauce, oil',
  '2 eggs, 1 cup rice, 1 tbsp soy sauce, 1 tbsp oil',
  300, 10, 2, 3, 12,
  '1. Cook rice.\n2. Scramble eggs.\n3. Mix everything together.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Pancakes',
  'Fluffy breakfast pancakes with milk and sugar.',
  'Breakfast',
  'flour, egg, milk, sugar, butter',
  '1 cup flour, 1 egg, 1 cup milk, 2 tbsp sugar, 1 tbsp butter',
  220, 6, 1, 10, 5,
  '1. Mix ingredients.\n2. Pour on pan.\n3. Cook until golden brown.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Chicken Curry',
  'Spicy Indian curry made with chicken and spices.',
  'Dinner',
  'chicken, onion, garlic, tomato, spices, oil',
  '500g chicken, 1 onion, 2 garlic cloves, 2 tomatoes, 1 tbsp curry powder',
  450, 25, 3, 5, 40,
  '1. Sauté onion and garlic.\n2. Add tomatoes and spices.\n3. Add chicken and cook for 20 min.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Vegetable Stir Fry',
  'Healthy mix of vegetables stir-fried in soy sauce.',
  'Lunch',
  'broccoli, bell pepper, carrot, soy sauce, oil',
  '1 cup broccoli, 1 bell pepper, 1 carrot, 2 tbsp soy sauce, 1 tbsp oil',
  180, 5, 4, 6, 8,
  '1. Chop vegetables.\n2. Stir-fry in hot oil.\n3. Add soy sauce and serve.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Fruit Salad',
  'A mix of fresh seasonal fruits.',
  'Dessert',
  'apple, banana, grapes, orange, honey',
  '1 apple, 1 banana, handful grapes, 1 orange, 1 tsp honey',
  150, 2, 3, 18, 2,
  '1. Chop fruits.\n2. Mix together.\n3. Drizzle honey on top.',
  NULL
);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// done



INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES 
(
  'Masala Dosa',
  'Crispy rice crepe filled with spiced potato filling.',
  'Breakfast',
  'rice, urad dal, potato, onion, mustard seeds, oil',
  '1 cup rice, 1/2 cup urad dal, 2 potatoes, 1 onion, 1 tsp mustard seeds, 1 tbsp oil',
  320, 8, 4, 2, 6,
  '1. Soak and grind rice and dal.\n2. Ferment batter.\n3. Make dosa and fill with potato masala.',
  NULL
),
(
  'Idli',
  'Soft steamed rice cakes served with chutney and sambar.',
  'Breakfast',
  'rice, urad dal, salt',
  '1 cup rice, 1/2 cup urad dal, pinch of salt',
  150, 1, 2, 0, 4,
  '1. Soak and grind rice and dal.\n2. Ferment overnight.\n3. Steam batter in idli molds.',
  NULL
),
(
  'Sambar',
  'Lentil and vegetable stew flavored with tamarind and spices.',
  'Main Course',
  'toor dal, tamarind, mixed vegetables, sambar powder, oil',
  '1 cup toor dal, 1 tbsp tamarind, 2 cups vegetables, 2 tbsp sambar powder, 1 tbsp oil',
  220, 6, 5, 4, 9,
  '1. Boil dal.\n2. Add tamarind, veggies, and spices.\n3. Simmer until cooked.',
  NULL
),
(
  'Rasam',
  'Spicy, tangy South Indian soup made with tamarind and spices.',
  'Lunch',
  'tamarind, tomato, rasam powder, garlic, mustard seeds',
  '1 tbsp tamarind, 2 tomatoes, 1 tbsp rasam powder, 2 garlic cloves, 1 tsp mustard seeds',
  90, 2, 2, 3, 2,
  '1. Boil tamarind water with spices.\n2. Add tomatoes and garlic.\n3. Temper and serve hot.',
  NULL
),
(
  'Medu Vada',
  'Crispy lentil doughnuts served with chutney.',
  'Breakfast',
  'urad dal, onion, green chili, oil, salt',
  '1 cup urad dal, 1 onion, 1 green chili, 2 cups oil, salt to taste',
  300, 12, 3, 1, 8,
  '1. Soak and grind dal.\n2. Shape vadas.\n3. Deep fry until golden.',
  NULL
),
(
  'Pongal',
  'Savory rice and lentil porridge seasoned with ghee and spices.',
  'Breakfast',
  'rice, moong dal, ghee, pepper, cumin',
  '1 cup rice, 1/2 cup moong dal, 2 tbsp ghee, 1 tsp pepper, 1 tsp cumin',
  280, 10, 3, 1, 7,
  '1. Cook rice and dal together.\n2. Add ghee and spices.\n3. Serve hot.',
  NULL
),
(
  'Upma',
  'Savory semolina dish with vegetables and spices.',
  'Breakfast',
  'rava, onion, mustard seeds, curry leaves, oil',
  '1 cup rava, 1 onion, 1 tsp mustard seeds, 10 curry leaves, 1 tbsp oil',
  200, 5, 3, 2, 4,
  '1. Roast rava.\n2. Sauté spices and onion.\n3. Add water and rava.\n4. Cook until fluffy.',
  NULL
),
(
  'Lemon Rice',
  'Tangy rice flavored with lemon juice, mustard, and curry leaves.',
  'Lunch',
  'rice, lemon, mustard seeds, curry leaves, peanuts',
  '2 cups rice, juice of 1 lemon, 1 tsp mustard seeds, 10 curry leaves, 2 tbsp peanuts',
  250, 6, 2, 1, 5,
  '1. Cook rice.\n2. Temper spices and peanuts.\n3. Mix with rice and lemon juice.',
  NULL
),
(
  'Curd Rice',
  'Comforting dish made with rice and yogurt.',
  'Lunch',
  'rice, curd, mustard seeds, green chili, curry leaves',
  '2 cups rice, 1 cup curd, 1 tsp mustard seeds, 1 green chili, 10 curry leaves',
  210, 4, 1, 3, 6,
  '1. Cook rice and cool.\n2. Mix with curd.\n3. Temper and pour over rice.',
  NULL
),
(
  'Puliyodarai',
  'Tamarind rice with spices and peanuts.',
  'Lunch',
  'rice, tamarind, peanuts, sesame seeds, oil',
  '2 cups rice, 2 tbsp tamarind pulp, 2 tbsp peanuts, 1 tsp sesame seeds, 1 tbsp oil',
  270, 7, 3, 4, 5,
  '1. Prepare tamarind paste with spices.\n2. Mix with cooked rice.\n3. Garnish with peanuts.',
  NULL
),
(
  'Chettinad Chicken',
  'Spicy South Indian chicken curry with roasted spices.',
  'Dinner',
  'chicken, onion, tomato, Chettinad masala, oil',
  '500g chicken, 2 onions, 2 tomatoes, 2 tbsp masala, 2 tbsp oil',
  480, 26, 2, 3, 42,
  '1. Roast and grind spices.\n2. Sauté onions and tomatoes.\n3. Add chicken and masala and cook.',
  NULL
),
(
  'Avial',
  'Mixed vegetable curry with coconut and curd.',
  'Lunch',
  'mixed vegetables, coconut, curd, curry leaves',
  '2 cups vegetables, 1/2 cup grated coconut, 1/2 cup curd, 10 curry leaves',
  180, 8, 5, 3, 5,
  '1. Cook vegetables.\n2. Add coconut paste and curd.\n3. Temper with curry leaves.',
  NULL
),
(
  'Appam',
  'Soft and spongy fermented rice pancakes.',
  'Breakfast',
  'rice, coconut, yeast, sugar',
  '1 cup rice, 1/2 cup grated coconut, 1 tsp yeast, 1 tsp sugar',
  230, 4, 2, 1, 5,
  '1. Grind and ferment batter.\n2. Pour into appam pan.\n3. Cook until edges are crisp.',
  NULL
),
(
  'Pesarattu',
  'Green gram dosa served with ginger chutney.',
  'Breakfast',
  'green gram, ginger, green chili, oil',
  '1 cup green gram, 1 inch ginger, 1 green chili, 1 tbsp oil',
  190, 4, 4, 1, 10,
  '1. Soak and grind green gram.\n2. Spread batter on pan.\n3. Cook and serve hot.',
  NULL
),
(
  'Payasam',
  'Traditional South Indian sweet pudding made with milk and vermicelli.',
  'Dessert',
  'vermicelli, milk, sugar, cardamom, ghee',
  '1 cup vermicelli, 3 cups milk, 1/2 cup sugar, 1 tsp cardamom, 1 tbsp ghee',
  280, 9, 0, 30, 6,
  '1. Roast vermicelli.\n2. Cook in milk with sugar.\n3. Add cardamom and serve warm.',
  NULL
);





///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// done






INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES
(
  'Rogan Josh',
  'Iconic Kashmiri lamb curry with aromatic spices and chili.',
  'Dinner',
  'lamb, onion, yogurt, Kashmiri chili, fennel, ginger powder, oil',
  '600g lamb, 1 onion, 1/2 cup yogurt, 2 tsp Kashmiri chili, 1 tsp fennel powder, 1 tsp dry ginger, 2 tbsp oil',
  520, 30, 2, 3, 45,
  '1. Sear lamb.\n2. Sauté onions and spices.\n3. Add yogurt and simmer until tender.',
  NULL
),
(
  'Yakhni (Mutton)',
  'Mild yogurt-based mutton curry perfumed with fennel and cardamom.',
  'Dinner',
  'mutton, yogurt, fennel, cardamom, bay leaf, oil',
  '600g mutton, 1 cup yogurt, 1 tsp fennel powder, 4 cardamoms, 1 bay leaf, 1 tbsp oil',
  480, 28, 1, 4, 42,
  '1. Boil mutton with spices.\n2. Whisk yogurt with a little broth.\n3. Simmer together until silky.',
  NULL
),
(
  'Dum Aloo (Kashmiri)',
  'Baby potatoes simmered in a vibrant chili-yogurt gravy.',
  'Lunch',
  'baby potatoes, yogurt, Kashmiri chili, fennel, ginger powder, oil',
  '400g potatoes, 3/4 cup yogurt, 2 tsp chili, 1 tsp fennel, 1 tsp dry ginger, 2 tbsp oil',
  320, 10, 5, 5, 7,
  '1. Parboil and fry potatoes.\n2. Cook spices in oil.\n3. Add yogurt and dum-cook with potatoes.',
  NULL
),
(
  'Modur Pulao',
  'Saffron-scented sweet rice with dry fruits and ghee.',
  'Dessert',
  'basmati rice, milk, sugar, saffron, almonds, raisins, ghee',
  '1 cup rice, 1 cup milk, 1/3 cup sugar, a pinch saffron, 10 almonds, 2 tbsp raisins, 2 tbsp ghee',
  380, 12, 2, 28, 6,
  '1. Soak saffron in warm milk.\n2. Parboil rice.\n3. Layer with sugar, nuts, saffron milk and steam.',
  NULL
),
(
  'Gushtaba',
  'Soft mutton meatballs in a rich yogurt gravy, a Wazwan classic.',
  'Dinner',
  'minced mutton, yogurt, cardamom, fennel, ghee',
  '500g minced mutton, 1 cup yogurt, 4 cardamoms, 1 tsp fennel powder, 1 tbsp ghee',
  560, 34, 1, 5, 44,
  '1. Pound mutton to a paste and shape balls.\n2. Poach gently.\n3. Simmer in yogurt gravy with spices.',
  NULL
),
(
  'Rista',
  'Fiery red mutton meatballs cooked in chili-rich gravy.',
  'Dinner',
  'minced mutton, onion, Kashmiri chili, ginger powder, oil',
  '500g minced mutton, 1 onion, 2 tsp chili powder, 1 tsp dry ginger, 2 tbsp oil',
  540, 32, 1, 3, 43,
  '1. Pound and shape meatballs.\n2. Fry spice base.\n3. Cook meatballs in red gravy until done.',
  NULL
),
(
  'Haak Saag',
  'Simple, comforting greens (collard/mustard) tempered with chilies.',
  'Lunch',
  'collard greens, green chili, mustard oil, asafoetida, salt',
  '3 cups chopped greens, 1 green chili, 1 tbsp mustard oil, a pinch asafoetida, salt to taste',
  120, 5, 6, 1, 4,
  '1. Boil greens with chili and salt.\n2. Finish with mustard oil and asafoetida.',
  NULL
),
(
  'Nadru Yakhni',
  'Lotus stem in a delicate yogurt-fennel sauce.',
  'Lunch',
  'lotus stem, yogurt, fennel, ginger powder, oil',
  '300g lotus stem, 3/4 cup yogurt, 1 tsp fennel, 1/2 tsp dry ginger, 1 tbsp oil',
  230, 9, 4, 3, 6,
  '1. Slice and blanch lotus stem.\n2. Simmer in yogurt with spices until tender.',
  NULL
),
(
  'Lyodur Tschaman (Paneer Kaliya)',
  'Paneer in a yellow turmeric-cardamom gravy.',
  'Dinner',
  'paneer, turmeric, yogurt, cardamom, ghee',
  '250g paneer, 1/2 tsp turmeric, 1/2 cup yogurt, 4 cardamoms, 1 tbsp ghee',
  360, 24, 0, 4, 18,
  '1. Lightly fry paneer.\n2. Simmer yogurt with turmeric and cardamom.\n3. Add paneer and cook briefly.',
  NULL
),
(
  'Kabargah',
  'Fried, spiced ribs simmered in milk and finished crisp.',
  'Dinner',
  'lamb ribs, milk, fennel, cardamom, ghee',
  '600g ribs, 1 cup milk, 1 tsp fennel, 4 cardamoms, 2 tbsp ghee',
  620, 40, 0, 4, 48,
  '1. Simmer ribs in milk and spices.\n2. Fry in ghee until crisp outside.',
  NULL
),
(
  'Tschoek Wangan (Sour Brinjal)',
  'Eggplant cooked in tangy tamarind-chili gravy.',
  'Lunch',
  'eggplant, tamarind, Kashmiri chili, mustard oil, fennel',
  '2 eggplants, 1 tbsp tamarind, 1.5 tsp chili, 1 tbsp mustard oil, 1/2 tsp fennel',
  180, 8, 5, 5, 3,
  '1. Fry eggplant pieces.\n2. Boil tamarind and spices.\n3. Combine and simmer until coated.',
  NULL
),
(
  'Nadru Monje (Lotus Stem Fritters)',
  'Crispy lotus stem fritters—popular Kashmiri snack.',
  'Breakfast',
  'lotus stem, rice flour, chili, salt, oil',
  '300g lotus stem, 1/2 cup rice flour, 1 tsp chili powder, salt, oil for frying',
  290, 12, 3, 1, 4,
  '1. Slice lotus stem.\n2. Coat with seasoned flour.\n3. Deep fry until crisp.',
  NULL
),
(
  'Mujh Gaad',
  'Fish cooked with radish in a light spiced gravy.',
  'Dinner',
  'fish, radish, mustard oil, fennel, ginger powder',
  '500g fish, 1 radish, 1 tbsp mustard oil, 1 tsp fennel, 1/2 tsp dry ginger',
  340, 14, 2, 2, 36,
  '1. Fry fish lightly.\n2. Cook radish and spices.\n3. Simmer together until flavors meld.',
  NULL
),
(
  'Gogji Razma',
  'Turnips and kidney beans braised with Kashmiri spices.',
  'Lunch',
  'turnip, kidney beans, chili, fennel, oil',
  '2 turnips, 1 cup cooked kidney beans, 1 tsp chili, 1/2 tsp fennel, 1 tbsp oil',
  260, 7, 8, 3, 10,
  '1. Sauté turnips.\n2. Add beans and spices.\n3. Simmer until tender.',
  NULL
),
(
  'Rajma (Kashmiri Style)',
  'Kidney beans in a thick, mildly spiced gravy.',
  'Main Course',
  'kidney beans, onion, tomato, chili, oil',
  '1 cup kidney beans (soaked), 1 onion, 1 tomato, 1 tsp chili, 1 tbsp oil',
  300, 8, 9, 4, 12,
  '1. Pressure cook beans.\n2. Make masala base.\n3. Combine and simmer until creamy.',
  NULL
),
(
  'Al Yakhni (Bottle Gourd Yogurt Curry)',
  'Bottle gourd simmered in a yogurt-fennel sauce.',
  'Lunch',
  'bottle gourd, yogurt, fennel, ginger powder, oil',
  '400g bottle gourd, 3/4 cup yogurt, 1 tsp fennel, 1/2 tsp dry ginger, 1 tbsp oil',
  190, 7, 3, 4, 6,
  '1. Cook bottle gourd.\n2. Add yogurt-spice mix.\n3. Simmer gently.',
  NULL
),
(
  'Taher (Turmeric Rice)',
  'Festive yellow rice scented with turmeric and ghee.',
  'Lunch',
  'basmati rice, turmeric, ghee, salt',
  '1 cup rice, 1/2 tsp turmeric, 1 tbsp ghee, salt to taste',
  260, 8, 1, 1, 5,
  '1. Parboil rice.\n2. Toss with ghee and turmeric.\n3. Steam until fluffy.',
  NULL
),
(
  'Marchwangan Korma (Chicken)',
  'Spicy red chicken korma with Kashmiri chilies.',
  'Dinner',
  'chicken, yogurt, Kashmiri chili, fennel, oil',
  '600g chicken, 3/4 cup yogurt, 2 tsp chili powder, 1 tsp fennel, 2 tbsp oil',
  450, 22, 1, 4, 42,
  '1. Brown chicken.\n2. Cook chili and spices.\n3. Add yogurt and simmer until done.',
  NULL
),
(
  'Monji Haak (Kohlrabi Greens)',
  'Kohlrabi and its greens cooked simply in mustard oil.',
  'Lunch',
  'kohlrabi, greens, mustard oil, green chili, salt',
  '2 bulbs kohlrabi with greens, 1 tbsp mustard oil, 1 green chili, salt',
  140, 6, 6, 2, 4,
  '1. Slice kohlrabi and greens.\n2. Boil with chili and salt.\n3. Finish with mustard oil.',
  NULL
),
(
  'Gaad Nadur',
  'Fish and lotus stem curry with warming spices.',
  'Dinner',
  'fish, lotus stem, chili, fennel, oil',
  '400g fish, 200g lotus stem, 1 tsp chili, 1/2 tsp fennel, 1 tbsp oil',
  330, 13, 3, 2, 34,
  '1. Fry fish.\n2. Simmer lotus stem with spices.\n3. Combine and cook through.',
  NULL
),
(
  'Kashmiri Seekh Kebab',
  'Minced meat skewers seasoned with fennel and spices.',
  'Dinner',
  'minced mutton, fennel, chili, ginger, salt, oil',
  '500g minced mutton, 1 tsp fennel, 1 tsp chili, 1 tsp ginger paste, salt, 1 tbsp oil',
  420, 24, 0, 1, 40,
  '1. Mix mince with spices.\n2. Shape on skewers.\n3. Grill or pan-fry until cooked.',
  NULL
),
(
  'Kashmiri Kulcha',
  'Crisp, layered bread often served with tea.',
  'Breakfast',
  'flour, ghee, yogurt, salt',
  '2 cups flour, 3 tbsp ghee, 1/4 cup yogurt, salt to taste',
  300, 12, 2, 2, 7,
  '1. Knead dough with yogurt.\n2. Layer with ghee and rest.\n3. Bake or pan-cook until crisp.',
  NULL
),
(
  'Tamatar Chaman',
  'Paneer simmered in a spiced tomato gravy, Kashmiri style.',
  'Dinner',
  'paneer, tomato, chili, fennel, oil',
  '250g paneer, 3 tomatoes, 1 tsp chili, 1/2 tsp fennel, 1 tbsp oil',
  340, 20, 2, 6, 18,
  '1. Fry paneer.\n2. Cook tomato and spices.\n3. Simmer paneer in the gravy.',
  NULL
),
(
  'Mooli Chatin (Radish Chutney)',
  'Tangy, spicy radish chutney—great side for breads.',
  'Lunch',
  'radish, yogurt, green chili, salt',
  '1 cup grated radish, 1/2 cup yogurt, 1 green chili, salt',
  110, 3, 2, 3, 4,
  '1. Grate radish.\n2. Mix with yogurt and chili.\n3. Chill and serve as side.',
  NULL
);

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// done


INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES
(
  'Aab Gosht',
  'Mild Kashmiri mutton cooked in milk with cardamom and saffron.',
  'Dinner',
  'mutton, milk, cardamom, saffron, ghee, salt',
  '600g mutton, 1.5 cups milk, 6 cardamoms, a pinch saffron, 1 tbsp ghee, salt to taste',
  520, 30, 0, 5, 42,
  '1. Simmer mutton with salt until nearly tender.\n2. Add milk, cardamom, saffron.\n3. Finish with ghee and cook gently.',
  NULL
),
(
  'Danival Korma',
  'Green coriander-forward mutton curry from Kashmiri Wazwan.',
  'Dinner',
  'mutton, cilantro, yogurt, ginger, fennel, oil',
  '600g mutton, 1 cup chopped cilantro, 1/2 cup yogurt, 1 tsp ginger paste, 1/2 tsp fennel powder, 2 tbsp oil',
  470, 24, 2, 4, 44,
  '1. Brown mutton.\n2. Add yogurt, cilantro paste, and spices.\n3. Simmer until meat is tender.',
  NULL
),
(
  'Methi Maaz',
  'Lamb with fenugreek leaves and warming spices.',
  'Dinner',
  'lamb, fenugreek leaves, onion, chili, mustard oil',
  '500g lamb, 1 cup methi leaves, 1 onion, 1 tsp chili powder, 1 tbsp mustard oil',
  450, 25, 2, 2, 40,
  '1. Sauté onion in mustard oil.\n2. Add lamb, chili, and methi.\n3. Cook until lamb is tender and coated.',
  NULL
),
(
  'Shab Deg',
  'Overnight-simmered turnip and mutton stew, rich and aromatic.',
  'Dinner',
  'mutton, turnip, yogurt, saffron, ghee, spices',
  '700g mutton, 3 turnips, 3/4 cup yogurt, a pinch saffron, 1 tbsp ghee, whole spices',
  560, 32, 4, 6, 48,
  '1. Brown mutton and add yogurt and spices.\n2. Layer turnips.\n3. Slow-cook until both are melt-in-mouth.',
  NULL
),
(
  'Tabakh Maaz',
  'Twice-cooked lamb ribs simmered in milk then shallow-fried.',
  'Dinner',
  'lamb ribs, milk, cardamom, ghee, salt',
  '700g ribs, 1 cup milk, 4 cardamoms, 2 tbsp ghee, salt',
  640, 42, 0, 4, 50,
  '1. Simmer ribs in milk with cardamom until tender.\n2. Drain.\n3. Shallow-fry in ghee until crisp.',
  NULL
),
(
  'Nadru Palak',
  'Lotus stem cooked with spinach and light spices.',
  'Lunch',
  'lotus stem, spinach, mustard oil, chili, ginger powder',
  '250g lotus stem, 3 cups spinach, 1 tbsp mustard oil, 1 tsp chili, 1/2 tsp dry ginger',
  190, 7, 5, 2, 6,
  '1. Blanch lotus stem.\n2. Wilt spinach with oil and spices.\n3. Combine and cook briefly.',
  NULL
),
(
  'Nadru Churma',
  'Stir-fried lotus stem with chili and fennel.',
  'Lunch',
  'lotus stem, fennel, chili, oil, salt',
  '300g lotus stem, 1/2 tsp fennel powder, 1 tsp chili powder, 1 tbsp oil, salt',
  200, 8, 4, 2, 5,
  '1. Slice lotus stem.\n2. Stir-fry with chili and fennel.\n3. Cook until edges are golden.',
  NULL
),
(
  'Chaman Yakhni',
  'Paneer cubes in a light yogurt-fennel gravy.',
  'Dinner',
  'paneer, yogurt, fennel, ginger powder, ghee',
  '300g paneer, 3/4 cup yogurt, 1 tsp fennel powder, 1/2 tsp dry ginger, 1 tbsp ghee',
  380, 22, 0, 5, 20,
  '1. Whisk yogurt with spices.\n2. Simmer gently.\n3. Add paneer and cook for a few minutes.',
  NULL
),
(
  'Doon Chetin (Walnut Chutney)',
  'Classic Kashmiri walnut chutney with yogurt and chilies.',
  'Lunch',
  'walnuts, yogurt, green chili, mint, salt',
  '1/2 cup walnuts, 1/2 cup yogurt, 1 green chili, few mint leaves, salt',
  180, 16, 2, 2, 5,
  '1. Grind walnuts with chili and mint.\n2. Mix with yogurt and salt.\n3. Serve chilled.',
  NULL
),
(
  'Girda (Kashmiri Bread)',
  'Leavened tandoor bread with a soft crumb and crisp surface.',
  'Breakfast',
  'flour, yeast, sugar, salt, ghee',
  '2 cups flour, 1 tsp yeast, 1 tsp sugar, 1/2 tsp salt, 1 tbsp ghee',
  260, 6, 2, 2, 7,
  '1. Knead dough and proof.\n2. Shape rounds with indentations.\n3. Bake until lightly browned.',
  NULL
),
(
  'Lavasa',
  'Thin, soft flatbread enjoyed with kahwa or curries.',
  'Breakfast',
  'flour, water, salt, oil',
  '2 cups flour, 3/4 cup water, 1/2 tsp salt, 1 tbsp oil',
  220, 5, 2, 1, 6,
  '1. Knead soft dough.\n2. Roll very thin.\n3. Cook on hot tawa until puffed.',
  NULL
),
(
  'Roth',
  'Festive sweet bread/cookie flavored with cardamom.',
  'Dessert',
  'flour, sugar, ghee, milk, cardamom, sesame',
  '2 cups flour, 1/2 cup sugar, 1/3 cup ghee, 1/2 cup milk, 1 tsp cardamom, 1 tsp sesame',
  320, 12, 2, 18, 6,
  '1. Make a stiff dough.\n2. Shape thick discs.\n3. Bake until golden.',
  NULL
),
(
  'Noon Chai (Salt Tea)',
  'Traditional pink tea with salt and milk.',
  'Breakfast',
  'green tea leaves, baking soda, salt, milk, water',
  '2 tsp tea leaves, a pinch baking soda, 1/4 tsp salt, 1 cup milk, 1 cup water',
  90, 3, 0, 5, 4,
  '1. Simmer tea leaves with water and soda.\n2. Add milk and whisk.\n3. Season with salt and serve hot.',
  NULL
),
(
  'Kahwa',
  'Saffron and cardamom-infused green tea with nuts.',
  'Breakfast',
  'green tea, saffron, cardamom, almonds, sugar',
  '1 tsp green tea, a pinch saffron, 2 cardamoms, 6 sliced almonds, 1 tsp sugar',
  60, 2, 0, 6, 1,
  '1. Boil water with saffron and cardamom.\n2. Steep tea briefly.\n3. Garnish with almonds.',
  NULL
),
(
  'Kokur Yakhni',
  'Chicken simmered in a delicate yogurt-fennel gravy.',
  'Dinner',
  'chicken, yogurt, fennel, ginger powder, oil',
  '700g chicken, 3/4 cup yogurt, 1 tsp fennel, 1/2 tsp dry ginger, 1 tbsp oil',
  430, 18, 0, 4, 44,
  '1. Brown chicken lightly.\n2. Add yogurt-spice mixture.\n3. Simmer until tender.',
  NULL
);


/////////////////////////////////////////////////////////////////////////////////////////////// done




INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES
(
  'Butter Chicken (Murgh Makhani)',
  'Creamy tomato-based chicken curry finished with butter.',
  'Dinner',
  'chicken, tomato, butter, cream, ginger garlic paste, garam masala, oil',
  '700g chicken, 3 tomatoes, 2 tbsp butter, 1/3 cup cream, 1 tbsp ginger-garlic paste, 1 tsp garam masala, 1 tbsp oil',
  520, 32, 2, 6, 40,
  '1. Marinate and sear chicken.\n2. Cook tomato puree with spices.\n3. Add cream and butter, simmer chicken.',
  NULL
),
(
  'Dal Makhani',
  'Slow-cooked black lentils and kidney beans finished with butter and cream.',
  'Dinner',
  'whole urad dal, kidney beans, tomato, cream, butter, ginger, oil',
  '1 cup urad dal, 1/4 cup kidney beans, 2 tomatoes, 1/4 cup cream, 1 tbsp butter, 1 inch ginger, 1 tbsp oil',
  380, 16, 9, 5, 18,
  '1. Soak and pressure-cook dal and beans.\n2. Simmer with tomato and spices.\n3. Finish with butter and cream.',
  NULL
),
(
  'Sarson Da Saag',
  'Mustard greens cooked with spinach and spices, a Punjabi classic.',
  'Lunch',
  'mustard greens, spinach, ginger, green chili, ghee, cornmeal',
  '3 cups mustard greens, 1 cup spinach, 1 inch ginger, 1 green chili, 1 tbsp ghee, 1 tbsp cornmeal',
  210, 9, 7, 2, 7,
  '1. Pressure-cook greens.\n2. Blend coarsely and simmer with ginger and chili.\n3. Finish with ghee and cornmeal slurry.',
  NULL
),
(
  'Makki Di Roti',
  'Rustic corn flour flatbread served with saag.',
  'Lunch',
  'makki atta, water, salt, ghee',
  '2 cups makki atta, 3/4 cup warm water, 1/2 tsp salt, 1 tbsp ghee',
  260, 8, 4, 1, 6,
  '1. Knead dough.\n2. Pat into discs.\n3. Cook on tawa and brush with ghee.',
  NULL
),
(
  'Chole Bhature',
  'Spiced chickpeas served with fluffy fried bread.',
  'Lunch',
  'chickpeas, onion, tomato, chole masala, flour, yogurt, oil',
  '1 cup chickpeas, 1 onion, 2 tomatoes, 1 tbsp chole masala, 2 cups flour, 1/4 cup yogurt, oil to fry',
  620, 22, 9, 7, 18,
  '1. Cook chickpeas and prepare masala.\n2. Knead bhature dough and proof.\n3. Fry bhature and serve with chole.',
  NULL
),
(
  'Amritsari Kulcha',
  'Stuffed tandoor-baked flatbread with spiced potatoes.',
  'Lunch',
  'flour, potato, onion, ajwain, yogurt, oil',
  '2 cups flour, 2 potatoes, 1/2 onion, 1/2 tsp ajwain, 1/4 cup yogurt, 1 tbsp oil',
  360, 10, 3, 3, 9,
  '1. Make dough and rest.\n2. Stuff with potato mixture.\n3. Bake or tawa-cook until spotted.',
  NULL
),
(
  'Paneer Tikka',
  'Marinated paneer cubes skewered and grilled.',
  'Dinner',
  'paneer, yogurt, ginger garlic paste, chili powder, bell pepper, onion, oil',
  '300g paneer, 1/3 cup yogurt, 1 tbsp ginger-garlic paste, 1 tsp chili powder, 1 bell pepper, 1 onion, 1 tbsp oil',
  310, 18, 2, 4, 19,
  '1. Marinate paneer and veggies.\n2. Skewer and grill.\n3. Baste with oil and serve.',
  NULL
),
(
  'Tandoori Chicken',
  'Yogurt-marinated chicken roasted until smoky and charred.',
  'Dinner',
  'chicken, yogurt, tandoori masala, lemon, oil',
  '800g chicken, 1/2 cup yogurt, 1 tbsp tandoori masala, juice of 1/2 lemon, 1 tbsp oil',
  430, 20, 0, 3, 45,
  '1. Marinate chicken.\n2. Roast at high heat.\n3. Rest and squeeze lemon.',
  NULL
),
(
  'Chicken Tikka',
  'Boneless chicken chunks marinated and grilled.',
  'Dinner',
  'chicken, yogurt, ginger garlic paste, chili, garam masala, oil',
  '600g chicken, 1/3 cup yogurt, 1 tbsp ginger-garlic paste, 1 tsp chili powder, 1/2 tsp garam masala, 1 tbsp oil',
  380, 16, 0, 2, 42,
  '1. Marinate chicken.\n2. Skewer and grill.\n3. Smoke or char lightly.',
  NULL
),
(
  'Aloo Paratha',
  'Whole-wheat flatbread stuffed with spiced mashed potatoes.',
  'Breakfast',
  'whole wheat flour, potato, green chili, ajwain, ghee',
  '2 cups flour, 2 potatoes, 1 green chili, 1/4 tsp ajwain, 2 tbsp ghee',
  340, 12, 4, 2, 8,
  '1. Knead dough.\n2. Stuff with potato filling.\n3. Roll and cook with ghee.',
  NULL
),
(
  'Gobi Paratha',
  'Flatbread stuffed with spiced grated cauliflower.',
  'Breakfast',
  'whole wheat flour, cauliflower, green chili, coriander, ghee',
  '2 cups flour, 2 cups grated cauliflower, 1 green chili, 1 tbsp chopped coriander, 2 tbsp ghee',
  330, 11, 5, 2, 9,
  '1. Prepare filling.\n2. Stuff and roll parathas.\n3. Cook on tawa with ghee.',
  NULL
),
(
  'Lachha Paratha',
  'Flaky multi-layered paratha with ghee.',
  'Lunch',
  'whole wheat flour, ghee, salt, water',
  '2 cups flour, 2 tbsp ghee, 1/2 tsp salt, water as needed',
  300, 10, 3, 1, 7,
  '1. Knead dough.\n2. Roll, layer with ghee, spiral, and re-roll.\n3. Cook until flaky.',
  NULL
),
(
  'Pindi Chole',
  'Dry-style spiced chickpeas from Rawalpindi style.',
  'Lunch',
  'chickpeas, tea bag, chole masala, ginger, oil',
  '1 cup chickpeas, 1 tea bag, 1 tbsp chole masala, 1 inch ginger, 1 tbsp oil',
  260, 7, 8, 3, 12,
  '1. Pressure-cook chickpeas with tea bag.\n2. Toss with masala in oil.\n3. Finish with ginger juliennes.',
  NULL
),
(
  'Rajma Masala (Punjabi)',
  'Kidney beans in thick onion-tomato gravy.',
  'Main Course',
  'kidney beans, onion, tomato, ginger garlic paste, oil',
  '1 cup kidney beans, 1 onion, 2 tomatoes, 1 tbsp ginger-garlic paste, 1 tbsp oil',
  310, 8, 9, 5, 13,
  '1. Cook beans.\n2. Make masala base.\n3. Simmer beans until creamy.',
  NULL
),
(
  'Kadhi Pakora',
  'Gram flour and yogurt curry with fried pakoras.',
  'Lunch',
  'yogurt, besan, onion, chili, turmeric, oil',
  '1 cup yogurt, 1/2 cup besan, 1 onion, 1 tsp chili, 1/2 tsp turmeric, oil to fry',
  420, 18, 4, 7, 14,
  '1. Make pakora batter and fry.\n2. Simmer yogurt-besan curry.\n3. Add pakoras and temper.',
  NULL
),
(
  'Onion Pakora',
  'Crispy onion fritters with besan batter.',
  'Lunch',
  'onion, besan, ajwain, chili, oil',
  '2 onions, 1 cup besan, 1/4 tsp ajwain, 1 tsp chili, oil to fry',
  360, 18, 4, 4, 7,
  '1. Slice onions and mix batter.\n2. Fry spoonfuls until crisp.\n3. Drain and serve.',
  NULL
),
(
  'Paneer Butter Masala',
  'Paneer in a buttery, creamy tomato gravy.',
  'Dinner',
  'paneer, tomato, butter, cream, kasuri methi, oil',
  '300g paneer, 3 tomatoes, 1 tbsp butter, 1/4 cup cream, 1 tsp kasuri methi, 1 tbsp oil',
  420, 26, 2, 6, 16,
  '1. Cook tomato puree with spices.\n2. Add cream and butter.\n3. Simmer paneer cubes.',
  NULL
),
(
  'Shahi Paneer',
  'Rich paneer curry with nuts and cream.',
  'Dinner',
  'paneer, cashews, cream, onion, tomato, ghee',
  '300g paneer, 2 tbsp cashews, 1/4 cup cream, 1 onion, 2 tomatoes, 1 tbsp ghee',
  450, 28, 2, 6, 17,
  '1. Make nut-onion-tomato base.\n2. Blend smooth.\n3. Simmer paneer with cream.',
  NULL
),
(
  'Kadai Paneer',
  'Paneer tossed with peppers in a spiced tomato gravy.',
  'Dinner',
  'paneer, bell pepper, tomato, kadai masala, oil',
  '300g paneer, 1 bell pepper, 2 tomatoes, 1 tsp kadai masala, 1 tbsp oil',
  360, 20, 3, 5, 16,
  '1. Toast kadai masala.\n2. Stir-fry peppers and paneer.\n3. Add tomato base and finish.',
  NULL
),
(
  'Bhindi Masala',
  'Stir-fried okra with onions and spices.',
  'Lunch',
  'okra, onion, tomato, cumin, oil',
  '300g okra, 1 onion, 1 tomato, 1/2 tsp cumin, 1 tbsp oil',
  180, 8, 5, 3, 4,
  '1. Dry-fry okra.\n2. Sauté onions and spices.\n3. Add okra and finish.',
  NULL
),
(
  'Baingan Bharta',
  'Smoky mashed eggplant with onions, tomatoes, and spices.',
  'Dinner',
  'eggplant, onion, tomato, garlic, oil',
  '1 large eggplant, 1 onion, 2 tomatoes, 3 garlic cloves, 1 tbsp oil',
  200, 8, 6, 4, 5,
  '1. Roast eggplant and peel.\n2. Sauté aromatics.\n3. Add mashed eggplant and cook.',
  NULL
),
(
  'Jeera Aloo',
  'Cumin-tempered potatoes with chili and coriander.',
  'Lunch',
  'potato, cumin, green chili, coriander, oil',
  '3 potatoes, 1 tsp cumin, 1 green chili, 1 tbsp chopped coriander, 1 tbsp oil',
  240, 9, 4, 2, 5,
  '1. Boil and cube potatoes.\n2. Temper cumin and chili.\n3. Toss potatoes and garnish.',
  NULL
),
(
  'Amritsari Fish Fry',
  'Crispy gram-flour-coated fish with carom seeds.',
  'Dinner',
  'fish, besan, ajwain, ginger garlic paste, lemon, oil',
  '500g fish, 1/2 cup besan, 1/2 tsp ajwain, 1 tbsp ginger-garlic paste, juice of 1/2 lemon, oil to fry',
  420, 18, 2, 1, 38,
  '1. Marinate fish.\n2. Coat with besan batter.\n3. Fry until crisp.',
  NULL
),
(
  'Tawa Chicken',
  'Spicy semi-dry chicken tossed on a griddle.',
  'Dinner',
  'chicken, onion, tomato, chili, garam masala, oil',
  '600g chicken, 1 onion, 2 tomatoes, 1 tsp chili powder, 1/2 tsp garam masala, 1 tbsp oil',
  390, 16, 2, 4, 41,
  '1. Sear chicken.\n2. Add masala and tomatoes.\n3. Reduce to semi-dry on tawa.',
  NULL
),
(
  'Keema Matar',
  'Minced meat cooked with green peas and spices.',
  'Dinner',
  'minced mutton, peas, onion, tomato, ginger garlic paste, oil',
  '500g mince, 1 cup peas, 1 onion, 2 tomatoes, 1 tbsp ginger-garlic paste, 1 tbsp oil',
  440, 22, 4, 5, 36,
  '1. Brown mince with aromatics.\n2. Add tomatoes and peas.\n3. Simmer until cooked.',
  NULL
),
(
  'Punjabi Chicken Curry',
  'Homestyle onion-tomato chicken gravy.',
  'Dinner',
  'chicken, onion, tomato, chili, coriander powder, oil',
  '700g chicken, 2 onions, 2 tomatoes, 1 tsp chili powder, 1 tsp coriander powder, 1 tbsp oil',
  380, 14, 2, 4, 42,
  '1. Brown onions.\n2. Add tomatoes and spices.\n3. Simmer chicken until tender.',
  NULL
),
(
  'Rara Gosht',
  'Goat curry enriched with minced meat for extra body.',
  'Dinner',
  'mutton pieces, minced mutton, onion, tomato, spices, ghee',
  '500g mutton, 200g mince, 2 onions, 2 tomatoes, 2 tsp masala, 1 tbsp ghee',
  520, 30, 2, 4, 45,
  '1. Brown pieces and mince.\n2. Cook masala.\n3. Simmer together until thick.',
  NULL
),
(
  'Garlic Naan',
  'Soft leavened flatbread brushed with garlic butter.',
  'Dinner',
  'flour, yeast, yogurt, garlic, butter',
  '2 cups flour, 1 tsp yeast, 1/4 cup yogurt, 3 garlic cloves, 1 tbsp butter',
  310, 9, 2, 2, 8,
  '1. Knead and proof dough.\n2. Roll and cook.\n3. Brush with garlic butter.',
  NULL
),
(
  'Tandoori Roti',
  'Whole-wheat roti cooked at high heat.',
  'Lunch',
  'whole wheat flour, salt, water',
  '2 cups flour, 1/2 tsp salt, water as needed',
  220, 3, 4, 1, 6,
  '1. Knead dough.\n2. Roll thin.\n3. Cook in tandoor or on hot tawa.',
  NULL
),
(
  'Sweet Lassi',
  'Thick sweet yogurt drink flavored with cardamom.',
  'Breakfast',
  'curd, sugar, cardamom, water',
  '1 cup curd, 2 tbsp sugar, 1/4 tsp cardamom, 1/4 cup water',
  180, 6, 0, 22, 6,
  '1. Blend curd and sugar.\n2. Add cardamom.\n3. Serve chilled.',
  NULL
),
(
  'Salted Lassi',
  'Refreshing salted yogurt drink with roasted cumin.',
  'Breakfast',
  'curd, salt, roasted cumin, water',
  '1 cup curd, 1/4 tsp salt, 1/4 tsp roasted cumin, 1/4 cup water',
  120, 5, 0, 6, 6,
  '1. Blend curd with water and salt.\n2. Add cumin.\n3. Serve cold.',
  NULL
),
(
  'Mango Lassi',
  'Sweet mango yogurt smoothie.',
  'Breakfast',
  'curd, mango, sugar, cardamom',
  '3/4 cup curd, 1/2 cup mango pulp, 1 tbsp sugar, a pinch cardamom',
  190, 5, 1, 26, 6,
  '1. Blend mango and curd.\n2. Sweeten to taste.\n3. Chill and serve.',
  NULL
),
(
  'Masala Chaach',
  'Spiced buttermilk with herbs and cumin.',
  'Breakfast',
  'curd, water, cumin, ginger, coriander, salt',
  '1/2 cup curd, 1 cup water, 1/4 tsp cumin, 1/2 inch ginger, 1 tbsp coriander, salt',
  70, 2, 0, 3, 3,
  '1. Whisk curd with water.\n2. Add spices and herbs.\n3. Serve chilled.',
  NULL
),
(
  'Phirni',
  'Creamy ground-rice pudding set in small bowls.',
  'Dessert',
  'milk, rice, sugar, cardamom, saffron',
  '3 cups milk, 2 tbsp ground rice, 1/3 cup sugar, 1/4 tsp cardamom, a pinch saffron',
  260, 9, 0, 28, 8,
  '1. Simmer milk.\n2. Add ground rice slurry.\n3. Sweeten and flavor, chill to set.',
  NULL
),
(
  'Rice Kheer',
  'Traditional rice pudding with cardamom and nuts.',
  'Dessert',
  'milk, rice, sugar, cardamom, almonds',
  '4 cups milk, 1/4 cup rice, 1/3 cup sugar, 1/4 tsp cardamom, 10 almonds',
  280, 10, 0, 30, 9,
  '1. Simmer milk and rice.\n2. Add sugar and cardamom.\n3. Garnish with nuts.',
  NULL
),
(
  'Jalebi',
  'Crisp spiral sweets soaked in sugar syrup.',
  'Dessert',
  'flour, yogurt, sugar, saffron, oil',
  '1 cup flour, 2 tbsp yogurt, 1 cup sugar, a pinch saffron, oil to fry',
  320, 10, 1, 50, 4,
  '1. Ferment batter lightly.\n2. Pipe spirals and fry.\n3. Soak in warm syrup.',
  NULL
),
(
  'Gulab Jamun',
  'Soft milk-solid dumplings soaked in rose syrup.',
  'Dessert',
  'khoya, flour, sugar, rose water, ghee, oil',
  '1 cup khoya, 2 tbsp flour, 1 cup sugar, 1 tsp rose water, 1 tsp ghee, oil to fry',
  340, 12, 0, 40, 6,
  '1. Knead dough and shape balls.\n2. Fry on low heat.\n3. Soak in warm syrup.',
  NULL
),
(
  'Gajar Ka Halwa',
  'Carrot halwa slow-cooked with milk and ghee.',
  'Dessert',
  'carrot, milk, sugar, ghee, cardamom',
  '3 cups grated carrot, 2 cups milk, 1/3 cup sugar, 1 tbsp ghee, 1/4 tsp cardamom',
  300, 12, 3, 28, 6,
  '1. Simmer carrots in milk.\n2. Add sugar and reduce.\n3. Finish with ghee and cardamom.',
  NULL
),
(
  'Pinni',
  'Punjabi winter sweet made with atta and ghee.',
  'Dessert',
  'whole wheat flour, ghee, jaggery, almonds, cardamom',
  '1 cup flour, 1/3 cup ghee, 1/2 cup jaggery, 10 almonds, 1/4 tsp cardamom',
  360, 18, 3, 24, 6,
  '1. Roast flour in ghee.\n2. Mix jaggery and nuts.\n3. Shape laddoos.',
  NULL
),
(
  'Meethe Chawal (Zarda)',
  'Sweet saffron rice with nuts and raisins.',
  'Dessert',
  'basmati rice, sugar, saffron, ghee, almonds, raisins',
  '1 cup rice, 1/2 cup sugar, a pinch saffron, 1 tbsp ghee, 10 almonds, 2 tbsp raisins',
  320, 9, 1, 32, 6,
  '1. Parboil rice.\n2. Steam with sugar, saffron, and ghee.\n3. Garnish with nuts.',
  NULL
),
(
  'Boondi Raita',
  'Yogurt raita with crisp boondi and spices.',
  'Lunch',
  'curd, boondi, cumin, chili, salt',
  '1 cup curd, 1/2 cup boondi, 1/4 tsp cumin, a pinch chili, salt',
  150, 6, 0, 5, 6,
  '1. Whisk curd.\n2. Stir in boondi and spices.\n3. Chill and serve.',
  NULL
),
(
  'Cucumber Raita',
  'Cooling yogurt dip with grated cucumber.',
  'Lunch',
  'curd, cucumber, cumin, mint, salt',
  '1 cup curd, 1/2 cucumber, 1/4 tsp cumin, 1 tbsp chopped mint, salt',
  120, 5, 0, 4, 6,
  '1. Grate cucumber.\n2. Mix with curd and spices.\n3. Serve chilled.',
  NULL
),
(
  'Achari Paneer',
  'Paneer cooked with pickling spices for a tangy kick.',
  'Dinner',
  'paneer, onion, tomato, pickling spices, mustard oil',
  '300g paneer, 1 onion, 2 tomatoes, 1 tsp achari masala, 1 tbsp mustard oil',
  360, 20, 2, 5, 18,
  '1. Heat mustard oil.\n2. Cook onions and tomatoes with achari masala.\n3. Add paneer and simmer.',
  NULL
),
(
  'Aloo Tikki',
  'Crisp potato patties seasoned with spices.',
  'Breakfast',
  'potato, bread crumbs, chili, coriander, oil',
  '3 potatoes, 1/4 cup bread crumbs, 1 tsp chili, 1 tbsp coriander, oil to shallow fry',
  280, 10, 3, 2, 5,
  '1. Mash potatoes and season.\n2. Shape patties.\n3. Shallow-fry until golden.',
  NULL
),
(
  'Amritsari Chana',
  'Tangy, spiced chickpeas with tea-infused color.',
  'Lunch',
  'chickpeas, tea bag, onion, tomato, chole masala, oil',
  '1 cup chickpeas, 1 tea bag, 1 onion, 1 tomato, 1 tbsp chole masala, 1 tbsp oil',
  270, 7, 8, 4, 12,
  '1. Cook chickpeas with tea bag.\n2. Toss with masala.\n3. Simmer until thick.',
  NULL
),
(
  'Paneer Bhurji',
  'Scrambled paneer with onions, tomatoes, and spices.',
  'Breakfast',
  'paneer, onion, tomato, green chili, turmeric, oil',
  '250g paneer, 1 onion, 1 tomato, 1 green chili, 1/4 tsp turmeric, 1 tbsp oil',
  280, 14, 1, 4, 17,
  '1. Sauté onions and chili.\n2. Add tomatoes and spices.\n3. Crumble paneer and cook briefly.',
  NULL
),
(
  'Tinda Masala',
  'Apple gourd cooked with onions and tomatoes.',
  'Lunch',
  'tinda, onion, tomato, cumin, oil',
  '300g tinda, 1 onion, 1 tomato, 1/2 tsp cumin, 1 tbsp oil',
  160, 7, 4, 3, 3,
  '1. Sauté cumin and onions.\n2. Add tinda and tomato.\n3. Cook covered until soft.',
  NULL
),
(
  'Malai Kofta',
  'Fried paneer-potato dumplings in creamy gravy.',
  'Dinner',
  'paneer, potato, cream, cashews, tomato, oil',
  '200g paneer, 2 potatoes, 1/4 cup cream, 2 tbsp cashews, 2 tomatoes, oil to fry',
  460, 26, 2, 7, 13,
  '1. Make kofta and fry.\n2. Prepare creamy gravy.\n3. Simmer kofta in gravy.',
  NULL
),
(
  'Mushroom Do Pyaza',
  'Mushrooms cooked with plenty of onions and spices.',
  'Dinner',
  'mushroom, onion, tomato, chili, oil',
  '300g mushrooms, 2 onions, 1 tomato, 1/2 tsp chili, 1 tbsp oil',
  190, 8, 3, 4, 6,
  '1. Sauté onions in two stages.\n2. Add mushrooms and tomato.\n3. Cook until dryish.',
  NULL
),
(
  'Methi Malai Chicken',
  'Creamy chicken curry with fenugreek leaves.',
  'Dinner',
  'chicken, cream, kasuri methi, onion, ginger garlic paste, oil',
  '700g chicken, 1/3 cup cream, 1 tsp kasuri methi, 1 onion, 1 tbsp ginger-garlic paste, 1 tbsp oil',
  440, 22, 1, 5, 42,
  '1. Sauté onions and paste.\n2. Add chicken and cook.\n3. Finish with cream and methi.',
  NULL
);



///////////////////////////////////////////// done

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'French Onion Soup',
  'Classic caramelized onion soup topped with toasted bread and melted Gruyère.',
  'Soup',
  'onion, butter, beef stock, baguette, gruyere, thyme',
  '4 onions, 2 tbsp butter, 4 cups beef stock, 8 baguette slices, 1 cup grated Gruyère, 1 tsp thyme',
  212, 10, 5, 10, 10,
  '1. Prep ingredients (onion, butter, beef stock, baguette...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve french onion soup warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Salade Niçoise',
  'Tuna, eggs, olives, and beans with a Dijon vinaigrette.',
  'Salad',
  'tuna, egg, green beans, tomato, olive, potato, lettuce, dijon, olive oil',
  '1 can tuna, 2 eggs, 1 cup green beans, 2 tomatoes, 10 olives, 2 small potatoes, 4 cups lettuce, 1 tsp Dijon, 2 tbsp olive oil',
  352, 8, 3, 3, 14,
  '1. Prep ingredients (tuna, egg, green beans, tomato...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve salade niçoise warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Salade Lyonnaise',
  'Frisée salad with warm bacon, croutons, and a poached egg.',
  'Salad',
  'frisee, bacon, egg, baguette, shallot, vinegar, mustard',
  '4 cups frisée, 4 strips bacon, 2 eggs, 1 cup croutons, 1 shallot, 2 tbsp vinegar, 1 tsp mustard',
  361, 17, 3, 5, 20,
  '1. Prep ingredients (frisee, bacon, egg, baguette...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve salade lyonnaise warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Poireaux Vinaigrette',
  'Tender leeks dressed with mustard vinaigrette and herbs.',
  'Side',
  'leek, vinegar, mustard, olive oil, parsley',
  '4 leeks, 2 tbsp vinegar, 1 tsp mustard, 3 tbsp olive oil, 2 tbsp chopped parsley',
  299, 15, 5, 1, 12,
  '1. Prep ingredients (leek, vinegar, mustard, olive oil...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve poireaux vinaigrette warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Carottes Râpées',
  'Grated carrot salad with lemon and Dijon.',
  'Salad',
  'carrot, lemon, dijon, olive oil, parsley',
  '4 carrots, 1 lemon, 1 tsp Dijon, 2 tbsp olive oil, 1 tbsp parsley',
  277, 6, 6, 7, 11,
  '1. Prep ingredients (carrot, lemon, dijon, olive oil...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve carottes râpées warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Céleri Rémoulade',
  'Shredded celery root in a tangy mustard-mayo dressing.',
  'Salad',
  'celery root, lemon, mayonnaise, mustard, capers',
  '1 celery root, 1 lemon, 1/3 cup mayonnaise, 1 tsp mustard, 1 tbsp capers',
  303, 13, 6, 8, 11,
  '1. Prep ingredients (celery root, lemon, mayonnaise, mustard...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve céleri rémoulade warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Gougères',
  'Burgundy-style cheese puffs made from choux pastry.',
  'Appetizer',
  'water, butter, flour, egg, gruyere',
  '1 cup water, 6 tbsp butter, 1 cup flour, 4 eggs, 1 cup grated Gruyère',
  158, 4, 2, 7, 7,
  '1. Prep ingredients (water, butter, flour, egg...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve gougères warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Tapenade',
  'Provençal olive spread with capers and anchovies.',
  'Appetizer',
  'olive, capers, anchovy, garlic, olive oil, lemon',
  '2 cups olives, 1 tbsp capers, 2 anchovies, 1 garlic clove, 2 tbsp olive oil, 1 tsp lemon juice',
  306, 13, 3, 8, 13,
  '1. Prep ingredients (olive, capers, anchovy, garlic...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve tapenade warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Rillettes de Porc',
  'Slow-cooked pork spread seasoned with thyme and garlic.',
  'Appetizer',
  'pork shoulder, lard, garlic, thyme, salt',
  '500g pork shoulder, 2 tbsp lard, 2 garlic cloves, 1 tsp thyme, 1 tsp salt',
  326, 11, 6, 9, 11,
  '1. Prep ingredients (pork shoulder, lard, garlic, thyme...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve rillettes de porc warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Terrine de Campagne',
  'Rustic country pâté with pork and liver.',
  'Appetizer',
  'pork, liver, egg, cream, brandy, herbs',
  '400g pork, 200g liver, 1 egg, 2 tbsp cream, 1 tbsp brandy, 1 tsp herbs de Provence',
  382, 11, 3, 4, 9,
  '1. Prep ingredients (pork, liver, egg, cream...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve terrine de campagne warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Quiche Lorraine',
  'Savory tart with bacon and cheese in a custard filling.',
  'Main Course',
  'pie crust, bacon, egg, cream, gruyere, nutmeg',
  '1 crust, 6 strips bacon, 3 eggs, 1 cup cream, 1 cup Gruyère, pinch nutmeg',
  398, 13, 6, 9, 24,
  '1. Prep ingredients (pie crust, bacon, egg, cream...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve quiche lorraine warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Soupe au Pistou',
  'Vegetable soup finished with basil-garlic pistou.',
  'Soup',
  'zucchini, tomato, beans, pasta, basil, garlic, olive oil',
  '1 zucchini, 2 tomatoes, 1 cup beans, 1/2 cup small pasta, 1 cup basil, 2 garlic cloves, 2 tbsp olive oil',
  326, 9, 2, 8, 10,
  '1. Prep ingredients (zucchini, tomato, beans, pasta...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve soupe au pistou warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Brandade de Morue',
  'Creamy salt cod purée with olive oil and potatoes.',
  'Main Course',
  'salt cod, potato, garlic, olive oil, cream',
  '300g salt cod, 2 potatoes, 2 garlic cloves, 3 tbsp olive oil, 1/4 cup cream',
  601, 32, 5, 10, 19,
  '1. Prep ingredients (salt cod, potato, garlic, olive oil...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve brandade de morue warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Pissaladière',
  'Niçoise caramelized onion tart with anchovies and olives.',
  'Lunch',
  'pizza dough, onion, anchovy, olive, olive oil',
  '1 dough, 4 onions, 8 anchovies, 12 olives, 2 tbsp olive oil',
  351, 17, 3, 4, 12,
  '1. Prep ingredients (pizza dough, onion, anchovy, olive...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve pissaladière warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Salade de Chèvre Chaud',
  'Warm goat cheese toasts on greens with honey dressing.',
  'Salad',
  'baguette, goat cheese, honey, mixed greens, walnut',
  '8 slices baguette, 150g goat cheese, 1 tsp honey, 4 cups greens, 1/4 cup walnuts',
  334, 7, 5, 3, 10,
  '1. Prep ingredients (baguette, goat cheese, honey, mixed greens...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve salade de chèvre chaud warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Coq au Vin',
  'Chicken braised in red wine with bacon and mushrooms.',
  'Dinner',
  'chicken, red wine, bacon, mushroom, onion, garlic, thyme',
  '1 kg chicken, 2 cups red wine, 4 strips bacon, 200g mushrooms, 1 onion, 2 garlic cloves, 1 tsp thyme',
  898, 21, 3, 3, 42,
  '1. Prep ingredients (chicken, red wine, bacon, mushroom...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve coq au vin warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Boeuf Bourguignon',
  'Beef stewed in Burgundy wine with vegetables.',
  'Dinner',
  'beef, red wine, carrot, onion, mushroom, bacon, thyme',
  '800g beef, 2 cups red wine, 2 carrots, 1 onion, 200g mushrooms, 3 strips bacon, 1 tsp thyme',
  785, 30, 1, 10, 25,
  '1. Prep ingredients (beef, red wine, carrot, onion...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve boeuf bourguignon warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Cassoulet',
  'Slow-cooked white beans with duck confit and sausage.',
  'Dinner',
  'white beans, duck confit, sausage, tomato, garlic',
  '2 cups beans, 2 duck legs, 2 sausages, 1 cup tomatoes, 2 garlic cloves',
  645, 23, 2, 1, 19,
  '1. Prep ingredients (white beans, duck confit, sausage, tomato...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve cassoulet warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Confit de Canard',
  'Duck legs slowly cooked in their own fat until tender.',
  'Dinner',
  'duck legs, duck fat, garlic, thyme, salt',
  '2 duck legs, 1 cup duck fat, 2 garlic cloves, 1 tsp thyme, 1 tsp salt',
  841, 32, 1, 7, 34,
  '1. Prep ingredients (duck legs, duck fat, garlic, thyme...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve confit de canard warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Magret de Canard',
  'Seared duck breast with crispy skin and pan sauce.',
  'Dinner',
  'duck breast, salt, pepper, red wine, butter',
  '2 duck breasts, 1 tsp salt, 1/2 tsp pepper, 1/2 cup red wine, 1 tbsp butter',
  695, 30, 1, 3, 18,
  '1. Prep ingredients (duck breast, salt, pepper, red wine...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve magret de canard warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Poulet Rôti',
  'Herb-roasted whole chicken with pan juices.',
  'Dinner',
  'whole chicken, butter, thyme, garlic, lemon',
  '1 whole chicken, 2 tbsp butter, 1 tsp thyme, 4 garlic cloves, 1 lemon',
  688, 37, 1, 4, 17,
  '1. Prep ingredients (whole chicken, butter, thyme, garlic...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve poulet rôti warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Steak Frites',
  'Pan-seared steak served with crisp fries.',
  'Dinner',
  'steak, potato, oil, salt, pepper',
  '2 steaks, 4 potatoes, 2 cups oil, 1 tsp salt, 1/2 tsp pepper',
  791, 28, 5, 10, 23,
  '1. Prep ingredients (steak, potato, oil, salt...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve steak frites warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Sole Meunière',
  'Pan-fried sole with brown butter, lemon, and parsley.',
  'Dinner',
  'sole, flour, butter, lemon, parsley',
  '2 sole fillets, 1/4 cup flour, 3 tbsp butter, 1 lemon, 1 tbsp parsley',
  667, 23, 4, 5, 37,
  '1. Prep ingredients (sole, flour, butter, lemon...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve sole meunière warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Navarin d''Agneau',
  'Spring lamb stew with root vegetables.',
  'Dinner',
  'lamb, carrot, turnip, potato, onion, stock',
  '700g lamb, 2 carrots, 2 turnips, 2 potatoes, 1 onion, 3 cups stock',
  619, 20, 5, 1, 28,
  '1. Prep ingredients (lamb, carrot, turnip, potato...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve navarin d''agneau warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Hachis Parmentier',
  'French cottage pie with beef and mashed potatoes.',
  'Dinner',
  'beef, potato, onion, butter, milk',
  '500g minced beef, 4 potatoes, 1 onion, 2 tbsp butter, 1/2 cup milk',
  778, 19, 2, 4, 24,
  '1. Prep ingredients (beef, potato, onion, butter...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve hachis parmentier warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Tartiflette',
  'Savoyard potato gratin with reblochon, bacon, and onion.',
  'Dinner',
  'potato, reblochon, bacon, onion, cream',
  '6 potatoes, 1 wheel reblochon, 6 strips bacon, 1 onion, 1/2 cup cream',
  441, 12, 2, 9, 10,
  '1. Prep ingredients (potato, reblochon, bacon, onion...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve tartiflette warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Quenelles de Brochet',
  'Delicate pike dumplings in a rich sauce.',
  'Dinner',
  'pike, egg, cream, butter, flour',
  '400g pike, 2 eggs, 1/2 cup cream, 2 tbsp butter, 1/3 cup flour',
  401, 14, 6, 10, 16,
  '1. Prep ingredients (pike, egg, cream, butter...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve quenelles de brochet warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Bouillabaisse',
  'Marseilles fish stew with saffron and garlic rouille.',
  'Dinner',
  'mixed fish, shellfish, tomato, fennel, saffron, garlic',
  '800g mixed fish, 300g shellfish, 2 tomatoes, 1/2 fennel bulb, pinch saffron, 2 garlic cloves',
  416, 12, 6, 5, 20,
  '1. Prep ingredients (mixed fish, shellfish, tomato, fennel...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve bouillabaisse warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Moules Marinières',
  'Mussels steamed with white wine, garlic, and herbs.',
  'Dinner',
  'mussels, white wine, shallot, garlic, butter, parsley',
  '1 kg mussels, 1 cup white wine, 1 shallot, 2 garlic cloves, 1 tbsp butter, 1 tbsp parsley',
  632, 15, 2, 5, 33,
  '1. Prep ingredients (mussels, white wine, shallot, garlic...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve moules marinières warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Blanquette de Veau',
  'Creamy veal stew with mushrooms and carrots.',
  'Dinner',
  'veal, carrot, mushroom, onion, cream, stock',
  '700g veal, 2 carrots, 200g mushrooms, 1 onion, 1/2 cup cream, 3 cups stock',
  720, 30, 2, 7, 17,
  '1. Prep ingredients (veal, carrot, mushroom, onion...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve blanquette de veau warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Gratin Dauphinois',
  'Creamy potato gratin with garlic and cream.',
  'Side',
  'potato, cream, garlic, butter, nutmeg',
  '6 potatoes, 2 cups cream, 2 garlic cloves, 1 tbsp butter, pinch nutmeg',
  177, 7, 3, 3, 4,
  '1. Prep ingredients (potato, cream, garlic, butter...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve gratin dauphinois warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Ratatouille',
  'Provençal stewed vegetables with olive oil and herbs.',
  'Lunch',
  'eggplant, zucchini, tomato, bell pepper, onion, olive oil, thyme',
  '1 eggplant, 2 zucchini, 3 tomatoes, 1 bell pepper, 1 onion, 3 tbsp olive oil, 1 tsp thyme',
  384, 18, 5, 10, 22,
  '1. Prep ingredients (eggplant, zucchini, tomato, bell pepper...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve ratatouille warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Poulet Basquaise',
  'Chicken braised with peppers, tomatoes, and Espelette.',
  'Dinner',
  'chicken, bell pepper, tomato, onion, garlic, espelette',
  '1 kg chicken, 2 peppers, 2 tomatoes, 1 onion, 2 garlic cloves, 1 tsp Espelette pepper',
  624, 16, 6, 5, 31,
  '1. Prep ingredients (chicken, bell pepper, tomato, onion...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve poulet basquaise warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Daube Provençale',
  'Beef braised with orange zest, olives, and wine.',
  'Dinner',
  'beef, red wine, orange, olive, onion, carrot',
  '800g beef, 2 cups red wine, 1 orange zest, 10 olives, 1 onion, 2 carrots',
  882, 27, 5, 8, 34,
  '1. Prep ingredients (beef, red wine, orange, olive...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve daube provençale warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Lapin à la Moutarde',
  'Rabbit simmered in creamy mustard sauce.',
  'Dinner',
  'rabbit, mustard, cream, white wine, thyme',
  '1 rabbit, 2 tbsp mustard, 1/2 cup cream, 1/2 cup white wine, 1 tsp thyme',
  706, 16, 4, 6, 32,
  '1. Prep ingredients (rabbit, mustard, cream, white wine...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve lapin à la moutarde warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Andouillette à la Moutarde',
  'Grilled andouillette sausage with mustard sauce.',
  'Dinner',
  'andouillette, mustard, cream, butter',
  '2 sausages, 1 tbsp mustard, 1/3 cup cream, 1 tbsp butter',
  413, 10, 6, 10, 18,
  '1. Prep ingredients (andouillette, mustard, cream, butter...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve andouillette à la moutarde warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Choucroute Garnie',
  'Alsatian sauerkraut with assorted meats and potatoes.',
  'Dinner',
  'sauerkraut, sausage, pork, potato, juniper, white wine',
  '500g sauerkraut, 2 sausages, 300g pork, 4 potatoes, 4 juniper berries, 1/2 cup white wine',
  410, 22, 6, 5, 18,
  '1. Prep ingredients (sauerkraut, sausage, pork, potato...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve choucroute garnie warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Côte de Boeuf',
  'Bone-in ribeye roasted and served with shallot butter.',
  'Dinner',
  'ribeye, butter, shallot, thyme, salt',
  '1 côte de boeuf, 2 tbsp butter, 1 shallot, 1 tsp thyme, 1 tsp salt',
  790, 37, 4, 9, 37,
  '1. Prep ingredients (ribeye, butter, shallot, thyme...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve côte de boeuf warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Saucisses Lentilles',
  'Sausages simmered with green lentils and aromatics.',
  'Dinner',
  'sausage, lentils, carrot, onion, stock',
  '2 sausages, 1 cup green lentils, 1 carrot, 1 onion, 3 cups stock',
  869, 27, 5, 7, 40,
  '1. Prep ingredients (sausage, lentils, carrot, onion...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve saucisses lentilles warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Grilled Sardines with Persillade',
  'Sardines grilled and topped with garlic-parsley mix.',
  'Dinner',
  'sardines, garlic, parsley, olive oil, lemon',
  '8 sardines, 2 garlic cloves, 2 tbsp parsley, 2 tbsp olive oil, 1 lemon',
  651, 35, 4, 6, 24,
  '1. Prep ingredients (sardines, garlic, parsley, olive oil...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve grilled sardines with persillade warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Filet Mignon au Poivre',
  'Peppercorn-crusted steak with cognac cream sauce.',
  'Dinner',
  'beef filet, peppercorns, cognac, cream, butter',
  '2 filets, 2 tsp crushed peppercorns, 2 tbsp cognac, 1/3 cup cream, 1 tbsp butter',
  564, 25, 2, 6, 21,
  '1. Prep ingredients (beef filet, peppercorns, cognac, cream...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve filet mignon au poivre warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Poulet Chasseur',
  'Hunter’s chicken with mushrooms, tomatoes, and wine.',
  'Dinner',
  'chicken, mushroom, tomato, white wine, shallot',
  '800g chicken, 200g mushrooms, 1 cup tomatoes, 1/2 cup white wine, 1 shallot',
  653, 20, 4, 9, 14,
  '1. Prep ingredients (chicken, mushroom, tomato, white wine...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve poulet chasseur warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Sole Véronique',
  'Poached sole with white grapes and cream sauce.',
  'Dinner',
  'sole, grapes, white wine, cream, butter',
  '2 sole fillets, 1/2 cup grapes, 1/2 cup white wine, 1/3 cup cream, 1 tbsp butter',
  445, 14, 3, 2, 27,
  '1. Prep ingredients (sole, grapes, white wine, cream...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve sole véronique warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Haricots Verts Amandine',
  'Green beans with toasted almonds and butter.',
  'Side',
  'green beans, almonds, butter, lemon',
  '2 cups green beans, 1/4 cup almonds, 1 tbsp butter, 1 tsp lemon juice',
  223, 11, 1, 9, 8,
  '1. Prep ingredients (green beans, almonds, butter, lemon...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve haricots verts amandine warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Pommes Purée',
  'Silky French mashed potatoes with butter and cream.',
  'Side',
  'potato, butter, cream, salt',
  '6 potatoes, 3 tbsp butter, 1/2 cup cream, 1 tsp salt',
  133, 3, 3, 10, 6,
  '1. Prep ingredients (potato, butter, cream, salt...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve pommes purée warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Pommes Anna',
  'Layered buttered potatoes baked until crisp.',
  'Side',
  'potato, butter, salt, pepper',
  '6 potatoes, 4 tbsp butter, 1 tsp salt, 1/2 tsp pepper',
  280, 10, 1, 4, 8,
  '1. Prep ingredients (potato, butter, salt, pepper...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve pommes anna warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Endives au Jambon',
  'Braised endives wrapped in ham with béchamel.',
  'Lunch',
  'endive, ham, milk, butter, flour, gruyere',
  '6 endives, 6 slices ham, 2 cups milk, 2 tbsp butter, 2 tbsp flour, 1/2 cup Gruyère',
  367, 19, 4, 8, 9,
  '1. Prep ingredients (endive, ham, milk, butter...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve endives au jambon warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Ratatouille Tian',
  'Layered baked ratatouille with olive oil and herbs.',
  'Lunch',
  'eggplant, zucchini, tomato, olive oil, thyme',
  '1 eggplant, 2 zucchini, 3 tomatoes, 3 tbsp olive oil, 1 tsp thyme',
  622, 26, 2, 3, 20,
  '1. Prep ingredients (eggplant, zucchini, tomato, olive oil...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve ratatouille tian warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Gratin de Courgettes',
  'Zucchini gratin with herbs and cheese.',
  'Side',
  'zucchini, cream, gruyere, garlic',
  '3 zucchini, 1/2 cup cream, 1/2 cup Gruyère, 1 garlic clove',
  123, 4, 1, 4, 7,
  '1. Prep ingredients (zucchini, cream, gruyere, garlic...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve gratin de courgettes warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Tomates Farcies',
  'Baked tomatoes stuffed with herbed beef and rice.',
  'Lunch',
  'tomato, beef, rice, garlic, parsley',
  '6 tomatoes, 300g beef, 1/2 cup rice, 2 garlic cloves, 2 tbsp parsley',
  358, 13, 1, 3, 14,
  '1. Prep ingredients (tomato, beef, rice, garlic...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve tomates farcies warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Asperges à la Gribiche',
  'Asparagus with tangy egg-caper sauce.',
  'Side',
  'asparagus, egg, capers, mustard, oil, vinegar',
  '1 bunch asparagus, 2 eggs, 1 tbsp capers, 1 tsp mustard, 2 tbsp oil, 1 tbsp vinegar',
  303, 9, 6, 5, 11,
  '1. Prep ingredients (asparagus, egg, capers, mustard...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve asperges à la gribiche warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Artichauts Vinaigrette',
  'Steamed artichokes with mustard vinaigrette.',
  'Side',
  'artichoke, mustard, vinegar, olive oil, lemon',
  '2 artichokes, 1 tsp mustard, 2 tbsp vinegar, 3 tbsp olive oil, 1 lemon',
  243, 13, 2, 8, 10,
  '1. Prep ingredients (artichoke, mustard, vinegar, olive oil...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve artichauts vinaigrette warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Poêlée de Champignons',
  'Sautéed mixed mushrooms with garlic and parsley.',
  'Side',
  'mushroom, garlic, butter, parsley',
  '400g mushrooms, 2 garlic cloves, 1 tbsp butter, 1 tbsp parsley',
  218, 6, 5, 9, 11,
  '1. Prep ingredients (mushroom, garlic, butter, parsley...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve poêlée de champignons warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Omelette aux Fines Herbes',
  'Fluffy omelette with parsley, chives, and tarragon.',
  'Breakfast',
  'egg, butter, parsley, chives, tarragon, salt',
  '3 eggs, 1 tbsp butter, 1 tbsp parsley, 1 tbsp chives, 1 tsp tarragon, pinch salt',
  319, 16, 3, 14, 10,
  '1. Prep ingredients (egg, butter, parsley, chives...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve omelette aux fines herbes warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Croque Monsieur',
  'Baked ham and Gruyère sandwich with béchamel.',
  'Lunch',
  'bread, ham, gruyere, milk, butter, flour',
  '4 slices bread, 4 slices ham, 1 cup Gruyère, 1 cup milk, 1 tbsp butter, 1 tbsp flour',
  559, 17, 1, 5, 28,
  '1. Prep ingredients (bread, ham, gruyere, milk...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve croque monsieur warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Croque Madame',
  'Croque monsieur topped with a fried egg.',
  'Lunch',
  'bread, ham, gruyere, milk, butter, flour, egg',
  '4 slices bread, 4 slices ham, 1 cup Gruyère, 1 cup milk, 1 tbsp butter, 1 tbsp flour, 1 egg',
  600, 24, 6, 8, 34,
  '1. Prep ingredients (bread, ham, gruyere, milk...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve croque madame warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Pain Perdu',
  'French toast with vanilla and cinnamon.',
  'Breakfast',
  'bread, egg, milk, sugar, vanilla, butter',
  '4 slices bread, 2 eggs, 3/4 cup milk, 2 tbsp sugar, 1 tsp vanilla, 1 tbsp butter',
  478, 19, 3, 11, 20,
  '1. Prep ingredients (bread, egg, milk, sugar...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve pain perdu warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Galette Complète',
  'Buckwheat crêpe with ham, cheese, and egg.',
  'Breakfast',
  'buckwheat flour, water, egg, ham, cheese, butter',
  '1 cup buckwheat flour, 1 cup water, 2 eggs, 2 slices ham, 1/2 cup cheese, 1 tbsp butter',
  528, 18, 3, 7, 32,
  '1. Prep ingredients (buckwheat flour, water, egg, ham...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve galette complète warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Quiche aux Poireaux',
  'Leek quiche with cream and Gruyère.',
  'Lunch',
  'pie crust, leek, egg, cream, gruyere',
  '1 crust, 2 leeks, 3 eggs, 1 cup cream, 1 cup Gruyère',
  422, 17, 2, 7, 9,
  '1. Prep ingredients (pie crust, leek, egg, cream...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve quiche aux poireaux warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Tarte Flambée',
  'Alsatian thin tart with crème fraîche, onions, and bacon.',
  'Lunch',
  'flatbread, creme fraiche, onion, bacon',
  '1 flatbread, 1/2 cup crème fraîche, 1 onion, 4 strips bacon',
  681, 25, 4, 7, 42,
  '1. Prep ingredients (flatbread, creme fraiche, onion, bacon...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve tarte flambée warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Baguette Sandwich Jambon-Beurre',
  'Ham and butter baguette with cornichons.',
  'Lunch',
  'baguette, butter, ham, cornichon',
  '1 baguette, 2 tbsp butter, 4 slices ham, 4 cornichons',
  633, 34, 4, 1, 16,
  '1. Prep ingredients (baguette, butter, ham, cornichon...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve baguette sandwich jambon-beurre warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Truite Meunière',
  'Pan-fried trout with lemon-butter sauce.',
  'Dinner',
  'trout, flour, butter, lemon, parsley',
  '2 trout fillets, 1/4 cup flour, 2 tbsp butter, 1 lemon, 1 tbsp parsley',
  894, 37, 1, 8, 21,
  '1. Prep ingredients (trout, flour, butter, lemon...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve truite meunière warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Coquilles Saint-Jacques',
  'Seared scallops with white wine and cream.',
  'Dinner',
  'scallops, white wine, cream, shallot, butter',
  '400g scallops, 1/2 cup white wine, 1/3 cup cream, 1 shallot, 1 tbsp butter',
  866, 32, 6, 3, 32,
  '1. Prep ingredients (scallops, white wine, cream, shallot...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve coquilles saint-jacques warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Brandade Toasts',
  'Toasts topped with creamy brandade and herbs.',
  'Appetizer',
  'baguette, brandade, parsley',
  '8 slices baguette, 1 cup brandade, 1 tbsp parsley',
  229, 5, 3, 6, 10,
  '1. Prep ingredients (baguette, brandade, parsley...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve brandade toasts warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Grenouilles à la Provençale',
  'Frog legs sautéed with garlic and parsley.',
  'Dinner',
  'frog legs, garlic, butter, parsley, lemon',
  '500g frog legs, 2 garlic cloves, 2 tbsp butter, 1 tbsp parsley, 1 lemon',
  603, 26, 3, 9, 21,
  '1. Prep ingredients (frog legs, garlic, butter, parsley...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve grenouilles à la provençale warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Quiche aux Épinards',
  'Spinach quiche with creamy custard.',
  'Lunch',
  'pie crust, spinach, egg, cream, gruyere',
  '1 crust, 2 cups spinach, 3 eggs, 1 cup cream, 1 cup Gruyère',
  462, 19, 4, 9, 9,
  '1. Prep ingredients (pie crust, spinach, egg, cream...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve quiche aux épinards warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Bourride',
  'Provençal monkfish stew with aioli.',
  'Dinner',
  'monkfish, aioli, leek, carrot, fish stock',
  '600g monkfish, 1/3 cup aioli, 1 leek, 1 carrot, 3 cups fish stock',
  435, 13, 6, 5, 27,
  '1. Prep ingredients (monkfish, aioli, leek, carrot...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve bourride warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Ragoût de Champignons',
  'Mushroom ragout with herbs and wine.',
  'Dinner',
  'mushroom, white wine, shallot, thyme, butter',
  '500g mushrooms, 1/2 cup white wine, 1 shallot, 1 tsp thyme, 1 tbsp butter',
  782, 19, 1, 2, 30,
  '1. Prep ingredients (mushroom, white wine, shallot, thyme...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve ragoût de champignons warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Poulet Provençal',
  'Roasted chicken with olives, tomatoes, and herbs.',
  'Dinner',
  'chicken, olive, tomato, garlic, thyme',
  '1 kg chicken, 12 olives, 2 tomatoes, 3 garlic cloves, 1 tsp thyme',
  755, 24, 1, 1, 25,
  '1. Prep ingredients (chicken, olive, tomato, garlic...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve poulet provençal warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Lotte à l''Américaine',
  'Monkfish in tomato-cognac sauce with cream.',
  'Dinner',
  'monkfish, tomato, cognac, cream',
  '600g monkfish, 1 cup tomatoes, 2 tbsp cognac, 1/3 cup cream',
  428, 13, 3, 7, 11,
  '1. Prep ingredients (monkfish, tomato, cognac, cream...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve lotte à l''américaine warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Crème Brûlée',
  'Silky custard with caramelized sugar crust.',
  'Dessert',
  'cream, egg yolk, sugar, vanilla',
  '2 cups cream, 5 egg yolks, 1/3 cup sugar, 1 tsp vanilla',
  471, 16, 6, 6, 12,
  '1. Prep ingredients (cream, egg yolk, sugar, vanilla...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve crème brûlée warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Crêpes Suzette',
  'Thin crêpes in orange-butter sauce with a hint of liqueur.',
  'Dessert',
  'flour, egg, milk, butter, orange, liqueur',
  '1 cup flour, 2 eggs, 1.5 cups milk, 2 tbsp butter, 1 orange zest, 2 tbsp orange liqueur',
  240, 10, 4, 20, 11,
  '1. Prep ingredients (flour, egg, milk, butter...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve crêpes suzette warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Tarte Tatin',
  'Caramelized upside-down apple tart.',
  'Dessert',
  'apple, sugar, butter, pastry',
  '6 apples, 1/2 cup sugar, 3 tbsp butter, 1 sheet puff pastry',
  454, 23, 2, 8, 17,
  '1. Prep ingredients (apple, sugar, butter, pastry...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve tarte tatin warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Clafoutis aux Cerises',
  'Baked custard studded with cherries.',
  'Dessert',
  'cherry, milk, egg, flour, sugar',
  '2 cups cherries, 1 cup milk, 3 eggs, 1/2 cup flour, 1/3 cup sugar',
  330, 12, 6, 1, 19,
  '1. Prep ingredients (cherry, milk, egg, flour...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve clafoutis aux cerises warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Madeleines',
  'Buttery shell-shaped sponge cakes with lemon.',
  'Dessert',
  'flour, egg, butter, sugar, lemon',
  '1 cup flour, 2 eggs, 1/2 cup butter, 1/3 cup sugar, 1 tsp lemon zest',
  438, 22, 6, 18, 11,
  '1. Prep ingredients (flour, egg, butter, sugar...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve madeleines warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Financiers',
  'Almond tea cakes with browned butter.',
  'Dessert',
  'almond flour, egg white, butter, sugar, flour',
  '1 cup almond flour, 4 egg whites, 6 tbsp butter, 1/3 cup sugar, 2 tbsp flour',
  426, 22, 5, 10, 20,
  '1. Prep ingredients (almond flour, egg white, butter, sugar...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve financiers warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Profiteroles',
  'Choux puffs filled with ice cream and chocolate sauce.',
  'Dessert',
  'water, butter, flour, egg, ice cream, chocolate',
  '1 cup water, 6 tbsp butter, 1 cup flour, 4 eggs, 2 cups ice cream, 1/2 cup chocolate sauce',
  417, 18, 4, 10, 11,
  '1. Prep ingredients (water, butter, flour, egg...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve profiteroles warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Éclairs',
  'Choux pastry filled with pastry cream and chocolate glaze.',
  'Dessert',
  'water, butter, flour, egg, milk, chocolate',
  '1 cup water, 6 tbsp butter, 1 cup flour, 4 eggs, 2 cups pastry cream, 1/2 cup melted chocolate',
  396, 20, 1, 8, 14,
  '1. Prep ingredients (water, butter, flour, egg...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve éclairs warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Mousse au Chocolat',
  'Light chocolate mousse with whipped cream.',
  'Dessert',
  'chocolate, egg, cream, sugar',
  '200g chocolate, 3 eggs, 1/2 cup cream, 2 tbsp sugar',
  383, 15, 6, 10, 8,
  '1. Prep ingredients (chocolate, egg, cream, sugar...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve mousse au chocolat warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Île Flottante',
  'Poached meringues floating on crème anglaise.',
  'Dessert',
  'egg, milk, sugar, vanilla',
  '3 eggs, 2 cups milk, 1/3 cup sugar, 1 tsp vanilla',
  537, 19, 1, 19, 30,
  '1. Prep ingredients (egg, milk, sugar, vanilla...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve île flottante warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Crêpes',
  'Basic French crêpes for sweet or savory fillings.',
  'Breakfast',
  'flour, egg, milk, butter, salt',
  '1 cup flour, 2 eggs, 1.5 cups milk, 2 tbsp butter, pinch salt',
  275, 14, 6, 16, 15,
  '1. Prep ingredients (flour, egg, milk, butter...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve crêpes warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Galette des Rois',
  'Almond frangipane puff pastry cake for Epiphany.',
  'Dessert',
  'puff pastry, almond flour, butter, sugar, egg',
  '2 sheets puff pastry, 1 cup almond flour, 4 tbsp butter, 1/2 cup sugar, 2 eggs',
  346, 16, 2, 20, 18,
  '1. Prep ingredients (puff pastry, almond flour, butter, sugar...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve galette des rois warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Tarte au Citron',
  'Tangy lemon tart with buttery crust.',
  'Dessert',
  'pie crust, lemon, egg, sugar, butter',
  '1 crust, 3 lemons, 3 eggs, 1/2 cup sugar, 3 tbsp butter',
  312, 13, 5, 9, 15,
  '1. Prep ingredients (pie crust, lemon, egg, sugar...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve tarte au citron warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Poires Belle Hélène',
  'Poached pears with chocolate sauce and ice cream.',
  'Dessert',
  'pear, sugar, vanilla, chocolate, ice cream',
  '4 pears, 1/2 cup sugar, 1 tsp vanilla, 1/2 cup chocolate sauce, 2 cups ice cream',
  569, 27, 6, 5, 26,
  '1. Prep ingredients (pear, sugar, vanilla, chocolate...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve poires belle hélène warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Tarte aux Fraises',
  'Fresh strawberry tart with pastry cream.',
  'Dessert',
  'pie crust, strawberry, pastry cream, apricot jam',
  '1 crust, 2 cups strawberries, 1.5 cups pastry cream, 2 tbsp apricot jam',
  521, 22, 3, 15, 11,
  '1. Prep ingredients (pie crust, strawberry, pastry cream, apricot jam...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve tarte aux fraises warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Crème Caramel',
  'Baked caramel custard with silky texture.',
  'Dessert',
  'milk, egg, sugar, vanilla',
  '2 cups milk, 3 eggs, 1/2 cup sugar, 1 tsp vanilla',
  386, 18, 1, 10, 13,
  '1. Prep ingredients (milk, egg, sugar, vanilla...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve crème caramel warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Far Breton',
  'Prune-studded baked custard from Brittany.',
  'Dessert',
  'prunes, milk, egg, flour, sugar',
  '1 cup prunes, 2 cups milk, 3 eggs, 1/2 cup flour, 1/3 cup sugar',
  412, 11, 2, 18, 23,
  '1. Prep ingredients (prunes, milk, egg, flour...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve far breton warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Kouign-Amann',
  'Buttery Breton caramelized laminated pastry.',
  'Dessert',
  'flour, butter, sugar, yeast, salt',
  '2 cups flour, 1 cup butter, 1/2 cup sugar, 1 tsp yeast, pinch salt',
  387, 15, 3, 6, 11,
  '1. Prep ingredients (flour, butter, sugar, yeast...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve kouign-amann warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Tarte Normande',
  'Apple tart with cream and Calvados.',
  'Dessert',
  'apple, cream, egg, sugar, calvados, pie crust',
  '4 apples, 1/2 cup cream, 2 eggs, 1/3 cup sugar, 1 tbsp Calvados, 1 crust',
  446, 24, 3, 11, 24,
  '1. Prep ingredients (apple, cream, egg, sugar...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve tarte normande warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Crêpes à la Crème de Marrons',
  'Crêpes filled with sweet chestnut cream.',
  'Dessert',
  'crepes, chestnut cream, whipped cream',
  '8 crêpes, 1 cup chestnut cream, 1/2 cup whipped cream',
  439, 23, 2, 8, 24,
  '1. Prep ingredients (crepes, chestnut cream, whipped cream...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve crêpes à la crème de marrons warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Quenelles de Volaille',
  'Chicken quenelles poached and napped with sauce.',
  'Dinner',
  'chicken, egg, cream, butter, flour',
  '400g chicken, 2 eggs, 1/2 cup cream, 2 tbsp butter, 1/3 cup flour',
  770, 34, 4, 9, 27,
  '1. Prep ingredients (chicken, egg, cream, butter...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve quenelles de volaille warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Civet de Lapin',
  'Rabbit stew thickened with blood or liver, red wine.',
  'Dinner',
  'rabbit, red wine, onion, carrot, lardons',
  '1 rabbit, 2 cups red wine, 1 onion, 2 carrots, 100g lardons',
  804, 28, 3, 9, 20,
  '1. Prep ingredients (rabbit, red wine, onion, carrot...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve civet de lapin warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Poule au Pot',
  'Gently poached chicken with vegetables and broth.',
  'Dinner',
  'chicken, leek, carrot, turnip, celery, stock',
  '1 chicken, 2 leeks, 2 carrots, 2 turnips, 2 celery stalks, 3 L stock',
  588, 26, 6, 5, 26,
  '1. Prep ingredients (chicken, leek, carrot, turnip...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve poule au pot warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Gratin de Chou-fleur',
  'Cauliflower gratin with béchamel and cheese.',
  'Side',
  'cauliflower, milk, butter, flour, gruyere',
  '1 head cauliflower, 2 cups milk, 2 tbsp butter, 2 tbsp flour, 1 cup Gruyère',
  330, 14, 3, 2, 16,
  '1. Prep ingredients (cauliflower, milk, butter, flour...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve gratin de chou-fleur warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Paté en Croûte',
  'Meat pâté baked in a pastry crust.',
  'Appetizer',
  'pork, veal, pastry, egg, spice',
  '300g pork, 200g veal, 1 sheet pastry, 1 egg, 1 tsp spice mix',
  391, 9, 5, 6, 23,
  '1. Prep ingredients (pork, veal, pastry, egg...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve paté en croûte warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Steak au Poivre',
  'Peppercorn steak flambéed with cognac and cream.',
  'Dinner',
  'steak, peppercorns, cognac, cream, butter',
  '2 steaks, 2 tsp crushed peppercorns, 2 tbsp cognac, 1/3 cup cream, 1 tbsp butter',
  513, 22, 6, 8, 30,
  '1. Prep ingredients (steak, peppercorns, cognac, cream...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve steak au poivre warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Poulet à l''Estragon',
  'Chicken in tarragon cream sauce.',
  'Dinner',
  'chicken, tarragon, cream, white wine, shallot',
  '800g chicken, 1 tbsp tarragon, 1/2 cup cream, 1/2 cup white wine, 1 shallot',
  554, 24, 1, 3, 12,
  '1. Prep ingredients (chicken, tarragon, cream, white wine...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve poulet à l''estragon warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Daube de Sanglier',
  'Wild boar stew marinated in red wine and herbs.',
  'Dinner',
  'wild boar, red wine, orange, carrot, onion',
  '800g boar, 2 cups red wine, 1 orange zest, 2 carrots, 1 onion',
  419, 13, 4, 2, 10,
  '1. Prep ingredients (wild boar, red wine, orange, carrot...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve daube de sanglier warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Canard à l''Orange',
  'Roast duck with orange sauce.',
  'Dinner',
  'duck, orange, stock, sugar, vinegar',
  '1 duck, 2 oranges, 1 cup stock, 2 tbsp sugar, 1 tbsp vinegar',
  854, 34, 4, 8, 30,
  '1. Prep ingredients (duck, orange, stock, sugar...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve canard à l''orange warm.',
  NULL
);

INSERT INTO recipes (
  name, description, category, ingredients, recipeingredientquantities,
  calories, fat_content, fiber_content, sugar_content, protein_content,
  instructions, image_path
) VALUES (
  'Bifteck Bordelaise',
  'Steak with red wine-shallot bone marrow sauce.',
  'Dinner',
  'steak, red wine, shallot, bone marrow, butter',
  '2 steaks, 1/2 cup red wine, 2 shallots, 2 tbsp bone marrow, 1 tbsp butter',
  886, 41, 5, 7, 39,
  '1. Prep ingredients (steak, red wine, shallot, bone marrow...).\n2. Cook as per French method (sauté, braise, or bake) until done.\n3. Season and serve bifteck bordelaise warm.',
  NULL
);


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// done











































