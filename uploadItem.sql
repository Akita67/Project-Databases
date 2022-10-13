SET autocommit = 0;
start transaction;
USE `mydb` ;


	#the drink insert list
INSERT INTO menu(idMenu) VALUES ('coca cola');
INSERT INTO drink(idDrink,price) VALUES ('coca cola',2.00);
INSERT INTO menu(idMenu) VALUES ('fanta');
INSERT INTO drink(idDrink,price) VALUES ('fanta',2.00);
INSERT INTO menu(idMenu) VALUES ('wine');
INSERT INTO drink(idDrink,price) VALUES ('wine',3.50);
INSERT INTO menu(idMenu) VALUES ('water');
INSERT INTO drink(idDrink,price) VALUES ('water',1.00);

	#the menu insert list
INSERT INTO menu(idMenu) VALUES ('tiramisu');
INSERT INTO dessert(idDessert,price) VALUES ('tiramisu',8.00);
INSERT INTO menu(idMenu) VALUES ('pizza nutella');
INSERT INTO dessert(idDessert,price) VALUES ('pizza nutella',8.00);
INSERT INTO menu(idMenu) VALUES ('pannacotta');
INSERT INTO dessert(idDessert,price) VALUES ('pannacotta',8.00);
INSERT INTO menu(idMenu) VALUES ('ice cream');
INSERT INTO dessert(idDessert,price) VALUES ('ice cream',5.00);

	#Pizza into menu
INSERT INTO menu(idMenu) VALUES ('4 cheese');
INSERT INTO menu(idMenu) VALUES ('forbigboys');
INSERT INTO menu(idMenu) VALUES ('hawai');
INSERT INTO menu(idMenu) VALUES ('la jounaid');
INSERT INTO menu(idMenu) VALUES ('la laurent');
INSERT INTO menu(idMenu) VALUES ('marguerita');
INSERT INTO menu(idMenu) VALUES ('mexican');
INSERT INTO menu(idMenu) VALUES ('Summer Pizza');
INSERT INTO menu(idMenu) VALUES ('the special');
INSERT INTO menu(idMenu) VALUES ('Winter edition');
	#Add pizza into pizza
INSERT INTO pizza(idPizza) VALUES ('4 cheese');
INSERT INTO pizza(idPizza) VALUES ('forbigboys');
INSERT INTO pizza(idPizza) VALUES ('hawai');
INSERT INTO pizza(idPizza) VALUES ('la jounaid');
INSERT INTO pizza(idPizza) VALUES ('la laurent');
INSERT INTO pizza(idPizza) VALUES ('marguerita');
INSERT INTO pizza(idPizza) VALUES ('mexican');
INSERT INTO pizza(idPizza) VALUES ('Summer Pizza');
INSERT INTO pizza(idPizza) VALUES ('the special');
INSERT INTO pizza(idPizza) VALUES ('Winter edition');

	#add Ingredient into ingredients
INSERT INTO ingredient(idIngredient,price,vegetarian) VALUES ('tomato sauce',1.00,1);
INSERT INTO ingredient(idIngredient,price,vegetarian) VALUES ('tomatos',1.00,1);
INSERT INTO ingredient(idIngredient,price,vegetarian) VALUES ('onion',0.50,1);
INSERT INTO ingredient(idIngredient,price,vegetarian) VALUES ('pineapple',0.50,1);
INSERT INTO ingredient(idIngredient,price,vegetarian) VALUES ('curry leaves',0.50,1);
INSERT INTO ingredient(idIngredient,price,vegetarian) VALUES ('coriander',0.50,1);
INSERT INTO ingredient(idIngredient,price,vegetarian) VALUES ('cream',1.00,1);
INSERT INTO ingredient(idIngredient,price,vegetarian) VALUES ('olives',1.00,1);
INSERT INTO ingredient(idIngredient,price,vegetarian) VALUES ('mozzarela',2.00,1);
INSERT INTO ingredient(idIngredient,price,vegetarian) VALUES ('blue cheese',2.00,1);
INSERT INTO ingredient(idIngredient,price,vegetarian) VALUES ('garlic',1.00,1);
INSERT INTO ingredient(idIngredient,price,vegetarian) VALUES ('sausages',3.00,0);
INSERT INTO ingredient(idIngredient,price,vegetarian) VALUES ('ketchup',1.00,1);
INSERT INTO ingredient(idIngredient,price,vegetarian) VALUES ('beef',5.00,0);
INSERT INTO ingredient(idIngredient,price,vegetarian) VALUES ('gouda',3.00,1);
INSERT INTO ingredient(idIngredient,price,vegetarian) VALUES ('spinach',1.00,1);
INSERT INTO ingredient(idIngredient,price,vegetarian) VALUES ('pizza dough',3.00,1);
INSERT INTO ingredient(idIngredient,price,vegetarian) VALUES ('emmental',2.00,1);
INSERT INTO ingredient(idIngredient,price,vegetarian) VALUES ('anchovy',9.00,0);

	#insert ingredients into ingredient pizza
INSERT INTO ingredient_pizza(idPizza,idIngredient) VALUES ('4 cheese','pizza dough');
INSERT INTO ingredient_pizza(idPizza,idIngredient) VALUES ('4 cheese','tomato sauce');
INSERT INTO ingredient_pizza(idPizza,idIngredient) VALUES ('4 cheese','mozzarela');
INSERT INTO ingredient_pizza(idPizza,idIngredient) VALUES ('4 cheese','gouda');
INSERT INTO ingredient_pizza(idPizza,idIngredient) VALUES ('4 cheese','blue cheese');
INSERT INTO ingredient_pizza(idPizza,idIngredient) VALUES ('4 cheese','emmental');

INSERT INTO ingredient_pizza(idPizza,idIngredient) VALUES ('forbigboys','pizza dough');
INSERT INTO ingredient_pizza(idPizza,idIngredient) VALUES ('forbigboys','tomato sauce');
INSERT INTO ingredient_pizza(idPizza,idIngredient) VALUES ('forbigboys','beef');
INSERT INTO ingredient_pizza(idPizza,idIngredient) VALUES ('forbigboys','cream');
INSERT INTO ingredient_pizza(idPizza,idIngredient) VALUES ('forbigboys','olives');
INSERT INTO ingredient_pizza(idPizza,idIngredient) VALUES ('forbigboys','sausages');
INSERT INTO ingredient_pizza(idPizza,idIngredient) VALUES ('forbigboys','spinach');

INSERT INTO ingredient_pizza(idPizza,idIngredient) VALUES ('la jounaid','pizza dough');
INSERT INTO ingredient_pizza(idPizza,idIngredient) VALUES ('la jounaid','tomato sauce');
INSERT INTO ingredient_pizza(idPizza,idIngredient) VALUES ('la jounaid','olives');
INSERT INTO ingredient_pizza(idPizza,idIngredient) VALUES ('la jounaid','anchovy');
INSERT INTO ingredient_pizza(idPizza,idIngredient) VALUES ('la jounaid','gouda');

commit;

