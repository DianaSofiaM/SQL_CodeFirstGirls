-- which of my customers has the phone number '555-3344'?

USE customers;

  -- which table shows us phone numbers? 
  -- write the subquery first ie matching up on the phone number '555-3344': check what you get!
  -- write the main query second 

SELECT 
    first_name, last_name
FROM
    customers.customer c
WHERE
    c.customer_id IN (SELECT 
            ph.phone_number_customer_id
        FROM
            customers.phone_number ph
        WHERE
            ph.phone_number = '555-3344');
            
            
            
            
            SELECT 
            ph.phone_number_customer_id
        FROM
            customers.phone_number ph
        WHERE
            ph.phone_number = '555-3344';
            
            
-- another example of subquery

SELECT 
    lastName, firstName
FROM
    employees
WHERE
    officeCode IN (SELECT 
            officeCode
        FROM
            offices
        WHERE
            country = 'USA');
            
            
 -- LENGTH() - Return the length of a string in bytes
SELECT LENGTH('CodeFirstGirls'), LENGTH('CodeFirstGirls_12345');

-- CONCAT() - Return concatenated string
SELECT CONCAT('Code', 'First', 'Girls') AS 'Concatenated Result'; 
SELECT CONCAT("Let's", ' ', 'learn', ' SQL') AS 'Concatenated Result';
SELECT CONCAT('Learn', NULL, 'coding') AS 'Concatenated Result';

-- LCASE() -Return the argument in lowercase - Synonym for LOWER()
SELECT LCASE('CodeFirstGirls'), LOWER('LOWER CASE WORD');

-- UCASE() -Return the argument in uppercase - Synonym for UPPER()
SELECT UCASE('CodeFirstGirls'), UPPER('upper case word');

-- LEFT() - Return the leftmost number of characters as specified
SELECT LEFT('CodeFirstGirls', 4), LEFT('Database', 3);

-- RIGHT()- Return the specified rightmost number of characters
SELECT RIGHT('CodeFirstGirls', 5), RIGHT('Database', 4);

-- RTRIM() - Remove trailing spaces
SELECT RTRIM('   CodeFirstGirls   '), LENGTH(RTRIM('   CodeFirstGirls   ')), LENGTH(RTRIM('   CodeFirstGirls'));

-- LTRIM() - Remove leading spaces
SELECT LTRIM('   CodeFirstGirls   '), LENGTH(LTRIM('CodeFirstGirls   '));

-- TRIM() - Remove leading and trailing spaces
SELECT TRIM('   CodeFirstGirls   '), LENGTH(TRIM('CodeFirstGirls'));

-- STRCMP() returns 0 if the strings are the same
-- -1 if the first argument is smaller than the second according to the current sort order
-- 1 if the first argument is larger than the second according to the current sort order
SELECT     STRCMP('MyCodeFirstGirls', 'CodeFirstGirls'), 
        STRCMP('CodeFirstGirls', 'MyCodeFirstGirls'), 
        STRCMP('CodeFirstGirls', 'CodeFirstGirls');

-- REVERSE() - Reverse the characters in a string
SELECT REVERSE('CodeFirstGirls');

-- Table Column
SELECT     CONCAT(first_name, ' ', last_name) AS Concatenated_Full_Name,
        REVERSE(CONCAT(first_name, ' ', last_name)) AS Reversed_Full_Name
FROM customers.customer; -- alternativly use any other DB populated with names (default db sakila.actor comes with names)

-- RAND() - Return a random floating-point value
SELECT RAND() AS RandomValue;
SELECT LEFT(CEILING(RAND()*888),1) AS RandomValue;

-- ABS() - Return the absolute value
SELECT ABS(5), ABS(-5);

-- CEILING() - Return the smallest integer value not less than the argument
SELECT CEILING(12.34), CEILING(-12.34);

-- DEGREES() - Convert radians to degrees
SELECT DEGREES(PI()), DEGREES(PI() / 2);

-- FLOOR() - Return the largest integer value not greater than the argument
SELECT FLOOR(12.34), FLOOR(-12.34);

-- PI() - Return the value of pi
SELECT PI();
-- SELECT PI()+ 0.000000000000000000; use this example to show how to show numbers with lots of decimals 

-- POW() - Return the argument raised to the specified power -  synonym for POWER(X,Y) 
SELECT POW(3,2);
SELECT POWER(8,-1);

-- SQRT() - Return the square root of the argument
SELECT SQRT(4);
SELECT SQRT(16);
SELECT SQRT(256);

-- Table Column
SELECT 	price, 
		ROUND(price) AS Price,
		price-0.10, 
        cast(price-0.10 AS DECIMAL(3,2)), 
        ROUND(price-0.10, 2) R_Price 
FROM bakery.sweet;

-- ADDDATE() or DATE_ADD() - Add time values (intervals) to a date value
SELECT ADDDATE('2020-01-01', INTERVAL 15 DAY), DATE_ADD('2020-01-01', INTERVAL 15 DAY);

-- SUBDATE() or DATE_SUB() - Subtract a time value (interval) from a date
SELECT SUBDATE('2020-01-01', INTERVAL 15 DAY), DATE_SUB('2020-01-01', INTERVAL 15 DAY);

-- Return the current date
SELECT CURDATE(), CURRENT_DATE(), CURRENT_DATE; -- good for queries when we are recording orders, bookings etc. 

-- Return the current time
SELECT CURRENT_TIME(), CURRENT_TIME, CURTIME(); -- good for timestamps

-- Returns the current date and time
SELECT NOW(), CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP;

