
CREATE DATABASE db_food;

use db_food;
CREATE TABLE users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(50),
	email VARCHAR(255),
	password VARCHAR(255)
)
-- tạo data cho table users
INSERT INTO users (full_name, email, password) VALUES
('John Doe', 'john.doe@example.com', 'password1'),
('Jane Smith', 'jane.smith@example.com', 'password2'),
('Michael Johnson', 'michael.johnson@example.com', 'password3'),
('Emily Brown', 'emily.brown@example.com', 'password4'),
('Daniel Wilson', 'daniel.wilson@example.com', 'password5'),
('Sarah Taylor', 'sarah.taylor@example.com', 'password6'),
('Matthew Martinez', 'matthew.martinez@example.com', 'password7'),
('Jessica Anderson', 'jessica.anderson@example.com', 'password8'),
('David Thomas', 'david.thomas@example.com', 'password9'),
('Jennifer Garcia', 'jennifer.garcia@example.com', 'password10'),
('James Hernandez', 'james.hernandez@example.com', 'password11'),
('Linda Walker', 'linda.walker@example.com', 'password12'),
('Christopher Hall', 'christopher.hall@example.com', 'password13'),
('Mary Young', 'mary.young@example.com', 'password14'),
('Robert Allen', 'robert.allen@example.com', 'password15'),
('Patricia King', 'patricia.king@example.com', 'password16'),
('Richard Scott', 'richard.scott@example.com', 'password17'),
('Barbara Green', 'barbara.green@example.com', 'password18'),
('Daniel Clark', 'daniel.clark@example.com', 'password19'),
('Elizabeth Baker', 'elizabeth.baker@example.com', 'password20')


SELECT * FROM users

-- table restaurant
CREATE TABLE restaurants(
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(100),
	image VARCHAR(255),
	description VARCHAR(255)
)

-- tạo data 
INSERT INTO restaurants (res_name, image, description) VALUES
("Pizza Palace", "images/pizza_palace.jpg", "Delicious pizzas made with fresh ingredients and a variety of toppings."),
("Noodle Nirvana", "images/noodle_nirvana.jpg", "Authentic Asian noodle dishes with bold flavors and generous portions."),
("Taco Fiesta", "images/taco_fiesta.jpg", "Lively atmosphere with traditional and creative tacos, plus margaritas."),
("The Curry Corner", "images/curry_corner.jpg", "Exquisite Indian curries with fragrant spices and a range of vegetarian options."),
("Burger Barn", "images/burger_barn.jpg", "Classic American burgers made with juicy patties, fresh toppings, and crispy fries."),
("Sushi Symphony", "images/sushi_symphony.jpg", "Upscale sushi restaurant offering fresh seafood, creative rolls, and traditional Japanese dishes."),
("Crepe Heaven", "images/crepe_heaven.jpg", "Sweet and savory crepes made with authentic French batter and a variety of delicious fillings."),
("Happy Wok", "images/happy_wok.jpg", "Healthy and flavorful stir-fries with fresh vegetables, protein options, and homemade sauces."),
("Mamma's Kitchen", "images/mammas_kitchen.jpg", "Homestyle cooking with comforting dishes like pasta, lasagna, and slow-cooked meats."),
("The Grill House", "images/grill_house.jpg", "High-quality steaks, seafood, and other grilled specialties in an elegant setting."),
("Burrito Bandits", "images/burrito_bandits.jpg", "Large and flavorful burritos, tacos, and other Mexican favorites with fresh ingredients."),
("Pasta Paradise", "images/pasta_paradise.jpg", "Italian comfort food with a variety of pasta dishes, sauces, and fresh seafood options."),
("The Ramen Shop", "images/ramen_shop.jpg", "Authentic Japanese ramen with savory broths, perfectly cooked noodles, and customizable toppings."),
("Falafel Frenzy", "images/falafel_frenzy.jpg", "Delicious and healthy Middle Eastern cuisine featuring falafel wraps, pita bread, and fresh dips."),
("The French Table", "images/french_table.jpg", "Romantic French bistro offering classic dishes like steak frites, escargot, and decadent desserts."),
("Taco Tuesday Everyday", "images/taco_tuesday_everyday.jpg", "Casual eatery celebrating tacos every day with creative fillings, delicious salsas, and refreshing drinks."),
("Dim Sum Delight", "images/dim_sum_delight.jpg", "Traditional and innovative dim sum dishes in a vibrant and bustling atmosphere."),
("The Healthy Choice", "images/healthy_choice.jpg", "Fresh and nutritious meals with a focus on healthy ingredients, dietary needs, and delicious flavors."),
("Coffee Corner & Bakery", "images/coffee_corner_bakery.jpg", "Cozy cafe offering delicious coffee drinks, fresh-baked pastries, and light lunch options.");

