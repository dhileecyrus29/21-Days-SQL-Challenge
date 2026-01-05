/* ---------------------------------------------------------------------------
🎯 Day 12 of the 21 Days SQL Challenge
📘 Topic: NULL Values and IS NULL / IS NOT NULL
🏥 Organizer: Indian Data Club | Sponsored by DPDzero
--------------------------------------------------------------------------- */

/*
🧩 Challenge Description:
Analyze the event impact by comparing weeks with events vs weeks without events.  
Show:
- Event status ('With Event' or 'No Event')
- Count of weeks
- Average patient satisfaction
- Average staff morale  
Order by average patient satisfaction in descending order.
*/

/* ---------------------------------------------------------------------------
💡 Step 1: Query Explanation
- Use CASE WHEN to classify weeks as 'With Event' or 'No Event' based on the event column.  
- COUNT(*) gives the number of weeks in each category.  
- AVG() computes average satisfaction and morale for each event status.  
- GROUP BY aggregates the results by event_status.  
- ORDER BY sorts results by average patient satisfaction in descending order.
--------------------------------------------------------------------------- */

/* ---------------------------------------------------------------------------
🧮 Step 2: SQL Query
--------------------------------------------------------------------------- */

SELECT 
    CASE 
        WHEN event = 'none' THEN 'No Event' 
        ELSE 'With Event' 
    END AS event_status,
    COUNT(*) AS week_count, 
    AVG(patient_satisfaction) AS avg_patient_satisfaction, 
    AVG(staff_morale) AS avg_staff_morale
FROM services_weekly
GROUP BY event_status
ORDER BY avg_patient_satisfaction DESC;

/* ---------------------------------------------------------------------------
✅ Step 3: Learnings / Takeaways
🔹 NULL → Represents missing or unknown data; not the same as zero or an empty string.  
🔹 Arithmetic with NULL returns NULL (e.g., 10 + NULL = NULL).  
🔹 COALESCE() replaces NULL with a default value to ensure calculations work.  
    ➜ Example: 10 + COALESCE(NULL, 0) = 10  
🔹 COUNT(*) includes NULLs, while COUNT(column) ignores NULLs.  
🔹 Empty string ('') ≠ NULL — handle them separately when filtering.  
🔹 Always use IS NULL / IS NOT NULL — never use = NULL or != NULL.
--------------------------------------------------------------------------- */
