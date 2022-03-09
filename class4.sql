-- script for class 4

CREATE DATABASE JOINS_PRACTICE;

USE JOINS_PRACTICE;

-- Create table 1
CREATE TABLE Table1_fruit_basket
(ID INT, Fruit VARCHAR(50));
INSERT INTO Table1_fruit_basket 
(ID, Fruit)
VALUES
(1, 'pear'),
(2, 'apple'),
(3, 'kiwi'),
(4, 'orange'),
(5, 'banana');


-- Create table 2
CREATE TABLE Table2_fruit_basket
(ID INT, Fruit VARCHAR(50));
INSERT INTO Table2_fruit_basket 
(ID, Fruit)
VALUES
(1, 'pear'),table1_fruit_basket
(2, 'apple'),
(3, 'kiwi'),
(6, 'melon'),
(7, 'peach'),
(8, 'plum');

-- DROP DATABASE JOINS_PRACTICE;  -- use this if you need to re-run the script and recreate your table

-- additional table for class 4
USE JOINS_PRACTICE;

-- Create a Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(55),
    ManagerID INT
);

-- Insert Sample Data
INSERT INTO Employee
(EmployeeID, Name, ManagerID)
VALUES
(1, 'Mike', 3),
(2, 'David', 3),
(3, 'Roger', NULL),
(4, 'Marry',2),
(5, 'Joseph',2),
(7, 'Ben',2);

-- Check the data
SELECT 
    *
FROM
    Employee;
    
-- JOINS practice

SELECT *
FROM Table1_fruit_basket;
SELECT *
FROM Table2_fruit_basket;


/* INNER JOIN */
SELECT 
    t1.*, t2.*
FROM
    Table1_fruit_basket t1 -- we have aliased fruit basket 1 as t1
        INNER JOIN
    Table2_fruit_basket t2 -- we have aliased fruit basket 2 as t2
		ON 				   -- this is our keyword for which columns we are matching on from each table
        t1.ID = t2.ID;	   -- where ID of table 1 = ID of table 2


/* INNER JOIN */
SELECT 
    t1.ID AS T1ID,					-- here we are specifying the 4 columns we want given to us
    t1.Fruit AS T1Fruit,
    t2.ID AS T2ID,
    t2.Fruit AS T2Fruit
FROM
    Table1_fruit_basket t1
        INNER JOIN
    Table2_fruit_basket t2 
		ON 
        t1.ID = t2.ID;

/* LEFT JOIN */
SELECT 
    t1.*, t2.*
FROM
    Table1_fruit_basket t1
        LEFT JOIN
    Table2_fruit_basket t2 
		ON 
        t1.ID = t2.ID;

/* RIGHT JOIN */
SELECT 
    t1.*, t2.*
FROM
    Table1_fruit_basket t1
        RIGHT JOIN
    Table2_fruit_basket t2 
		ON 
        t1.ID = t2.ID;

/* OUTER JOIN */
-- Throws an error !!!!!!!! -- see the jamboard with notes about outer join not existing in mysql
SELECT 
	t1.*,t2.*
FROM 
	Table1_fruit_basket t1
		FULL OUTER JOIN 
	Table2_fruit_basket t2 
		ON 
        t1.ID = t2.ID;
        
-- You can emulate FULL OUTER JOIN using UNION:

with two tables t1, t2:

SELECT * FROM Table1_fruit_basket t1
LEFT JOIN Table2_fruit_basket t2 ON t1.ID = t2.ID
UNION
SELECT * FROM Table1_fruit_basket t1
RIGHT JOIN Table2_fruit_basket t2 ON t1.id = t2.id

/* LEFT JOIN - WHERE NULL */
SELECT 
    t1.*, t2.*
FROM
    Table1_fruit_basket t1
        LEFT JOIN
    Table2_fruit_basket t2 ON t1.ID = t2.ID
WHERE
    t2.ID IS NULL;



-- PRACTICE DEMO CONTINUES - after slide 17

/* CROSS JOIN */
SELECT t1.*,t2.*
FROM Table1_fruit_basket t1
CROSS JOIN Table2_fruit_basket t2;

-- Clean up (optional)
DROP TABLE Table1;
DROP TABLE Table2;
