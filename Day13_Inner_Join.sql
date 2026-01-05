/* ---------------------------------------------------------------------------
🎯 Day 13 of the 21 Days SQL Challenge
📘 Topic: INNER JOIN
🏥 Organizer: Indian Data Club | Sponsored by DPDzero
--------------------------------------------------------------------------- */

/*
🧩 Challenge Description:
Create a comprehensive report showing:
- patient_id, patient name, age, and service
- total number of staff members available in their service  
Include only patients from services that have more than 5 staff members.  
Order by number of staff descending, then by patient name.
*/

/* ---------------------------------------------------------------------------
💡 Step 1: Query Explanation
- INNER JOIN connects the patients and staff tables using their common column (service).  
- COUNT(staff_id) calculates how many staff members belong to each service.  
- GROUP BY ensures aggregation is done for each unique patient-service combination.  
- HAVING filters out services with 5 or fewer staff members.  
- ORDER BY sorts results by total staff (descending), then alphabetically by patient name.  
- Aliases (p, s) make the query more concise and readable.
--------------------------------------------------------------------------- */

/* ---------------------------------------------------------------------------
🧮 Step 2: SQL Query
--------------------------------------------------------------------------- */

SELECT 
    p.patient_id, 
    p.name, 
    p.age, 
    p.service,
    COUNT(staff_id) AS total_staff
FROM patients p 
JOIN staff s 
    ON p.service = s.service
GROUP BY 
    p.patient_id, 
    p.name, 
    p.age, 
    p.service
HAVING total_staff > 5
ORDER BY total_staff DESC, p.name;

/* ---------------------------------------------------------------------------
✅ Step 3: Learnings / Takeaways
✏️ INNER JOIN → Returns only rows that match in both tables.  
✏️ JOIN = INNER JOIN (INNER is the default type).  
✏️ It compares values in related columns and keeps only matching rows.  
✏️ Aliases (like p, s) simplify code readability and referencing.  
✏️ Multiple tables can be joined in the same query using this logic.
--------------------------------------------------------------------------- */
