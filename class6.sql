-- views_simple_practice.sql
-- View practice
-- Let's use our DB shop, table Sales1 that we created a while ago 

USE shop;
SELECT 
    *
FROM
    shop.sales1;

-- create view
CREATE VIEW vw_salesmen
AS 
SELECT SalesPerson, SalesAmount
FROM sales1;

SELECT *
FROM vw_salesmen;

-- you can query the view in exactly the same way as a table
SELECT DISTINCT SalesPerson, Max(SalesAmount)
FROM vw_salesmen
WHERE SalesAmount > 70 
GROUP BY SalesPerson;

-- clean up
-- DROP VIEW IF EXISTS vw_salesmen;

-- view_staff_table.sql

-- Create a table that contains information about staff,
-- their names, departments, salary figures
-- Create a view based on the staff table that does not include salary column
-- Insert new data into the staff table through the newly created view. 
-- Create another view based on the staff table, but this time with the check option.
--  Try to include data into the staff table then
-- DROP DATABASE practice;

CREATE DATABASE practice;
USE practice;

-- PART 1

CREATE TABLE practice.staff (
  `employeeID` INT NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `jobtitle` VARCHAR(45) NOT NULL,
  `managerID` INT NOT NULL,
  `department` VARCHAR(45) NULL,
  `salary` INT NOT NULL,
  `dateofbirth` DATE NOT NULL,
  PRIMARY KEY (`employeeID`));

INSERT INTO staff(
    employeeID,
    firstName,
    lastName,
    jobtitle,
    managerID,
    department,
    salary,
    dateofbirth
) 
VALUES(
    1245,
    'Julie',
    'Smith',
    'DBA',
    '3333',
    'Database Administrators',
    50000,
    '1985-10-20'
),
(
    4578,
    'Jamie',
    'Blogs',
    'DBA',
    '3333',
    'Database Administrators',
    52000,
    '1970-10-22'
);

ALTER TABLE practice.staff 
CHANGE COLUMN `salary` `salary` INT NULL DEFAULT 0 ,
CHANGE COLUMN `dateofbirth` `dateofbirth` DATE NULL DEFAULT '1900-01-01';

-- check the info on the table after running this alter table query

SELECT * FROM practice.staff;

-- create a new view
CREATE OR REPLACE VIEW vw_staff_common AS
    SELECT 
        employeeID,
        firstName,
        lastName,
        jobtitle,
        managerID,
        department
        -- we don't want anyone except from HR to see people's salaries or dob, 
        -- so the view would hid either info
    FROM
        staff
    WHERE
        jobtitle LIKE '%DB%';
   
-- vw_staff_common is a simple view, so it is possible to update it

-- Let's insert a row into the staff table through the vw_staff_common view.
INSERT INTO vw_staff_common (
    employeeID,
    firstName,
    lastName,
    jobtitle,
    managerID,
    department
) 
VALUES(
    8888,
    'Mica',
    'Paris',
    'Developer',
    2323,
    'Database Administrators'
);

-- NB that the newly created employee is not visible through the vw_staff_common view 
-- because employee's job title is Developer, which is not like the %DB% pattern. Y

SELECT * FROM vw_staff_common; -- cannot see the new person

SELECT * FROM staff;  --  can see the new person


-- PART 2

-- Let's modify the view to add WITH CHECK OPTION and see how it behaves. 

CREATE OR REPLACE VIEW vw_staff_common2 AS
    SELECT 
        employeeID,
        firstName,
        lastName,
        jobtitle,
        managerID,
        department
    FROM
        staff
    WHERE
        jobtitle LIKE '%DB%' 
	WITH CHECK OPTION;
    
-- Again let's try to insert a row into the staff table through vw_staff_common2
INSERT INTO vw_staff_common2 (
    employeeID,
    firstName,
    lastName,
    jobtitle,
    managerID,
    department
) 
VALUES(
    5555,
    'Thomas',
    'Fisher',
    'Developer',
    8989,
    'Database Administrators'
);
-- our attempt FAILS!!

SELECT * FROM vw_staff_common; 

-- now try to insert a record that complies with the '%DB%' condition
INSERT INTO vw_staff_common2 (
    employeeID,
    firstName,
    lastName,
    jobtitle,
    managerID,
    department
) 
VALUES(
    2222,
    'Thomas',
    'Fisher',
    'DB Developer', -- satisfies the condition
    8989,
    'Database Administrators'
);

SELECT * FROM vw_staff_common; 
SELECT * FROM vw_staff_common2; 

SELECT * FROM staff; 

-- clean up
-- DROP VIEW IF EXISTS vw_staff_common;
-- DROP VIEW IF EXISTS vw_staff_common2;

-- stored_function_example.sql

-- In the bank DB writes a stored function that accepts the customer account's balance
--  as a parameter and is assessing whether he/she is eligible for a credit. 

USE bank;

