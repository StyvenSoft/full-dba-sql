/*
  Start by selecting a question by pressing 'Start' or 'View All Questions'.
  Use the resources and information about the database from the left panel to help.
  Press the run button to execute the query.
  Question is automatically validated every time you execute the query.
  Make your output match the expected output.
 
  If you can't solve a question you can press 'Skip Question' to view the solution.
 
  Keybinds:
    [ctrl + enter]: Execute the SQL
    [ctrl + q]: Auto-format the SQL

    https://www.sql-practice.com/
*/


-- 1. Show first name, last name, and gender of patients who's gender is 'M' 

SELECT first_name, 
       last_name, 
       gender 
FROM patients 
WHERE gender == "M";

-- 2. Show first name and last name of patients who does not have allergies (null).

SELECT 
    first_name, 
    last_name 
FROM patients 
WHERE allergies IS null;

-- 3. Show first name of patients that start with the letter 'C'

SELECT 
    first_name 
FROM 
    patients 
WHERE 
    first_name like 'C%';

SELECT
  first_name
FROM
  patients
WHERE
  first_name LIKE 'C%'

-- Show first name and last name of patients that weight within the 
-- range of 100 to 120 (inclusive)

SELECT
  first_name,
  last_name
FROM patients
WHERE weight BETWEEN 100 AND 120;

-- Update the patients table for the allergies column. 
-- If the patient's allergies is null then replace it with 'NKA'

UPDATE patients
    SET allergies = 'NKA'
WHERE allergies IS NULL;

-- Show first name and last name concatinated into one column to show their full name.

SELECT
  CONCAT(first_name, ' ', last_name) AS full_name
FROM patients;

-- Show first name, last name, and the full province name of each patient.
-- Example: 'Ontario' instead of 'ON'

SELECT first_name, last_name, province_name
FROM patients
JOIN provinces
ON patients.province_id = provinces.province_id;

-- Show how many patients have a birth_date with 2010 as the birth year.

SELECT COUNT(birth_date) AS total_patients 
FROM patients 
WHERE YEAR(birth_date) = 2010;