CREATE TABLE like_res(
	like_res_id INT PRIMARY KEY AUTO_INCREMENT,
	
	-- thiet lap khoa ngoai cho column user_id
	-- va tham chieu den user_id cua table users
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id),

	res_id INT,
	FOREIGN KEY(res_id) REFERENCES restaurants(res_id),

	date_like DATE
)

-- tạo data cho table like_res
INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1, 3, "2024-07-03"),  
(2, 5, "2024-06-20"),  
(3, 1, "2024-05-12"),  
(1, 7, "2024-07-02"),  
(4, 2, "2024-06-25"),  
(2, 10, "2024-06-18"),  
(5, 8, "2024-07-01"),  
(3, 14, "2024-04-10"),  
(1, 16, "2024-06-30"),  
(4, 18, "2024-06-15")  



-- tạo table rate_res
CREATE TABLE rate_res(
	rate_res_id INT PRIMARY KEY AUTO_INCREMENT,

	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	
	res_id INT,
	FOREIGN KEY(res_id) REFERENCES restaurants(res_id),
	
	amount INT,
	date_rate DATE
);
-- tạo data
INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1, 3, 5, "2024-07-03"),  -- User 1 rates Taco Fiesta 5 stars on 2024-07-03
(2, 5, 4, "2024-06-20"),  -- User 2 rates Burger Barn 4 stars on 2024-06-20
(3, 1, 4, "2024-05-12"),  -- User 3 rates Pizza Palace 4 stars on 2024-05-12
(4, 7, 5, "2024-07-02"),  -- User 4 rates Crepe Heaven 5 stars on 2024-07-02
(1, 2, 3, "2024-06-22"),  -- User 1 rates Noodle Nirvana 3 stars on 2024-06-22
(5, 10, 5, "2024-06-19"),  -- User 5 rates The Grill House 5 stars on 2024-06-19
(3, 8, 4, "2024-07-01"),  -- User 3 rates Happy Wok 4 stars on 2024-07-01
(2, 14, 4, "2024-06-27"),  -- User 2 rates The Ramen Shop 4 stars on 2024-06-27
(4, 16, 5, "2024-06-12"),  -- User 4 rates Taco Tuesday Everyday 5 stars on 2024-06-12
(1, 18, 3, "2024-06-25"),  -- User 1 rates The Healthy Choice 3 stars on 2024-06-25

(6, 1, 5, "2024-03-15"),  -- Additional entries with different users and restaurants
(7, 9, 4, "2024-05-08"),
(8, 12, 5, "2024-04-20"),
(9, 6, 3, "2024-02-10"),
(10, 15, 4, "2024-01-25")

-- table food_type
CREATE TABLE food_type(
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(100)
)
-- tạo data
INSERT INTO food_type (type_name) VALUES
("Italian"),
("Mexican"),
("Asian"),
("American"),
("French"),
("Mediterranean"),
("Indian"),
("Vegetarian"),
("Healthy"),
("Fast Food");

-- tạo table food
CREATE TABLE food(
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(100),
	price FLOAT,
	image VARCHAR(255),
	description TEXT,
	
	-- foreign key
	type_id INT,
	FOREIGN KEY(type_id) REFERENCES food_type(type_id)
)
-- tạo data
INSERT INTO food (food_name, price, image, description, type_id) VALUES
("Margherita Pizza", 12.99, "images/margherita_pizza.jpg", "Classic pizza with tomato sauce, mozzarella cheese, and fresh basil.", 1),  /* Italian */
("Chicken Fajitas", 15.50, "images/chicken_fajitas.jpg", "Sizzling grilled chicken strips with peppers and onions, served with tortillas, salsa, and guacamole.", 2),  /* Mexican */
("Pad Thai", 11.75, "images/pad_thai.jpg", "Stir-fried rice noodles with chicken, vegetables, and a flavorful peanut sauce.", 3),  /* Asian */
("Cheeseburger", 9.99, "images/cheeseburger.jpg", "All-American cheeseburger with a juicy beef patty, melted cheddar cheese, lettuce, tomato, and onion on a toasted bun.", 4),  /* American */
("Ratatouille", 14.25, "images/ratatouille.jpg", "Provençal vegetable stew with eggplant, zucchini, tomatoes, and herbs.", 6),  /* Mediterranean */
("Butter Chicken", 13.95, "images/butter_chicken.jpg", "Creamy Indian curry with tender chicken in a spiced tomato gravy.", 7), /* Indian */
("Black Bean Burger", 10.50, "images/black_bean_burger.jpg", "Vegetarian burger made with black beans, corn, and spices, served on a whole wheat bun.", 8),  /* Vegetarian */
("Salmon with Roasted Vegetables", 18.75, "images/salmon_roasted_vegetables.jpg", "Grilled salmon fillet with roasted seasonal vegetables", 5),  /* French (can be considered healthy) */
("Quinoa Salad", 11.25, "images/quinoa_salad.jpg", "Healthy and flavorful salad with quinoa, vegetables, and a light vinaigrette dressing.", 9),  /* Healthy */
("Chicken Tenders", 8.99, "images/chicken_tenders.jpg", "Crispy breaded chicken tenders with dipping sauces.", 10),  /* Fast Food */
("Sushi Set", 17.50, "images/sushi_set.jpg", "Assortment of sushi pieces and nigiri.", 3),  /* Asian */
("Beef Lasagna", 14.95, "images/beef_lasagna.jpg", "Classic Italian layered pasta dish with ground beef, tomato sauce, and béchamel sauce.", 1), /* Italian */
("Tacos Al Pastor", 12.25, "images/tacos_al_pastor.jpg", "Marinated pork tacos with pineapple, onions, and cilantro.", 2), /* Mexican */
("Chicken Tikka Masala", 13.75, "images/chicken_tikka_masala.jpg", "Creamy Indian curry with marinated chicken in a tomato-based sauce.", 7), /* Indian */
("French Fries", 3.50, "images/french_fries.jpg", "Classic side dish of crispy French fries.", 10) /* Fast Food */