DELIMITER //
CREATE FUNCTION is_eligible(
    balance INT
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE customer_status VARCHAR(20);
    IF balance > 100 THEN
        SET customer_status = 'YES';
    ELSEIF (balance >= 50 AND 
            balance <= 100) THEN
        SET customer_status = 'MAYBE';
    ELSEIF balance < 50 THEN
        SET customer_status = 'NO';
    END IF;
    RETURN (customer_status);
END//balance
DELIMITER ;

SELECT * FROM bank.accounts;

SELECT 
    account_holder_name,
    account_holder_surname,
    balance,
    is_eligible(balance)
FROM
    accounts;
    
-- clean up
-- DROP FUNCTION is_eligible;

-- stored_procedure_example.sql

-- Create a simple greetings stored procedure

USE practice;

-- Change Delimiter
DELIMITER //
-- Create Stored Procedure
CREATE PROCEDURE Greetings( GreetingWorld VARCHAR(100), FirstName VARCHAR(100))
BEGIN
	DECLARE FullGreeting VARCHAR(200);
	SET FullGreeting = CONCAT(GreetingWorld,' ',FirstName);
	SELECT FullGreeting;
END//
-- Change Delimiter again
DELIMITER ;

-- Call Stored Procedure
CALL Greetings('Bonjour,', 'Dave');
CALL Greetings('Hola,', 'Dora');
CALL Greetings('Terve,', 'Elena');

-- clean up
-- DROP PROCEDURE Greetings;

---------------------
-- Write a stored procedure that accepts parameters
--  and inserts values into a table in the bakery database


USE bakery;
SELECT *
FROM sweet;

-- Change Delimiter
DELIMITER //
-- Create Stored Procedure
CREATE PROCEDURE InsertValue(
IN id INT, 
IN sweetItem VARCHAR(100),
IN price FLOAT)
BEGIN

INSERT INTO sweet(id,item_name, price)
VALUES (id,sweetItem, price);

END//
-- Change Delimiter again
DELIMITER ;

CALL InsertValue (11, 'cherry_cake', 5);


SELECT *
FROM sweet;

-- clean up
-- DROP PROCEDURE InsertValue;

-- trigger_example.sql

-- Write a trigger that activates before the INSERT statement on inserted values

SELECT *
FROM bakery.sweet;

-- BEFORE Trigger Example - this one ensures font consistency for inserted items
-- Change Delimiter
DELIMITER //

CREATE TRIGGER sweetItem_Before_Insert
BEFORE INSERT on sweet
FOR EACH ROW
BEGIN
	SET NEW.item_name = CONCAT(UPPER(SUBSTRING(NEW.item_name,1,1)),
						LOWER(SUBSTRING(NEW.item_name FROM 2)));
END//

-- Change Delimiter
DELIMITER ;

-- Insert Data
INSERT INTO sweet (id, item_name, price)
VALUES (123, 'apple_pie', 1.2);

INSERT INTO sweet (id, item_name, price)
VALUES (456, 'caramel slice', 0.9);

INSERT INTO sweet (id, item_name, price)
VALUES (789, 'YUM YUM', 0.65);


SELECT *
FROM bakery.sweet;


-- events_examples.sql

-- Write a one off event  and recurring event that log timestamp values
--  in a table (similar to a scheduler)

-- Turn ON Event Scheduler 
SET GLOBAL event_scheduler = ON;
USE practice;

-- EXAMPLE 1 --> one time event

CREATE TABLE monitoring_events
(ID INT NOT NULL AUTO_INCREMENT, 
Last_Update TIMESTAMP,
PRIMARY KEY (ID));


-- We are creating an event that will be scheduled for us

-- Change Delimiter
DELIMITER //

CREATE EVENT one_time_event
ON SCHEDULE AT NOW() + INTERVAL 1 MINUTE
DO BEGIN
	INSERT INTO monitoring_events(Last_Update)
	VALUES (NOW());
END//

-- Change Delimiter
DELIMITER ;

-- Select Data to see that our table is empty
-- Then Select data again in approx 1 min to see what happened. 
SELECT *
FROM monitoring_events;

-- Clean up (optional)
-- DROP TABLE monitoring_events;
-- DROP EVENT one_time_event;

-- EXAMPLE 2 --> recurring event

CREATE TABLE monitoring_events_version2
(ID INT NOT NULL AUTO_INCREMENT, 
Last_Update TIMESTAMP,
PRIMARY KEY (ID));

-- Change Delimiter
DELIMITER //

CREATE EVENT recurring_time_event
ON SCHEDULE EVERY 2 SECOND
STARTS NOW()
DO BEGIN
	INSERT INTO monitoring_events_version2(Last_Update)
	VALUES (NOW());
END //

-- Change Delimiter
DELIMITER ;

-- Select Data
SELECT *
FROM monitoring_events_version2
ORDER BY ID DESC;


-- Clean up - this is necessary, otherwise your table will keep on being populated by the event
-- DROP TABLE monitoring_events_version2;
-- DROP EVENT recurring_time_event;

-- Create a simple greetings stored procedure

CREATE DATABASE practice;
USE practice;

-- Change Delimiter
DELIMITER //
-- Create Stored Procedure
CREATE PROCEDURE Greetings( GreetingWorld VARCHAR(100), FirstName VARCHAR(100))
BEGIN
	DECLARE FullGreeting VARCHAR(200);
	SET FullGreeting = CONCAT(GreetingWorld,' ',FirstName);
	SELECT FullGreeting;
END//
-- Change Delimiter again
DELIMITER ;
