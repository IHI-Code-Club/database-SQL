-- Select working schema

-- Show the tables in the database. How many are there?

-- How many tables have “lookup” in their name?

-- Examine tables “patient” and “admission”, do they all have columns in common?

-- Output the first 20 rows of each table. 

-- Count how many records there are in the patient table.

-- How many consultation do we have?

-- To look up specialization, we need the dictionary table “lookup_specialization”. How many specializations contain ‘logy’ in their name?

-- Count how many unique departments got a *logy specialization.

-- How many unique departments got a *logy specialization in hospital Sem Institute

-- How many unique departments got a *logy specialization in hospital every hospital

-- Create a table called ‘gp_referral_(your initials)’ and populate it with the data below.
-- prac	patid	event_date	specialist
-- prac1	000d	1975-2-15	dermatologist
-- prac1	000d	1975-3-14	dermatologist
-- prac1	000e	2004-5-8	neurologist
-- prac1	000e	1997-12-19	urologist
-- prac1	000e	1992-8-2	NULL


-- Does this table have a primary key? 
-- No. We don’t need a primary key, none of the variables is unique, as a patient may have multiple rows.
-- Check that all data have been inserted correctly.

-- Create a frequency breakdown of the values for the patient ethnicity in ascending order.

-- Select average year of birth of all patients.

-- Update some year and calculate the average again;

-- Select average year of birth of all patients born after 1980 for each gender.

-- Delete all staff members whose name starts with 'X'.
