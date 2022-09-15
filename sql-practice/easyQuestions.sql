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

-- Show the first_name, last_name, and height of the patient with the greatest height.

SELECT first_name, last_name, MAX(height) AS height 
FROM patients;

/*
Show unique first names from the patients table which only occurs once in the list.

For example, if two or more people are named 'John' in the first_name column then 
don't include their name in the output list. If only 1 person is named 'Leo' 
then include them in the output.
*/

SELECT first_name FROM patients
group by first_name
having count(first_name)=1;


-- Show all columns for patients who have one of the following patient_ids:
-- 1,45,534,879,1000

SELECT * FROM patients 
WHERE patient_id 
IN (1,45,534,879,1000);

-- Show the total number of admissions

SELECT patient_id, first_name FROM patients
where LEN(first_name) >= 6
and first_name like 'S%'
AND first_name like '%s';

SELECT p.patient_id, p.first_name, p.last_name FROM patients p
JOIN admissions a
ON p.patient_id = a.patient_id
where a.primary_diagnosis = 'Dementia';

SELECT first_name from patients
order by len(first_name), first_name asc;