/* ---------------------------------------------------------------------------
🎯 Day 16 of the 21 Days SQL Challenge
📘 Topic: Subqueries (WHERE Clause)
🏥 Organizer: Indian Data Club | Sponsored by DPDzero
--------------------------------------------------------------------------- */

/*
🧩 Challenge Description:
Find all patients who were admitted to services that:
- Had at least one week where patients were refused.  
- Had an average satisfaction score lower than the overall hospital average.  

Display: patient_id, name, service, and their personal satisfaction score.
*/

/* ---------------------------------------------------------------------------
💡 Step 1: Query Explanation
- Subqueries are smaller queries embedded inside a main query to refine or aggregate data.  
- The inner query identifies services that had refusals and low average satisfaction.  
- A nested subquery compares each service’s satisfaction against the hospital-wide average.  
- The outer query filters patients whose services meet those criteria.  
- This pattern isolates logic — making the main query concise and readable.
--------------------------------------------------------------------------- */

/* ---------------------------------------------------------------------------
🧮 Step 2: SQL Query
--------------------------------------------------------------------------- */

SELECT 
    P.patient_id, 
    P.name, 
    P.service, 
    P.satisfaction 
FROM patients P 
WHERE P.service IN (
    SELECT 
        S.service
    FROM services_weekly S
    WHERE S.patients_refused > 0
    GROUP BY S.service
    HAVING AVG(S.patient_satisfaction) <
        (SELECT AVG(patient_satisfaction) FROM services_weekly)
);

/* ---------------------------------------------------------------------------
✅ Step 3: Learnings / Takeaways
🔸 Subqueries → Smaller queries used inside a main query for filtering or aggregation.  
    ▫ Example: Identify low-performing services before pulling their patient details.  

🔸 Nested Queries → When one subquery is inside another — useful for comparisons like averages.  

🔸 Filtering with Subqueries → Use results from a subquery in WHERE or HAVING to limit data.  
    ▫ Example: Selecting patients from services meeting multiple conditions.  

💡 Tip: Start testing inner queries first — it helps verify your logic step by step.
--------------------------------------------------------------------------- */
