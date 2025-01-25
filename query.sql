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