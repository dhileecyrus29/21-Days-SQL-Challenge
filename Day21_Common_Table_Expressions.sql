/* ---------------------------------------------------------------------------
🎯 Day 21 of the 21 Days SQL Challenge
📘 Topic: Common Table Expressions (CTEs)
🏥 Organizer: Indian Data Club | Sponsored by DPDzero
--------------------------------------------------------------------------- */

/*
🧩 Challenge Description:
Create a comprehensive hospital performance dashboard using CTEs to calculate:
- Service-level metrics — total admissions, refusals, and average satisfaction.  
- Staff metrics — total staff per service and average weeks present.  
- Patient demographics — average age and total patient count per service.  

Combine all three CTEs to produce a final report that includes:
- Service name and all calculated metrics.  
- Overall performance score (weighted average of admission rate and satisfaction).  

Order the final results by performance score in descending order.
*/

/* ---------------------------------------------------------------------------
💡 Step 1: Query Explanation
- Use multiple Common Table Expressions (CTEs) defined with WITH for modular, organized logic.  
- Each CTE computes a different aspect of hospital performance.  
- The final CTE joins all metrics and computes a performance score combining:
  ▫ Admission rate (60%) and average satisfaction (40%) for a balanced evaluation.  
- ORDER BY performance_score DESC identifies the best-performing services first.
--------------------------------------------------------------------------- */

/* ---------------------------------------------------------------------------
🧮 Step 2: SQL Query
--------------------------------------------------------------------------- */

WITH service_metrics AS (
    SELECT 
        service,
        SUM(patients_admitted) AS total_admissions,
        SUM(patients_refused) AS total_refusals,
        ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction
    FROM services_weekly 
    GROUP BY service
),
staff_metrics AS (
    SELECT 
        service,
        COUNT(DISTINCT staff_id) AS total_staff,
        ROUND(AVG(total_weeks_present), 2) AS avg_weeks_present
    FROM (
        SELECT 
            service,
            staff_id,
            SUM(present) AS total_weeks_present
        FROM staff_schedule 
        GROUP BY service, staff_id
    ) AS t 
    GROUP BY service
),
patient_demographics AS (
    SELECT 
        service,
        ROUND(AVG(age), 2) AS avg_age,
        COUNT(patient_id) AS total_patients
    FROM patients 
    GROUP BY service
),
final_report AS (
    SELECT 
        s.service,
        s.total_admissions,
        s.total_refusals,
        ROUND(s.total_admissions * 100.0 / (s.total_admissions + s.total_refusals), 2) AS admission_rate,
        s.avg_satisfaction,
        st.total_staff,
        st.avg_weeks_present, 
        p.avg_age,
        p.total_patients,
        ROUND(
            ((s.total_admissions * 100.0 / (s.total_admissions + s.total_refusals)) * 0.6) 
            + (s.avg_satisfaction * 0.4), 
        2) AS performance_score
    FROM service_metrics s
    LEFT JOIN staff_metrics st ON s.service = st.service
    LEFT JOIN patient_demographics p ON s.service = p.service
)
SELECT * 
FROM final_report 
ORDER BY performance_score DESC;

/* ---------------------------------------------------------------------------
✅ Step 3: Learnings / Takeaways
🔹 What are CTEs?
CTEs (created using the WITH clause) are temporary, named result sets that simplify complex SQL logic.  
They improve readability, modularity, and reusability of queries.

🔹 Why Use Them?
✅ Break down complex logic into small, testable components.  
✅ Enhance readability — each CTE represents a clear, logical step.  
✅ Reuse the same dataset multiple times in a single query.  
✅ Simplify debugging by testing each CTE individually.

🔹 CTEs vs. Subqueries:
CTEs → More readable and can be referenced multiple times.  
Subqueries → Ideal for simple, one-off computations.

🔹 Performance Tips:
💡 CTEs are not materialized by default — many databases recompute them when referenced.  
⚙️ For heavy or reused datasets, consider temporary tables for better performance.

💬 Using CTEs transforms long, tangled SQL scripts into structured, readable, and efficient data pipelines.
--------------------------------------------------------------------------- */
