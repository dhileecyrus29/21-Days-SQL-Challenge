/* ---------------------------------------------------------------------------
🎯 Day 3 of the 21 Days SQL Challenge
📘 Topic: Sorting Data with ORDER BY
🏥 Organizer: Indian Data Club | Sponsored by DPDzero
--------------------------------------------------------------------------- */

/*
🧩 Challenge Description:
Retrieve the top 5 weeks with the highest patient refusals across all services, 
showing week, service, patients_refused, and patients_request. 
Sort by patients_refused in descending order.
*/

/* ---------------------------------------------------------------------------
💡 Step 1: Query Explanation
- Use ORDER BY to sort the result set.
- By default, ORDER BY sorts in ascending order (A–Z or 0–9).
- Apply DESC to sort in descending order (Z–A or 9–0).
- Use LIMIT to restrict the result to the top 5 rows.
--------------------------------------------------------------------------- */

/* ---------------------------------------------------------------------------
🧮 Step 2: SQL Query
--------------------------------------------------------------------------- */

SELECT week, service, patients_refused, patients_request
FROM services_weekly
ORDER BY patients_refused DESC
LIMIT 5;

/* ---------------------------------------------------------------------------
✅ Step 3: Learnings / Takeaways
🔹 ORDER BY → Sorts the result set in ascending order by default (A–Z, 0–9).  
🔹 DESC → Used with ORDER BY to sort results in descending order (Z–A, 9–0).
--------------------------------------------------------------------------- */
