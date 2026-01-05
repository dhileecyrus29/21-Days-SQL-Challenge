/* ---------------------------------------------------------------------------
🎯 Day 6 of the 21 Days SQL Challenge
📘 Topic: GROUP BY Clause
🏥 Organizer: Indian Data Club | Sponsored by DPDzero
--------------------------------------------------------------------------- */

/*
🧩 Challenge Description:
For each hospital service, calculate the total number of patients admitted, 
total patients refused, and the admission rate (percentage of requests that were admitted). 
Order the results by admission rate in descending order.
*/

/* ---------------------------------------------------------------------------
💡 Step 1: Query Explanation
- Use GROUP BY to summarize data for each hospital service.
- Apply SUM() to calculate total admitted and refused patients.
- Compute admission rate as (Total Admitted / Total Requested) × 100.
- ROUND() is used to simplify the admission rate values.
- ORDER BY admission_rate DESC ranks services by highest performance.
--------------------------------------------------------------------------- */

/* ---------------------------------------------------------------------------
🧮 Step 2: SQL Query
--------------------------------------------------------------------------- */

SELECT 
    service,
    SUM(patients_admitted) AS admitted_patients, 
    SUM(patients_refused) AS refused_patients, 
    ROUND((SUM(patients_admitted) / SUM(patients_request) * 100), 0) AS admission_rate 
FROM services_weekly 
GROUP BY service
ORDER BY admission_rate DESC;

/* ---------------------------------------------------------------------------
✅ Step 3: Learnings / Takeaways
𝗔𝗱𝗺𝗶𝘀𝘀𝗶𝗼𝗻 𝗿𝗮𝘁𝗲 % = (𝗧𝗼𝘁𝗮𝗹 𝗮𝗱𝗺𝗶𝘁𝘁𝗲𝗱 / 𝗧𝗼𝘁𝗮𝗹 𝗿𝗲𝗾𝘂𝗲𝘀𝘁𝗲𝗱) × 𝟭𝟬𝟬  

🔹 GROUP BY ➝ Groups rows with the same value in a column into summarized rows.  
🔹 Lets you analyze aggregated data — e.g., total patients per service.  
🔹 All non-aggregated columns in SELECT must appear in GROUP BY.  
🔹 Ideal for summarizing data and identifying trends across categories.
--------------------------------------------------------------------------- */
