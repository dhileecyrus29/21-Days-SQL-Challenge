/* ---------------------------------------------------------------------------
🎯 Day 20 of the 21 Days SQL Challenge
📘 Topic: Window Functions — Aggregate Window Functions
🏥 Organizer: Indian Data Club | Sponsored by DPDzero
--------------------------------------------------------------------------- */

/*
🧩 Challenge Description:
Create a trend analysis showing, for each service and week:
- Week number  
- Patients admitted  
- Running total of patients admitted (cumulative)  
- 3-week moving average of patient satisfaction (current week + 2 prior weeks)  
- Difference between current week admissions and service average  
Filter only for weeks 10–20.
*/

/* ---------------------------------------------------------------------------
💡 Step 1: Query Explanation
- SUM() OVER(...) → Calculates cumulative totals by adding all prior weeks up to the current week.  
- AVG() OVER(...) → Computes a 3-week moving average of satisfaction for smoother trend analysis.  
- PARTITION BY service ensures calculations reset for each service.  
- ROWS BETWEEN defines the window frame: how many rows before or after to include.  
- Subtracting AVG(patients_admitted) OVER(PARTITION BY service) gives the difference from the service average.  
- The WHERE clause limits results to weeks 10 through 20.
--------------------------------------------------------------------------- */

/* ---------------------------------------------------------------------------
🧮 Step 2: SQL Query
--------------------------------------------------------------------------- */

SELECT 
    service, 
    week, 
    patients_admitted,
    SUM(patients_admitted) OVER (
        ORDER BY week 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_admissions,
    ROUND(AVG(patient_satisfaction) OVER (
        PARTITION BY service 
        ORDER BY week 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), 2) AS moving_avg_satisfaction_3_weeks,
    patients_admitted - AVG(patients_admitted) OVER (
        PARTITION BY service
    ) AS diff_from_avg
FROM services_weekly
WHERE week BETWEEN 10 AND 20
ORDER BY service, week;

/* ---------------------------------------------------------------------------
✅ Step 3: Learnings / Takeaways
🔹 Common Window Aggregates:
   🧮 SUM() OVER(...) → Running total — adds up values over time.  
   📊 AVG() OVER(...) → Moving average — smooths short-term fluctuations.  
   🔢 COUNT() OVER(...) → Running count of records.  
   📉 MIN() / MAX() OVER(...) → Track range across a moving window.  

🔹 Window Frame Clauses — control which rows are included in each calculation:
   ▫ ROWS BETWEEN start AND end defines the window range.  
   ▫ UNBOUNDED PRECEDING → Starts from the very first row.  
   ▫ 2 PRECEDING → Includes two rows before the current one.  
   ▫ CURRENT ROW → Refers only to the current row.  
   ▫ UNBOUNDED FOLLOWING → Extends to the final row.  

💡 Window functions bring time-based analytics, trend tracking, and performance comparisons — all in pure SQL!
--------------------------------------------------------------------------- */
