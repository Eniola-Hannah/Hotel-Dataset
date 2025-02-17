CREATE DATABASE Hotel;

USE Hotel;

SELECT * FROM hotel_dataset;

SET SQL_SAFE_UPDATES = 0;

-- DATA CLEANING TASKS: 
-- Standardize Date_of_Booking to YYYY-MM-DD.        (Currently at m/d/y format)
UPDATE hotel_dataset
SET `Date of Booking` = STR_TO_DATE(`Date of Booking`, "%m/%d/%YYY");

ALTER TABLE hotel_dataset
MODIFY COLUMN `Date of Booking` DATE;

-- Rename column headers to follow a consistent format (e.g., Date_of_Booking → Booking_Date)
ALTER TABLE hotel_dataset
RENAME COLUMN `Date of Booking` TO Booking_Date;

-- Correct invalid entries in Age, Hotel_Rating, and Discount.
UPDATE hotel_dataset
SET Discount = REPLACE(Discount, "%", "");
SELECT Discount FROM hotel_dataset;

-- Ensure that the column headers are in the right format. 
ALTER TABLE hotel_dataset
RENAME COLUMN `Booking ID` TO Booking_id;

ALTER TABLE hotel_dataset
RENAME COLUMN `Customer ID` TO Customer_id;

ALTER TABLE hotel_dataset
RENAME COLUMN `Origin Country` TO Origin_Country;

ALTER TABLE hotel_dataset
RENAME COLUMN `Hotel Name` TO Hotel_Name;

ALTER TABLE hotel_dataset
RENAME COLUMN `Hotel Rating` TO Hotel_Rating;

ALTER TABLE hotel_dataset
RENAME COLUMN `Booking Price[SGD]` TO `Booking_Price(SGD)`;

-- Ensure that the data types are in the correct type. 
ALTER TABLE hotel_dataset
MODIFY COLUMN Discount INT;

-- BASIC QUERIES
-- Retrieve all columns from the dataset. 
SELECT * FROM hotel_dataset;

-- Select only the Hotel_Name and Booking_Price columns.
SELECT Hotel_Name, `Booking_Price(SGD)` FROM hotel_dataset;

-- Fetch all records where Gender is "Female" 
SELECT * FROM hotel_dataset
WHERE Gender = "Female";

-- List all bookings with Hotel_Rating greater than 4
SELECT Booking_id, Booking_Date, `Booking_Price(SGD)`, Hotel_Rating FROM hotel_dataset
WHERE Hotel_Rating > 4.0;

-- Display customers aged between 25 and 40.
SELECT Customer_id, Age FROM hotel_dataset
WHERE Age >=25 AND Age <=40;

-- Fetch the unique Origin_Country values from the dataset.
SELECT DISTINCT Origin_Country FROM hotel_dataset;

-- Find the BookingID, Customer_ID, and Hotel_Name where Discount is exactly 20%.
SELECT  Booking_id, Customer_id, Hotel_Name, Discount FROM hotel_dataset
WHERE Discount = 20;

-- USING 'LIKE' OPERATOR 
-- List all customers whose Hotel_Name starts with "The" 
SELECT Customer_id, Hotel_Name FROM hotel_dataset
WHERE Hotel_Name LIKE "The%";

-- Retrieve bookings where the Origin_Country contains the substring "bod" 
SELECT Booking_id, Origin_Country FROM hotel_dataset
WHERE Origin_Country LIKE "%bod%";

-- Find customers whose Customer_ID ends with "5." 
SELECT Customer_id FROM hotel_dataset
WHERE Customer_id LIKE "%5";

-- Display hotels with names containing the word "The"
SELECT Hotel_Name FROM hotel_dataset
WHERE Hotel_Name LIKE "%The%";

-- List all bookings where the Hotel_Name starts with "E" and ends with "Ion" 
SELECT Booking_id, Hotel_Name FROM hotel_dataset
WHERE Hotel_Name LIKE "E%Ion";

SELECT Booking_id, Hotel_Name FROM hotel_dataset
WHERE Hotel_Name LIKE "E%" AND Hotel_Name LIKE "%Ion";


