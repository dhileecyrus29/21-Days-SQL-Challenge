/* ---------------------------------------------------------------------------
🎯 Day 1 of the 21 Days SQL Challenge
📘 Topic: Introduction to SQL & SELECT Statement
🏥 Organizer: Indian Data Club | Sponsored by DPDzero
--------------------------------------------------------------------------- */

/*
🧩 Challenge Description:
List all unique hospital services available in the hospital.
*/

/* ---------------------------------------------------------------------------
💡 Step 1: Query Explanation
- Use the SELECT statement to retrieve data from a table.
- Apply DISTINCT to return only unique service names.
- The FROM clause specifies the table source.
--------------------------------------------------------------------------- */

/* ---------------------------------------------------------------------------
🧮 Step 2: SQL Query
--------------------------------------------------------------------------- */

SELECT DISTINCT service
FROM patients;

/* ---------------------------------------------------------------------------
✅ Step 3: Learnings / Takeaways
- SELECT → Pulls data from a table.
- FROM → Defines the data source.
- LIMIT → Restricts the number of rows returned.
- DISTINCT → Returns only unique values (no duplicates).
--------------------------------------------------------------------------- */
