/* ---------------------------------------------------------------------------
🎯 Day 8 of the 21 Days SQL Challenge
📘 Topic: String Functions
🏥 Organizer: Indian Data Club | Sponsored by DPDzero
--------------------------------------------------------------------------- */

/*
🧩 Challenge Description:
Create a patient summary that shows:
- patient_id
- full name in uppercase
- service in lowercase
- age category:
    • 'Senior' if age >= 65
    • 'Adult' if age >= 18
    • 'Minor' otherwise
- name length
Only include patients whose name length is greater than 10 characters.
*/

/* ---------------------------------------------------------------------------
💡 Step 1: Query Explanation
- UPPER() converts patient names to uppercase for uniform formatting.
- LOWER() converts service names to lowercase for standardization.
- CASE WHEN provides conditional logic to categorize patients by age.
- LENGTH() calculates the number of characters in each name.
- The WHERE clause filters out names shorter than or equal to 10 characters.
--------------------------------------------------------------------------- */

/* ---------------------------------------------------------------------------
🧮 Step 2: SQL Query
--------------------------------------------------------------------------- */

SELECT 
    patient_id,
    UPPER(name) AS full_name,
    LOWER(service) AS service,
    CASE 
        WHEN age >= 65 THEN 'Senior'
        WHEN age >= 18 THEN 'Adult'
        ELSE 'Minor'
    END AS age_category,
    LENGTH(name) AS name_length
FROM patients
WHERE LENGTH(name) > 10;

/* ---------------------------------------------------------------------------
✅ Step 3: Learnings / Takeaways
🔹 CASE WHEN → Enables conditional logic for categorization.  
🔹 UPPER() → Converts text to uppercase for consistency.  
🔹 LOWER() → Converts text to lowercase for easy comparison or standardization.  
🔹 CONCAT() → Combines multiple strings into one field.  
🔹 LENGTH() → Counts characters in a string, useful for text validation.  
🔹 SUBSTRING() → Extracts part of a string, handy for parsing names or codes.
--------------------------------------------------------------------------- */
