/* ---------------------------------------------------------------------------
🎯 Day 2 of the 21 Days SQL Challenge
📘 Topic: Filtering Data with WHERE Clause
🏥 Organizer: Indian Data Club | Sponsored by DPDzero
--------------------------------------------------------------------------- */

/*
🧩 Challenge Description:
Find all patients admitted to 'Surgery' service with a satisfaction score below 70, 
showing their patient_id, name, age, and satisfaction score.
*/

/* ---------------------------------------------------------------------------
💡 Step 1: Query Explanation
- Use the WHERE clause to filter data based on conditions.
- Apply AND to combine multiple logical conditions.
- The query filters patients in the 'Surgery' service whose satisfaction is less than 70.
--------------------------------------------------------------------------- */

/* ---------------------------------------------------------------------------
🧮 Step 2: SQL Query
--------------------------------------------------------------------------- */

SELECT patient_id, name, age, satisfaction 
FROM patients
WHERE service = 'Surgery' 
AND satisfaction < 70;

/* ---------------------------------------------------------------------------
✅ Step 3: Learnings / Takeaways
🔹 WHERE → Filters data based on specific conditions.  
🔹 AND → Combines multiple conditions in a single query.
--------------------------------------------------------------------------- */
