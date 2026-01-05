/* ---------------------------------------------------------------------------
🎯 Day 9 of the 21 Days SQL Challenge
📘 Topic: Date Functions
🏥 Organizer: Indian Data Club | Sponsored by DPDzero
--------------------------------------------------------------------------- */

/*
🧩 Challenge Description:
Calculate the average length of stay (in days) for each service. 
Show only services where the average stay exceeds 7 days. 
Also, display the count of patients and order by average stay in descending order.
*/

/* ---------------------------------------------------------------------------
💡 Step 1: Query Explanation
- DATEDIFF() calculates the number of days between arrival_date and departure_date.  
- AVG() computes the average stay duration per service.  
- ROUND() formats the average stay to two decimal places for readability.  
- COUNT() returns the number of patients for each service.  
- HAVING filters only those services where the average stay exceeds 7 days.  
- ORDER BY arranges the results in descending order of average stay.
--------------------------------------------------------------------------- */

/* ---------------------------------------------------------------------------
🧮 Step 2: SQL Query
--------------------------------------------------------------------------- */

SELECT 
    service,
    ROUND(AVG(DATEDIFF(departure_date, arrival_date)), 2) AS avg_length_of_stay,
    COUNT(*) AS no_of_patients
FROM patients
GROUP BY service
HAVING avg_length_of_stay > 7
ORDER BY avg_length_of_stay DESC;

/* ---------------------------------------------------------------------------
✅ Step 3: Learnings / Takeaways
🔹 YEAR(), MONTH(), DAY() → Extract specific parts of a date.  
🔹 DATEDIFF() → Calculates the difference (in days) between two dates.  
🔹 DATE_ADD() / DATE_SUB() → Add or subtract a time interval from a date.  
🔹 CAST(expr AS DATE) → Converts an expression to a date type.  
🔹 CURDATE() / CURRENT_DATE() → Returns the current system date.
--------------------------------------------------------------------------- */
