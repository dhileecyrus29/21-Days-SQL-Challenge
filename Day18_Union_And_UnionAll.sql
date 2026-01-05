/* ---------------------------------------------------------------------------
🎯 Day 18 of the 21 Days SQL Challenge
📘 Topic: UNION and UNION ALL
🏥 Organizer: Indian Data Club | Sponsored by DPDzero
--------------------------------------------------------------------------- */

/*
🧩 Challenge Description:
Create a comprehensive personnel and patient list showing:
- Identifier (patient_id or staff_id)
- Full name
- Type ('Patient' or 'Staff')
- Associated service  
Include only those in 'surgery' or 'emergency' services.  
Order by type, then service, then name.
*/

/* ---------------------------------------------------------------------------
💡 Step 1: Query Explanation
- Use UNION to combine results from the patients and staff tables.  
- The first SELECT pulls patient details; the second SELECT retrieves staff details.  
- Each SELECT must have the same number of columns with compatible data types.  
- UNION automatically removes duplicates, while UNION ALL keeps all records (faster but includes duplicates).  
- ORDER BY organizes the final combined list by type, service, and name.
--------------------------------------------------------------------------- */

/* ---------------------------------------------------------------------------
🧮 Step 2: SQL Query
--------------------------------------------------------------------------- */

SELECT 
    patient_id AS identifier, 
    name AS full_name, 
    service, 
    'Patient' AS type 
FROM patients 
WHERE service IN ('surgery', 'emergency') 

UNION 

SELECT 
    staff_id AS identifier, 
    staff_name AS full_name, 
    service, 
    'Staff' AS type 
FROM staff 
WHERE service IN ('surgery', 'emergency') 

ORDER BY type, service, full_name;

/* ---------------------------------------------------------------------------
✅ Step 3: Learnings / Takeaways
✨ UNION → Combines results from multiple SELECT queries and removes duplicates.  
⚡ UNION ALL → Combines all results, including duplicates (faster execution).  
📏 Rules for UNION:  
   ▫ Both SELECT statements must have the same number of columns.  
   ▫ Corresponding columns must have compatible data types.  
   ▫ Column names from the first SELECT are used in the final result.  

💡 Tip: Use UNION for clean unique lists, and UNION ALL for complete raw combinations.
--------------------------------------------------------------------------- */