-- tạo table
CREATE TABLE orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	
	-- khóa ngoại user_id
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	
	-- khóa ngoại food_id
	food_id INT,
	FOREIGN KEY(food_id) REFERENCES food(food_id),
	
	amount INT,
	code VARCHAR(20),
	
	arr_sub_id VARCHAR(255)
)
-- tạo data
INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id) VALUES
(1, 3, 2, "ORDER123", "[1,2,3]"),  -- User 1 orders 2 Margherita Pizzas (food_id 3)
(2, 5, 1, "ORDER456", "[4,2,3]"),  -- User 2 orders 1 Cheeseburger (food_id 5)
(3, 1, 1, "ORDER789", "[1,2,3]"),  -- User 3 orders 1 Pad Thai (food_id 1)
(4, 7, 3, "ORDER012", "[]"),  -- User 4 orders 3 Black Bean Burgers (food_id 7)
(1, 12, 1, "ORDER345", "[]"),  -- User 1 orders 1 Sushi Set (food_id 12)
(5, 2, 2, "ORDER678", "[]"),  -- User 5 orders 2 Chicken Fajitas (food_id 2)
(3, 8, 1, "ORDER901", "[]"),  -- User 3 orders 1 Salmon with Roasted Vegetables (food_id 8)
(2, 10, 2, "ORDER234", "[]"),  -- User 2 orders 2 Chicken Tenders (food_id 10)
(4, 14, 1, "ORDER567", "[]"),  -- User 4 orders 1 Chicken Tikka Masala (food_id 14)
(1, 4, 1, "ORDER890", "[5,6,7]"),  -- User 1 orders 1 Butter Chicken (food_id 4)
(6, 11, 1, "ORDER102", "[1]"),  -- User 6 orders 1 Quinoa Salad (food_id 11) with additional notes in arr_sub_id (replace with actual notes)
(7, 9, 2, "ORDER349", "[]"),  -- User 7 orders 2 Tacos Al Pastor (food_id 9)
(8, 6, 1, "ORDER781", "[3,7,9]"),  -- User 8 orders 1 Beef Lasagna (food_id 6)
(5, 13, 1, "ORDER092", "[]"),  -- User 5 orders 1 French Fries (food_id 13)
(9, 15, 3, "ORDER510", "[]")

select * from users
select * from like_res

--cau 1
select COUNT(lr.user_id) as count_like, u.full_name from like_res as lr
inner join users as u
on u.user_id = lr.user_id
GROUP BY u.full_name
ORDER BY COUNT(u.user_id) DESC
LIMIT 5

--cau2
select COUNT(lr.res_id) as count_like, r.res_name from like_res as lr
inner join restaurants as r
on r.res_id = lr.user_id
GROUP BY r.res_name
ORDER BY count_like DESC
LIMIT 2

-- câu 3: 

SELECT COUNT(o.user_id) as count_orders, u.full_name 
FROM orders as o
INNER JOIN users as u
ON u.user_id = o.user_id
GROUP BY u.full_name
ORDER BY count_orders DESC
LIMIT 1;

--câu 4 : 
SELECT u.user_id, u.full_name
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
LEFT JOIN like_res lr ON u.user_id = lr.user_id
LEFT JOIN rate_res rr ON u.user_id = rr.user_id
WHERE o.order_id IS NULL
  AND lr.like_res_id IS NULL
  AND rr.rate_res_id IS NULL;