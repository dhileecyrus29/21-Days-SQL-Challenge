/* ---------------------------------------------------------------------------
🎯 Day 19 of the 21 Days SQL Challenge
📘 Topic: Window Functions — ROW_NUMBER, RANK, DENSE_RANK
🏥 Organizer: Indian Data Club | Sponsored by DPDzero
--------------------------------------------------------------------------- */

/*
🧩 Challenge Description:
For each service, rank the weeks by patient satisfaction score (highest first).  
Show: service, week, patient_satisfaction, patients_admitted, and rank.  
Include only the top 3 weeks per service.
*/

/* ---------------------------------------------------------------------------
💡 Step 1: Query Explanation
- RANK() assigns ranks to rows within a partition based on satisfaction score.  
- The PARTITION BY clause ensures ranking is done separately for each service.  
- ORDER BY patient_satisfaction DESC ranks weeks from highest to lowest.  
- A subquery is required because aliases (like rnk) from window functions cannot be used directly in WHERE.  
- The outer query filters to show only the top 3 weeks per service (rnk <= 3).
--------------------------------------------------------------------------- */

/* ---------------------------------------------------------------------------
🧮 Step 2: SQL Query
--------------------------------------------------------------------------- */

SELECT * 
FROM (
    SELECT 
        service, 
        week, 
        patient_satisfaction, 
        patients_admitted,
        RANK() OVER (PARTITION BY service ORDER BY patient_satisfaction DESC) AS rnk
    FROM services_weekly
) ranked
WHERE rnk <= 3;

/* ---------------------------------------------------------------------------
✅ Step 3: Learnings / Takeaways
🏅 Ranking Functions Explained:
   ▫ ROW_NUMBER() → Assigns a unique sequential number (1, 2, 3, 4…).  
   ▫ RANK() → Assigns the same rank for ties but skips numbers (1, 2, 2, 4…).  
   ▫ DENSE_RANK() → Assigns the same rank for ties without skipping (1, 2, 2, 3…).  

⚙️ When to Use Each:
   ✅ ROW_NUMBER() → When you need unique ordering for each row.  
   🥈 RANK() → When ties should create gaps in ranking.  
   🥉 DENSE_RANK() → When ties should not skip numbers.  

💡 Window functions like RANK() don’t reduce rows — they preserve all input rows, unlike GROUP BY.

🧠 Why We Used a Subquery:
   ▫ The alias “rnk” created by the window function isn’t available in WHERE.  
   ▫ SQL’s logical order executes WHERE before window functions.  
   ▫ Therefore, we first compute ranks inside a subquery (or CTE) and then filter using WHERE rnk <= 3.  

💬 Ranking is powerful for identifying top performers, trends, and competitive insights in data.
--------------------------------------------------------------------------- */
