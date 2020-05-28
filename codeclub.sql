-- Select working schema
use dmhr_work_schema_3;

-- Show the tables in the database. How many are there?
SHOW TABLES;

-- How many tables have “lookup” in their name?
SHOW TABLES LIKE '%lookup%';

-- Examine tables “patient” and “admission”, do they all have columns in common?
DESCRIBE patient;
DESCRIBE admission;

-- Output the first 20 rows of each table. 
SELECT * FROM patient LIMIT 20;
SELECT * FROM admission LIMIT 20;

-- Count how many records there are in the patient table.
SELECT count(*) FROM patient;

-- How many consultation do we have?
SELECT count(*) FROM admission;

-- To look up specialization, we need the dictionary table “lookup_specialization”. How many specializations contain ‘logy’ in their name?
SELECT * FROM lookup_specialization WHERE name like '%logy%';

-- Count how many unique departments got a *logy specialization.
SELECT count(distinct department_id) FROM department WHERE specialization_id IN (2,3);

-- How many unique departments got a *logy specialization in hospital Sem Institute
SELECT * FROM hospital;
SELECT count(distinct department_id) FROM department WHERE specialization_id IN (2,3) AND hospital_id = 3;

-- How many unique departments got a *logy specialization in hospital every hospital
SELECT hospital_id, count(distinct department_id) FROM department WHERE specialization_id IN (2,3) GROUP BY hospital_id;

-- Create a table called ‘gp_referral_(your initials)’ and populate it with the data below.

-- prac	patid	event_date	specialist
-- prac1	000d	1975-2-15	dermatologist
-- prac1	000d	1975-3-14	dermatologist
-- prac1	000e	2004-5-8	neurologist
-- prac1	000e	1997-12-19	urologist
-- prac1	000e	1992-8-2	NULL

CREATE TABLE gp_referral_VP(
prac CHAR(5),
patid CHAR(5),
event_date DATE,
specialist VARCHAR(30)
);

DESCRIBE gp_referral_VP;

INSERT INTO gp_referral_VP (prac, patid, event_date, specialist)
VALUES ('prac1', '000d', '1975-2-15', 'dermatologist'),
  ('prac1', '000d', '1975-3-14', 'dermatologist'),
  ('prac1', '000e', '2004-5-8',  'neurologist'),
  ('prac1', '000e', '1997-12-19', 'urologist'),
  ('prac1', '000e', '1992-8-2', NULL)
  ;

-- Does this table have a primary key? 
-- No. We don’t need a primary key, none of the variables is unique, as a patient may have multiple rows.
-- Check that all data have been inserted correctly.
SELECT * FROM gp_referral_VP;
DROP TABLE gp_referral_VP;

-- Create a frequency breakdown of the values for the patient ethnicity in ascending order.
SELECT ethnicity_id, count(*) FROM patient 
GROUP BY ethnicity_id 
ORDER BY count(*) ASC;

-- Select average year of birth of all patients.
SELECT AVG(YEAR(dob))
FROM patient
WHERE dob IS NOT NULL;

-- Update some year and calculate the average again;
UPDATE patient SET dob = '1900-01-01' WHERE patient_id = 12;
SELECT * FROM patient;

-- Select average year of birth of all patients born after 1980 for each gender.
SELECT gender_id, AVG(YEAR(dob)) as yob
FROM patient
WHERE dob IS NOT NULL
AND YEAR(dob) > 1980
GROUP BY gender_id
ORDER BY AVG(YEAR(dob)) DESC;

SELECT * FROM (
	SELECT gender_id, CAST(AVG(YEAR(dob)) AS decimal(6,2)) as yob
	FROM patient
	WHERE dob IS NOT NULL
	AND YEAR(dob) > 1980
	GROUP BY gender_id
) inner_tbl
ORDER BY yob;

-- Delete all staff members whose name starts with 'X'.
SELECT * FROM staff WHERE name LIKE 'X%';
DELETE FROM staff WHERE name LIKE 'X%';