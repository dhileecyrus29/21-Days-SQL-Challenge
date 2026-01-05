/* ---------------------------------------------------------------------------
🎯 Day 4 of the 21 Days SQL Challenge
📘 Topic: LIMIT and OFFSET
🏥 Organizer: Indian Data Club | Sponsored by DPDzero
--------------------------------------------------------------------------- */

/*
🧩 Challenge Description:
Find the 3rd to 7th highest patient satisfaction scores from the patients table, 
showing patient_id, name, service, and satisfaction. Display only these 5 records.
*/

/* ---------------------------------------------------------------------------
💡 Step 1: Query Explanation
- Use ORDER BY to sort satisfaction scores in descending order.
- Apply LIMIT to control the number of rows returned.
- Use OFFSET to skip the first 2 rows (to start from the 3rd record).
- Apply AS to rename the column for clarity in the result set.
--------------------------------------------------------------------------- */

/* ---------------------------------------------------------------------------
🧮 Step 2: SQL Query
--------------------------------------------------------------------------- */

SELECT patient_id, 
       name, 
       service, 
       satisfaction AS satisfaction_scores 
FROM patients 
ORDER BY satisfaction DESC 
LIMIT 5 OFFSET 2;

/* ---------------------------------------------------------------------------
✅ Step 3: Learnings / Takeaways
🔹 LIMIT ➝ Specifies the number of rows to return.  
🔹 OFFSET ➝ Skips a specified number of rows before starting to return rows.  
🔹 AS ➝ Used to assign an alias to a column or table, making the result set more readable.
--------------------------------------------------------------------------- */
