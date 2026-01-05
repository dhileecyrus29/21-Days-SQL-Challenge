/* ---------------------------------------------------------------------------
🎯 Day 10 of the 21 Days SQL Challenge
📘 Topic: CASE Statements
🏥 Organizer: Indian Data Club | Sponsored by DPDzero
--------------------------------------------------------------------------- */

/*
🧩 Challenge Description:
Create a service performance report showing:
- Service name
- Total patients admitted
- Average satisfaction score
- Performance category based on satisfaction levels:
    • 'Excellent' if avg satisfaction >= 85
    • 'Good' if avg satisfaction >= 75
    • 'Fair' if avg satisfaction >= 65
    • 'Needs Improvement' otherwise
Order results by average satisfaction in descending order.
*/

/* ---------------------------------------------------------------------------
💡 Step 1: Query Explanation
- Use SUM() to calculate the total number of patients admitted per service.  
- Apply AVG() to compute the average satisfaction score.  
- Use a CASE WHEN expression to classify each service into performance categories.  
- ROUND() ensures average satisfaction is neatly formatted.  
- ORDER BY arranges services from highest to lowest satisfaction scores.
--------------------------------------------------------------------------- */

/* ---------------------------------------------------------------------------
🧮 Step 2: SQL Query
--------------------------------------------------------------------------- */

SELECT 
    service, 
    SUM(patients_admitted) AS total_patients_admitted,
    ROUND(AVG(patient_satisfaction), 0) AS avg_patient_satisfaction,
    CASE 
        WHEN AVG(patient_satisfaction) >= 85 THEN 'Excellent'
        WHEN AVG(patient_satisfaction) >= 75 THEN 'Good'
        WHEN AVG(patient_satisfaction) >= 65 THEN 'Fair'
        ELSE 'Needs Improvement' 
    END AS performance_category
FROM services_weekly
GROUP BY service
ORDER BY avg_patient_satisfaction DESC;

/* ---------------------------------------------------------------------------
✅ Step 3: Learnings / Takeaways
🔹 CASE WHEN → Works like an IF–ELSE structure to create categorized outputs.  
🔹 Evaluates conditions in order and returns the first true result.  
🔹 ELSE → Defines a default value when no conditions match.  
🔹 Helps translate numeric or logical data into readable categories.  
--------------------------------------------------------------------------- */
