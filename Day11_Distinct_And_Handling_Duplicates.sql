	/* ---------------------------------------------------------------------------
🎯 Day 11 of the 21 Days SQL Challenge
📘 Topic: DISTINCT and Handling Duplicates
🏥 Organizer: Indian Data Club | Sponsored by DPDzero
--------------------------------------------------------------------------- */

/*
🧩 Challenge Description:
Find all unique combinations of service and event type from the services_weekly table 
where events are not null or 'none'. 
Display the count of occurrences for each combination, ordered by count descending.
*/

/* ---------------------------------------------------------------------------
💡 Step 1: Query Explanation
- Use WHERE to filter out null or 'none' events.  
- GROUP BY service and event to aggregate unique combinations.  
- Apply COUNT() to find how many times each combination occurs.  
- ORDER BY count_of_occurrences DESC to list the most frequent ones first.  
- DISTINCT could also be used, but GROUP BY already ensures uniqueness.
--------------------------------------------------------------------------- */

/* ---------------------------------------------------------------------------
🧮 Step 2: SQL Query
--------------------------------------------------------------------------- */

SELECT 
    service, 
    event, 
    COUNT(*) AS count_of_occurences 
FROM services_weekly
WHERE event IS NOT NULL 
  AND event != 'none'
GROUP BY service, event
ORDER BY count_of_occurences DESC;

/* ---------------------------------------------------------------------------
✅ Step 3: Learnings / Takeaways
🔹 DISTINCT and GROUP BY both remove duplicates from result sets.  
🔹 When using GROUP BY, DISTINCT is not necessary.  
🔹 DISTINCT operates on the entire selected row — not on individual columns.  
🔹 GROUP BY is more flexible since it allows the use of aggregate functions like COUNT().
--------------------------------------------------------------------------- */
