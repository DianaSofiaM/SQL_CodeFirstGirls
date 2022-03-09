-- using the table parts, select all unique part names
SELECT *
FROM part;

SELECT DISTINCT
p.pname
FROM part p;

-- show all unique parts and their ids from the parts table
SELECT DISTINCT
p.pname, p.p_id
FROM part p;

-- refer to table projects and return all the projects that are run in London
SELECT *
FROM project j
WHERE j.CITY ='London';

SELECT DISTINCT
j.j_id, j.jname, j.city
FROM project j
WHERE j.city = 'London';


-- Design and create a relational normalised database called customers

-- set reasonable primary keys to the tables

-- set NOT NULL constraints on the columns that you think must have values

CREATE DATABASE customers;
USE customers;


CREATE TABLE customer (
	customer_id INTEGER NOT NULL,
    first_name VARCHAR(55) NOT NULL,
    last_name VARCHAR(55) NULL,
    CONSTRAINT PK_customer PRIMARY KEY (customer_id)
);


CREATE TABLE address (
	address_id INTEGER NOT NULL,
    building_number VARCHAR(55) NOT NULL,
	street VARCHAR(55) NOT NULL,
    city VARCHAR(55),
    post_code VARCHAR(55) NOT NULL,
    country VARCHAR(55),
	CONSTRAINT PK_address PRIMARY KEY (address_id)
);

CREATE TABLE email_address (
    email_address_id INTEGER NOT NULL,
    email_address_customer_id INTEGER,
    email_address VARCHAR(55) NOT NULL,
    CONSTRAINT PK_email_address PRIMARY KEY (email_address_id)
);


CREATE TABLE phone_number (
    phone_number_id INTEGER NOT NULL,
    phone_number_customer_id INTEGER NOT NULL,
    phone_number VARCHAR(55) NOT NULL,
    CONSTRAINT PK_phone_number PRIMARY KEY (phone_number_id)
);

CREATE TABLE orders (
    order_id INTEGER NOT NULL,
    orders_customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    CONSTRAINT PK_order_id PRIMARY KEY (order_id)
);

INSERT INTO address
(address_id, building_number, street, city, post_code, country)
VALUES
(1, '20', 'Birch Alley', 'London', 'SE24 0AB', 'UK'),
(2, '17', 'Oak Street', 'London', 'SE25 0XY', NULL);

INSERT INTO customer
(customer_id, first_name, last_name)
VALUES
(1, 'Jon', 'Flanders'),
(2, 'Sam', 'Smith');

INSERT INTO email_address
(email_address_id, email_address_customer_id, email_address)
 VALUES
 (1, 2, 'ssmith@mail.com'),
 (2, 1, 'jon@mail.com');
 
 INSERT INTO phone_number
 (phone_number_id, phone_number_customer_id, phone_number)
 VALUES
 (1, 1, '555-1212'),
 (2, 2, '555-3344');
 
 INSERT INTO orders
 (order_id, orders_customer_id, order_date)
 VALUES
 (1, 1, '2019-08-20'),
 (2, 2, '2019-03-15');

-- use PARTS DB to write the following queries
-- find the name and weight of each red part

USE parts;
SELECT * FROM part WHERE colour = 'red';

-- find all unique suppliers name from London

USE parts;
SELECT DISTINCT * FROM supplier WHERE city = 'london';


-- add some data to the tables in the customers database
-- alter tables email_address and phone_number in the customers database by adding Foreign Keys that reference Primary Keys from relevant tables.
-- remove the table called orders from our database

CREATE TABLE address (
    address_id INTEGER NOT NULL,
    building_number VARCHAR(55) NOT NULL,
    street VARCHAR(55) NOT NULL,
    city VARCHAR(55),
    post_code VARCHAR(55) NOT NULL,
    country VARCHAR(55),
    CONSTRAINT PK_address PRIMARY KEY (address_id)
);

CREATE TABLE email_address (
    email_address_id INTEGER NOT NULL,
    email_address_customer_id INTEGER,
    email_address VARCHAR(55) NOT NULL,
    CONSTRAINT PK_email_address PRIMARY KEY (email_address_id)
);

CREATE TABLE phone_number (
    phone_number_id INTEGER NOT NULL,
    phone_number_customer_id INTEGER NOT NULL,
    phone_number VARCHAR(55) NOT NULL,
    CONSTRAINT PK_phone_number PRIMARY KEY (phone_number_id)
);

CREATE TABLE orders (
    order_id INTEGER NOT NULL,
    orders_customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    CONSTRAINT PK_order_id PRIMARY KEY (order_id)
);

INSERT INTO address
(address_id, building_number, street, city, post_code, country)
VALUES
(1, ‘20’, ‘Birch Alley’, ‘London’, ‘SE24 0AB’, ‘UK’),
(2, ‘17’, ‘Oak Street’, ‘London’, ‘SE25 0XY’, NULL);

INSERT INTO customer
(customer_id, first_name, last_name)
VALUES
(1, ‘Jon’, ‘Flanders’),
(2, ‘Sam’, ‘Smith’);
INSERT INTO email_address
(email_address_id, email_address_customer_id, email_address)
 VALUES
 (1, 2, ‘ssmith@mail.com’),
 (2, 1, ‘jon@mail.com’);
 
 INSERT INTO phone_number
 (phone_number_id, phone_number_customer_id, phone_number)
 VALUES
 (1, 1, ‘555-1212’),
 (2, 2, ‘555-3344’);
 
 INSERT INTO orders
 (order_id, orders_customer_id, order_date)
 VALUES
 (1, 1, ‘2019-08-20’),
 (2, 2, ‘2019-03-15’);
 