-- Various date and time part of datetime
SELECT 	NOW(),
		DATE(NOW()),
		TIME(NOW()),
		YEAR(NOW()),
		QUARTER(NOW()),
		MONTH(NOW()),
		WEEK(NOW()),
		DAY(NOW()),
		DAYNAME(NOW()),
		HOUR(NOW()),
		MINUTE(NOW()),
		SECOND(NOW());

-- Format Date and Time
SELECT 	DATE_FORMAT('2020-10-05 11:22:00', '%W %M %Y'),
		DATE_FORMAT('2020-10-05 11:22:00', '%d %b %Y %T:%f'),
		DATE_FORMAT('2020-10-05 11:22:00', '%b %d %Y %h:%i %p');
        
/*
MySQL has many different abbreviations for various formats.alter
You can fuind various online resources to get a full list. Below are some examples
----------
%a	Abbreviated weekday name
%b	Abbreviated month name
%c	Month, numeric
%D	Day of month with English suffix
%d	Day of month, numeric (00-31)
%e	Day of month, numeric (0-31)
%f	Microseconds
%H	Hour (00-23)
%h	Hour (01-12)
%I	Hour (01-12)
%i	Minutes, numeric (00-59)
%j	Day of year (001-366)
%k	Hour (0-23)
%l	Hour (1-12)
%M	Month name
%m	Month, numeric (00-12)
%p	AM or PM
%r	Time, 12-hour (hh:mm:ss AM or PM)
%S	Seconds (00-59)
%s	Seconds (00-59)
%T	Time, 24-hour (hh:mm:ss)
%U	Week (00-53) where Sunday is the first day of week
%u	Week (00-53) where Monday is the first day of week
%V	Week (01-53) where Sunday is the first day of week, used with %X
%v	Week (01-53) where Monday is the first day of week, used with %x
%W	Weekday name
%w	Day of the week (0=Sunday, 6=Saturday)
%X	Year of the week where Sunday is the first day of week, four digits, used with %V
%x	Year of the week where Monday is the first day of week, four digits, used with %v
%Y	Year, four digits
%y	Year, two digits
*/

-- CONVERT()

SELECT CONVERT('2019-08-10 14:47:22', DATE) AS DATE1,
	   CONVERT('2019-08-10 14:47:88', DATE) AS DATE1, -- won't work
       CONVERT('10-08-19 14:47:22', DATE) AS DATE2,
       CONVERT('20190810', DATE) AS DATE3,
       CONVERT('100819', DATE) AS DATE4;

SELECT CONVERT('14:47:22', TIME) AS TIME1,
       CONVERT('144722', TIME) AS TIME2;
       
SELECT CONVERT('2019-08-10 14:47:22', DATETIME) AS DATEnTIME;

SELECT CONVERT('11.1', DECIMAL(4,2)) AS Dec1;

-- functions for controlling the flow
-- Example of CASE Operator

SET @Var = 5; -- try changing the number to different values

SELECT 
    CASE @Var
        WHEN 1 THEN 'one'
        WHEN 2 THEN 'two'
        ELSE 'higher than 2'
    END AS TheNumberIs;


SET @Var = 2; -- try changing the number to different 
SELECT 
    CASE
        WHEN @Var = 1 THEN 'one'
        WHEN @Var = 2 THEN 'two'
        ELSE '2+'
    END AS TheNumberIs;


SET @Var1 = 11;
SET @Var2 = 12;
SELECT 
    CASE
        WHEN (@Var1 = 11 AND @Var2 = 13) THEN 'one'
        WHEN @Var2 = 12 THEN 'two'
        ELSE '2+'
    END AS TheNumberIs;


-- Example of IF functions
SELECT IF(1 > 2, 2, 3); -- statement, result if True, result if False

SELECT IF(1 < 2, 'yes', 'no'); -- statement, result if True, result if False

SELECT IF(YEAR(NOW()) = 2020, 'yes', 'no') AS 'RESULT';


-- Example of IFNULL Function
SELECT IFNULL(1, 0);
SELECT IFNULL(NULL, 0);
SELECT 1 / 0;
SELECT IFNULL(1 / 0, 'Yes');

-- Example of NULLIF Function
-- compare two expressions and returns NULL if they are equal. Otherwise return first expression
SELECT NULLIF(1, 1);
SELECT NULLIF(5, 2);

-- TRANSACTION example script
-- Let's create a very simple sample bank account database

CREATE DATABASE bank;
USE bank;

CREATE TABLE accounts (
	account_number INT NOT NULL,
    account_holder_name VARCHAR(50) NOT NULL,
    account_holder_surname VARCHAR(50) NOT NULL,
    balance FLOAT(2) NOT NULL,
    overdraft_allowed BOOL NOT NULL
    );
    

INSERT INTO accounts
(account_number, account_holder_name, account_holder_surname, balance, overdraft_allowed)
VALUES
(111112, 'Julie', 'Smith', 150, true),
(111113, 'James', 'Andrews', 20, false),
(111114, 'Jack', 'Oakes', -70, true),
(111115, 'Jasper', 'Wolf', 200, true);

SELECT 
    *
FROM
    accounts;


-- 1. start a new transaction
START TRANSACTION;

SELECT 
    @moneyAvailable:=IF(balance > 0, balance, 0) AS MONEY
FROM
    bank.accounts
WHERE
    account_number = 111112
        AND account_holder_surname = 'Smith';
        
--------
SET @TransferAmount = 50;

--------
UPDATE accounts 
SET 
    balance = balance - 50
WHERE
    account_number = 111112
        AND account_holder_surname = 'Smith';
        
--------
UPDATE accounts 
SET 
    balance = balance + 50
WHERE
    account_number = 111115
        AND account_holder_surname = 'Smith';

--------
SELECT *
FROM accounts;

-- 2. (optional) Try Rollback to see how it works
-- ROLLBACK;

-- 3. commit changes 
COMMIT;
