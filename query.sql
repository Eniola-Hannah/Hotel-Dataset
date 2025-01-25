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
-- No Invalid entries!

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
-- All cloumns are already in their correct type.


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
SELECT Origin_Country FROM hotel_dataset;

-- Find the BookingID, Customer_ID, and Hotel_Name where Discount is exactly 20%.
SELECT  Booking_id, Customer_id, Hotel_Name, Discount FROM hotel_dataset
WHERE Discount = "20%";

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
