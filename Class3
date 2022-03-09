-- create a new database called SHOP
-- add a new table called SALES1 

CREATE DATABASE shop;

USE shop;

CREATE TABLE SALES1 (
	store VARCHAR(45) NOT NULL,
    week INTEGER NOT NULL,
    day VARCHAR(55) NOT NULL,
    SalesPerson VARCHAR(45) NOT NULL,
    SalesAmount integer not null,
    month VARCHAR(45)
);

INSERT INTO SALES1
(store,week, day, SalesPerson, SalesAmount, month)
VALUES
('London', '2', 'Monday', 'Frank', '56.25', 'May'),
('London', '5', 'Tuesday', 'Frank', '74.32', 'Sep'),
('London', '5', 'Monday', 'Bill', '98.42', 'Sep'),
('London', '5', 'Saturday', 'Bill', '73.90', 'Dec'),
('London', '1', 'Tuesday', 'Josie', '44.27', 'Sep'),
('Dusseldorf', '4', 'Monday', 'Manfred', '77.00', 'Jul'),
('Dusseldorf', '3', 'Tuesday', 'Inga', '9.99', 'Jun'),
('Dusseldorf', '4', 'Wednesday', 'Manfred', '86.81', 'Jul'),
('London', '6', 'Friday', 'Josie', '74.02', 'Oct'),
('Dusseldorf', '1', 'Saturday', 'Manfred', '43.11', 'Apr');

SELECT * FROM SALES1;

-- DATABASE BAKERY
-- create database
CREATE DATABASE Bakery;

USE Bakery;

CREATE TABLE Sweet (
    id INT NOT NULL,
    item_name VARCHAR(50) NOT NULL,
    price FLOAT(2)
);

CREATE TABLE Savoury (
    id INT NOT NULL,
    item_name VARCHAR(50) NOT NULL,
    price FLOAT(2),
    main_ingredient VARCHAR(50)
);

-- Populate the Sweet table

INSERT INTO Sweet
(id, item_name, price)
VALUES
(1, 'doughnut', 0.50),
(2, 'croissant', 0.75),
(3, 'pain au chocolat', 0.55),
(4, 'cinnamon twirl', 0.45),
(5, 'cannoli', 0.88),
(6, 'apple tart', 1.12);

-- Populate the Savoury table

INSERT INTO Savoury
(id, item_name, price, main_ingredient)
VALUES
(1, 'meat pie', 1.25, 'pork'),
(2, 'sausage roll', 1.00, null),
(3, 'pasty', 2.45, 'beef');

-- Use select * statements to check tables
-- find all savoury items that have either pork or beef filling
SELECT * FROM Bakery.savoury;

SELECT * FROM savoury 
WHERE main_ingredient = 'pork' 
OR  main_ingredient = 'beef';

-- find all sweet items that cost 50 cents or cheaper
SELECT * FROM bakery.sweet;

SELECT * FROM sweet
WHERE price <= 0.5;

-- find all sweet items and their price, except for cannoli
SELECT * FROM bakery.sweet;

SELECT item_name, price FROM sweet
WHERE NOT item_name="cannoli";

SELECT item_name, price FROM sweet
WHERE item_name!='cannoli';

-- find all sweet items that start with the letter 'c'
SELECT * FROM bakery.sweet;

SELECT * FROM sweet
WHERE item_name LIKE 'c%';

-- find all savoury items that cost more than 1 pound, but less than 3 pounds
SELECT * FROM savoury;

SELECT * FROM savoury
WHERE price BETWEEN 1.01 AND 2.99;
