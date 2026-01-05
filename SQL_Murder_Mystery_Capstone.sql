/* ---------------------------------------------------------------------------
🕵️ SQL Murder Mystery: "Who Killed the CEO?"
📘 Capstone Project — 21 Days SQL Challenge
🏢 Organized by: Indian Data Club | Sponsored by: DPDzero
--------------------------------------------------------------------------- */

/*
🎯 Objective:
The CEO of TechNova Inc. was found dead in their office on October 15, 2025, at 9:00 PM.  
Your task as the Lead Data Analyst is to use SQL to identify the killer by analyzing key records.

Database Tables:
- employees
- keycard_logs
- calls
- alibis
- evidence
*/

/* ---------------------------------------------------------------------------
🔍 Step 1: Identify who entered the CEO’s Office during the time of the murder
--------------------------------------------------------------------------- */

SELECT * 
FROM keycard_logs
WHERE room = 'CEO Office' 
  AND entry_time BETWEEN '2025-10-15 20:50:00' AND '2025-10-15 21:00:00';

/*
🧩 Outcome:
We identified a potential suspect who accessed the CEO Office during the murder timeframe.
*/

/* ---------------------------------------------------------------------------
🧾 Step 2: Retrieve details of the identified suspect
--------------------------------------------------------------------------- */

SELECT * 
FROM employees
WHERE employee_id = 4;

/*
🧩 Outcome:
The suspect appears to be David Kumar, a DevOps Engineer from the Engineering Department.
*/

/* ---------------------------------------------------------------------------
🕵️ Step 3: Verify the suspect’s alibi during the crime window
--------------------------------------------------------------------------- */

SELECT     
    a.employee_id, 
    a.claimed_location,          
    a.claim_time, 
    k.entry_time, 
    k.exit_time,   
    k.room AS actual_room
FROM alibis a
JOIN keycard_logs k   
    ON a.employee_id = k.employee_id
    AND a.claim_time BETWEEN k.entry_time AND k.exit_time
WHERE a.claimed_location != k.room;

/*
🧩 Outcome:
David Kumar claimed to be in the Server Room but was actually in the CEO’s Office.
His alibi does not match the keycard log records.
*/

/* ---------------------------------------------------------------------------
📞 Step 4: Analyze calls made during the murder window
--------------------------------------------------------------------------- */

SELECT    
    c.caller_id, 
    e1.name AS caller, 
    e2.name AS receiver, 
    call_time,    
    duration_sec
FROM calls c
JOIN employees e1 ON c.caller_id = e1.employee_id
JOIN employees e2 ON c.receiver_id = e2.employee_id
WHERE call_time BETWEEN '2025-10-15 20:50:00' AND '2025-10-15 21:00:00';

/*
🧩 Outcome:
David Kumar made a suspicious 45-second call to Alice Johnson during the murder time.
*/

/* ---------------------------------------------------------------------------
🧬 Step 5: Examine evidence from the crime scene
--------------------------------------------------------------------------- */

SELECT * 
FROM evidence
WHERE room = 'CEO Office';

/*
🧩 Outcome:
Evidence from the crime scene includes fingerprints and a keycard trace.
Now we’ll check if it matches our suspect.
*/

/* ---------------------------------------------------------------------------
🧩 Step 6: Match the evidence with the suspect
--------------------------------------------------------------------------- */

SELECT 
    k.*, 
    em.name, 
    e.description, 
    e.found_time
FROM keycard_logs k 
JOIN evidence e ON k.room = e.room
JOIN employees em ON k.employee_id = em.employee_id
WHERE k.room = 'CEO Office'
  AND entry_time BETWEEN '2025-10-15 20:50:00' AND '2025-10-15 21:00:00';

/*
🧩 Outcome:
The fingerprint at the scene matches David Kumar — confirming our suspicions.
*/

/* ---------------------------------------------------------------------------
🧠 Step 7: Combine all findings using CTEs
--------------------------------------------------------------------------- */

WITH suspect AS (
    SELECT 
        k.*, 
        e.name, 
        e.department, 
        e.role
    FROM keycard_logs k
    JOIN employees e ON k.employee_id = e.employee_id
    WHERE room = 'CEO Office'
      AND entry_time BETWEEN '2025-10-15 20:50:00' AND '2025-10-15 21:00:00'
),
false_claim AS (
    SELECT     
        a.employee_id, 
        a.claimed_location,          
        a.claim_time, 
        k.entry_time, 
        k.exit_time,   
        k.room AS actual_room
    FROM alibis a
    JOIN keycard_logs k   
        ON a.employee_id = k.employee_id
        AND a.claim_time BETWEEN k.entry_time AND k.exit_time
    WHERE a.claimed_location != k.room
),
suspicious_call AS (
    SELECT    
        c.caller_id, 
        e1.name AS caller, 
        e2.name AS receiver, 
        call_time,    
        duration_sec
    FROM calls c
    JOIN employees e1 ON c.caller_id = e1.employee_id
    JOIN employees e2 ON c.receiver_id = e2.employee_id
    WHERE call_time BETWEEN '2025-10-15 20:50:00' AND '2025-10-15 21:00:00'
)
SELECT name
FROM employees
WHERE employee_id IN (SELECT employee_id FROM suspect)
  AND employee_id IN (SELECT employee_id FROM false_claim)
  AND employee_id IN (SELECT caller_id FROM suspicious_call);

/*
🎯 Final Outcome:
All evidence, keycard data, call records, and false alibi point to one person — David Kumar.

Case Closed. 🔒
*/