-- USING BETWEEN OPERATOR
-- Retrieve bookings where Booking_Price is between $100 and $500
SELECT Booking_id, `Booking_Price(SGD)` FROM hotel_dataset
WHERE `Booking_Price(SGD)` BETWEEN 100 and 500;

-- Finds all hotels with a Hotel_Rating between 3 and 5
SELECT Hotel_Name, Hotel_Rating FROM hotel_dataset
WHERE Hotel_Rating BETWEEN 3.0 AND 5.0;

-- Fetch bookings where Age is between 18 and 25. 
SELECT Booking_id, Age FROM hotel_dataset
WHERE Age BETWEEN 18 AND 25;

-- List all discounts between 10% and 30%
SELECT Discount FROM hotel_dataset
WHERE Discount BETWEEN 10 AND 30;

-- Display bookings made on dates between 1/26/2010 and 2/6/2010.
SELECT Booking_id, Booking_Date FROM hotel_dataset
WHERE Booking_Date BETWEEN "2010-01-26" AND "2010-02-06";


-- USING IN OPERATOR
--  Find bookings where the Origin_Country is either "Thailand", "Singapore", or "Malaysia" 
SELECT Booking_id, Origin_Country FROM hotel_dataset
WHERE Origin_Country IN ("Thailand", "Singapore", "Malaysia");

-- Retrieve hotels with Hotel_Rating of 3.3, 4.4, or 4.5
SELECT Hotel_Name, Hotel_Rating FROM hotel_dataset
WHERE Hotel_Rating IN (3.3, 4.4, 4.5);

-- List customers with Customer_ID in ("SG00002", "KH00003", "MY00001"). 
SELECT Customer_id FROM hotel_dataset
WHERE Customer_id IN ("SG00002", "KH00003", "MY00001");



-- USING 'WHERE' CLAUSE
-- Display all bookings where Booking_Price is greater than $300.
SELECT Booking_id, `Booking_Price(SGD)` FROM hotel_dataset
WHERE `Booking_Price(SGD)` > 300;

-- Fetch bookings where Discount is less than 10%. 
SELECT Booking_id, Discount FROM hotel_dataset
WHERE Discount < 10;

-- Retrieve records where Gender is "Male" and Hotel_Rating is greater than 4.
SELECT * FROM hotel_dataset
WHERE Gender = "Male" AND Hotel_Rating > 4;

-- Find customers aged 30 or older who booked a hotel rated greater than 4.5.
 SELECT Customer_id, Age, Hotel_Rating FROM hotel_dataset
WHERE Age >= 30 AND Hotel_Rating > 4.5;

-- Display all bookings made for hotels in "Thailand" 
SELECT Booking_id, Origin_Country FROM hotel_dataset
WHERE Origin_Country = "Thailand";



-- USING SQL OPERATOR
-- Calculate the final price after the discount for each booking (Booking_Price - (Discount / 100 * Booking_Price)). 
SELECT `Booking_Price(SGD)`, Discount, (`Booking_Price(SGD)` - (Discount / 100 * `Booking_Price(SGD)`)) AS Final_Price FROM hotel_dataset;

-- Find all bookings where Booking_Price is not equal to $300. 
SELECT Booking_id, `Booking_Price(SGD)` FROM hotel_dataset
WHERE NOT `Booking_Price(SGD)` = 300;

SELECT Booking_id, `Booking_Price(SGD)` FROM hotel_dataset
WHERE `Booking_Price(SGD)` != 300;

-- Retrieve bookings where Age is less than 21 or greater than 60
SELECT Booking_id, Age FROM hotel_dataset
WHERE Age < 21 OR Age > 60;

-- Display records where Hotel_Rating is either 5 or less than 2
SELECT * FROM hotel_dataset
WHERE Hotel_Rating = 5 OR Hotel_Rating < 2;

-- List bookings where the Booking_Price is greater than $200 and the Discount is greater than 15%.
SELECT Booking_id, `Booking_Price(SGD)`, Discount FROM hotel_dataset
WHERE `Booking_Price(SGD)` > 200 AND Discount > 15;