/* ---------------------------------------------------------------------------
🎯 Day 15 of the 21 Days SQL Challenge
📘 Topic: Multiple Joins
🏥 Organizer: Indian Data Club | Sponsored by DPDzero
--------------------------------------------------------------------------- */

/*
🧩 Challenge Description:
Create a comprehensive service analysis report for week 20 showing:
- Service name  
- Total patients admitted that week  
- Total patients refused  
- Average patient satisfaction  
- Count of staff assigned to the service  
- Count of staff present that week  
Order results by patients admitted in descending order.
*/

/* ---------------------------------------------------------------------------
💡 Step 1: Query Explanation
- Combine multiple tables to build a detailed dataset using different join types.  
- LEFT JOIN keeps all service records even if no staff is assigned.  
- INNER JOIN ensures only matching records from staff_schedule for week 20.  
- COALESCE() replaces NULL values with 0 for missing presence data.  
- GROUP BY summarizes metrics by service and week.  
- ORDER BY ranks services based on the number of patients admitted.
--------------------------------------------------------------------------- */

/* ---------------------------------------------------------------------------
🧮 Step 2: SQL Query
--------------------------------------------------------------------------- */

SELECT 
    sw.week, 
    sw.service, 
    SUM(sw.patients_admitted) AS total_patients_admitted, 
    SUM(sw.patients_refused) AS total_patients_refused,
    ROUND(AVG(sw.patient_satisfaction), 1) AS avg_satisfaction, 
    COUNT(s.staff_id) AS staff_assigned, 
    SUM(COALESCE(ss.present, 0)) AS staff_present 
FROM hospital.services_weekly sw 
LEFT JOIN staff s 
    ON sw.service = s.service 
JOIN staff_schedule ss 
    ON s.staff_id = ss.staff_id 
    AND sw.week = ss.week
WHERE sw.week = 20
GROUP BY sw.week, sw.service
ORDER BY total_patients_admitted DESC;

/* ---------------------------------------------------------------------------
✅ Step 3: Learnings / Takeaways
✨ Joins build datasets step by step — each table adds new context.  
✨ Use LEFT JOIN to retain all base rows, and INNER JOIN for strict matches.  
✨ Join order matters — it can significantly affect the output.  
✨ Grouping or DISTINCT avoids duplication from one-to-many joins.  
✨ Debug progressively by validating one join at a time to ensure accuracy.
--------------------------------------------------------------------------- */
