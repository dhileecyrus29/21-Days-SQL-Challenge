/* ---------------------------------------------------------------------------
🎯 Day 14 of the 21 Days SQL Challenge
📘 Topic: LEFT JOIN and RIGHT JOIN
🏥 Organizer: Indian Data Club | Sponsored by DPDzero
--------------------------------------------------------------------------- */

/*
🧩 Challenge Description:
Create a staff utilization report showing:
- staff_id, staff_name, role, and service
- count of weeks each staff member was present (from staff_schedule)
Include all staff members, even if they have no schedule records.  
Order by weeks present in descending order.
*/

/* ---------------------------------------------------------------------------
💡 Step 1: Query Explanation
- Use LEFT JOIN to include all staff, even those without schedule data.  
- SUM(ss.present) counts the number of weeks each staff member was present.  
- COALESCE() replaces NULL values with 0 for staff without schedule records.  
- GROUP BY ensures aggregation per staff member.  
- ORDER BY sorts staff by weeks_present in descending order to highlight the most active ones.
--------------------------------------------------------------------------- */

/* ---------------------------------------------------------------------------
🧮 Step 2: SQL Query
--------------------------------------------------------------------------- */

SELECT
    s.staff_id, 
    s.staff_name, 
    s.role, 
    s.service,
    COALESCE(SUM(ss.present), 0) AS weeks_present
FROM staff s 
LEFT JOIN staff_schedule ss 
    ON s.staff_id = ss.staff_id
GROUP BY 
    s.staff_id, 
    s.staff_name, 
    s.role, 
    s.service
ORDER BY weeks_present DESC;

/* ---------------------------------------------------------------------------
✅ Step 3: Learnings / Takeaways
🔹 LEFT JOIN → Returns all rows from the left table and matching rows from the right; unmatched rows return NULL.  
🔹 RIGHT JOIN → Returns all rows from the right table and matching rows from the left; unmatched rows return NULL.  
🔹 COALESCE(expr, default) → Replaces NULL with a default value (e.g., 0).  
🔹 Useful for ensuring completeness when joins leave missing values.  
🔹 LEFT JOIN is commonly used for inclusive reports like utilization or coverage analysis.
--------------------------------------------------------------------------- */
