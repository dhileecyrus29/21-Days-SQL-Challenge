/* ---------------------------------------------------------------------------
🎯 Day 5 of the 21 Days SQL Challenge
📘 Topic: Aggregate Functions (COUNT, SUM, AVG, MIN, MAX)
🏥 Organizer: Indian Data Club | Sponsored by DPDzero
--------------------------------------------------------------------------- */

/*
🧩 Challenge Description:
Calculate the total number of patients admitted, total patients refused, 
and the average patient satisfaction across all services and weeks. 
Round the average satisfaction to 2 decimal places.
*/

/* ---------------------------------------------------------------------------
💡 Step 1: Query Explanation
- Use SUM() to calculate total admitted and refused patients.
- Use AVG() to find the average satisfaction across all records.
- Apply ROUND() to format the average satisfaction to 2 decimal places.
- Aggregate functions help summarize and analyze large datasets efficiently.
--------------------------------------------------------------------------- */

/* ---------------------------------------------------------------------------
🧮 Step 2: SQL Query
--------------------------------------------------------------------------- */

SELECT 
    SUM(patients_admitted) AS no_of_patients_admitted, 
    SUM(patients_refused) AS no_of_patients_refused, 
    ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction_score 
FROM services_weekly;

/* ---------------------------------------------------------------------------
✅ Step 3: Learnings / Takeaways
🔹 COUNT(*) ➝ Counts all rows in a table (including NULLs).  
🔹 COUNT(column_name) ➝ Counts only rows with non-NULL values.  
🔹 SUM(column_name) ➝ Adds up all numbers in a column to get the total.  
🔹 AVG(column_name) ➝ Finds the mean of numeric values.  
🔹 MIN(column_name) ➝ Returns the smallest value in a column.  
🔹 MAX(column_name) ➝ Returns the largest value in a column.  
🔹 ROUND(number, decimals) ➝ Rounds numbers to specified decimal places.
--------------------------------------------------------------------------- */
