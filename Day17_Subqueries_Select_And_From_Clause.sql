/* ---------------------------------------------------------------------------
🎯 Day 17 of the 21 Days SQL Challenge
📘 Topic: Subqueries (SELECT and FROM Clause)
🏥 Organizer: Indian Data Club | Sponsored by DPDzero
--------------------------------------------------------------------------- */

/*
🧩 Challenge Description:
Create a report showing each service with:
- Service name  
- Total patients admitted  
- The difference between their total admissions and the overall average admissions  
- A rank indicator ('Above Average', 'Average', 'Below Average')  
Order by total patients admitted in descending order.
*/

/* ---------------------------------------------------------------------------
💡 Step 1: Query Explanation
- Subqueries in SELECT → Used to calculate the average admissions dynamically for all services.  
- The inner subquery calculates the total admissions per service.  
- Another layer computes the average of those totals to use for comparison.  
- Subqueries in the FROM clause (also called *derived tables* or *inline views*)  
  act like virtual temporary tables for further computation.  
- The main query then compares each service’s total to the average and classifies performance.
--------------------------------------------------------------------------- */

/* ---------------------------------------------------------------------------
🧮 Step 2: SQL Query
--------------------------------------------------------------------------- */

SELECT 
    service, 
    total_admission,
    ROUND(total_admission - avg_admission, 2) AS diff_from_avg,
    CASE 
        WHEN total_admission > avg_admission THEN 'Above Average'
        WHEN total_admission = avg_admission THEN 'Average'
        ELSE 'Below Average'
    END AS rank_indicator
FROM (
    SELECT 
        service,
        SUM(patients_admitted) AS total_admission,
        (SELECT AVG(service_total) 
         FROM (
             SELECT SUM(patients_admitted) AS service_total
             FROM services_weekly 
             GROUP BY service
         ) avg_tbl
        ) AS avg_admission
    FROM services_weekly
    GROUP BY service
) stats
ORDER BY total_admission DESC;

/* ---------------------------------------------------------------------------
✅ Step 3: Learnings / Takeaways
🔸 Subqueries in SELECT → Allow dynamic calculations for each row, such as averages or totals.  
    ▫ Example: Fetching the overall average admissions within each service query.  

🔸 Derived Tables (FROM Subqueries) → Create temporary, query-based tables for summarization.  
    ▫ Example: “stats” acts as a virtual table combining multiple layers of aggregation.  

🔸 Inline Views → Treat subqueries as reusable logical views inside a larger query.  
    ▫ Great for breaking complex aggregations into readable steps.  

💡 Tip: Derived tables make queries modular — easier to read, test, and maintain.
--------------------------------------------------------------------------- */
