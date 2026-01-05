/* ---------------------------------------------------------------------------
🎯 Day 7 of the 21 Days SQL Challenge
📘 Topic: HAVING Clause
🏥 Organizer: Indian Data Club | Sponsored by DPDzero
--------------------------------------------------------------------------- */

/*
🧩 Challenge Description:
Identify services that refused more than 100 patients in total 
and had an average patient satisfaction below 80. 
Display service name, total refused, and average satisfaction.
*/

/* ---------------------------------------------------------------------------
💡 Step 1: Query Explanation
- Use GROUP BY to aggregate data by service.
- Apply SUM() to calculate the total number of patients refused per service.
- Use AVG() to find the average satisfaction score for each service.
- HAVING filters results **after aggregation** (unlike WHERE which filters rows).
- Combine multiple conditions using AND to find services with high refusals and low satisfaction.
--------------------------------------------------------------------------- */

/* ---------------------------------------------------------------------------
🧮 Step 2: SQL Query
--------------------------------------------------------------------------- */

SELECT 
    service, 
    SUM(patients_refused) AS total_patient_refused,
    ROUND(AVG(patient_satisfaction), 0) AS avg_patient_satisfaction
FROM services_weekly
GROUP BY service
HAVING total_patient_refused > 100 
   AND avg_patient_satisfaction < 80;

/* ---------------------------------------------------------------------------
✅ Step 3: Learnings / Takeaways
🔹 HAVING → Filters data **after aggregation** has occurred.  
🔹 Use it with aggregate functions like SUM(), AVG(), COUNT(), etc.  
🔹 WHERE filters rows before grouping; HAVING filters groups after grouping.  
🔹 Helpful for identifying trends and making group-level insights.  

💡 In short: **WHERE filters rows, HAVING filters groups.**
--------------------------------------------------------------------------- */
