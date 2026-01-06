# 🕵️ SQL Murder Mystery — “Who Killed the CEO?”  
*A Capstone Project from the 21 Days SQL Challenge*  
**Organized by:** Indian Data Club
**Sponsored by:** DPDzero

---

## 🎯 Project Overview
This **SQL-based investigative project** serves as the **Capstone** for the **21 Days SQL Challenge**, designed to test analytical reasoning, SQL mastery, and storytelling through data.  

The challenge revolves around uncovering the mystery behind the **murder of TechNova Inc.’s CEO**, who was found dead in their office on **October 15, 2025, at 9:00 PM**.  

Using only SQL queries, we analyze digital evidence across multiple datasets — including employee records, keycard logs, call history, and alibis — to identify the killer.

---

## 🧩 Objective
As the **Lead Data Analyst**, your mission was to:
- Investigate **who entered the CEO’s office** around the time of the murder.  
- Verify **suspect alibis** using keycard activity logs.  
- Analyze **call records** to uncover suspicious communications.  
- Cross-reference **evidence found at the crime scene** with employee data.  
- Combine all clues to reveal the **culprit** through logical SQL deductions.

---

## 🗂️ Database Schema
The investigation relied on five key tables:  

| Table | Description |
|--------|--------------|
| **employees** | Contains employee details such as name, department, and role. |
| **keycard_logs** | Records every employee’s room access with timestamps. |
| **calls** | Logs phone call activity between employees. |
| **alibis** | Stores claimed locations of employees during specific times. |
| **evidence** | Contains physical evidence details found at the crime scene. |

---

## 🧠 Investigation Steps

## **1️⃣ Identify suspects**
Used keycard logs to find who entered the CEO’s office between **8:50 PM and 9:00 PM** — the murder window.
Finding:
A single suspect — Employee ID 4 (David Kumar), DevOps Engineer from Engineering.

## **2️⃣ Verify suspect’s alibi**
Cross-referenced his claimed location (Server Room) with keycard activity logs.
SQL comparison revealed he was in the CEO’s office, not the server room.

## **3️⃣ Check suspicious calls**
Queried all calls made between 8:50 PM and 9:00 PM.
Found a 45-second call between David Kumar and Alice Johnson — right during the crime.

## **4️⃣ Match physical evidence**
Evidence from the crime scene (fingerprint, keycard swipe) matched the suspect’s credentials.

## **5️⃣ Combine all findings**
Using CTEs (Common Table Expressions), all clues — location access, false alibi, and suspicious calls — were combined into one logical query to pinpoint the killer.

Result:
✅ All evidence confirmed that David Kumar was the murderer.
💀 Case Closed.

🧮 SQL Concepts Applied
Filtering & Logical Operators: WHERE, AND, OR, BETWEEN

Joins: INNER JOIN for cross-referencing tables

CTEs: Structured multiple datasets for cleaner logic

Aggregations: Time-based and event-specific comparisons

String & Date Functions: For time window filtering and evidence matching

📘 Key Learnings
🧩 SQL can be used beyond analytics — for data forensics and logical reasoning.

🧠 CTEs simplify multi-step investigations into readable blocks.

🕵️ Combining structured data from multiple sources reveals actionable insights.

⚙️ Query order and logical flow (FROM → WHERE → GROUP BY → HAVING → SELECT) are critical for correctness.

🛠️ Tools & Environment
Database: MySQL

Editor: Notepad++, SQL Workbench

Version Control: GitHub

🌟 Acknowledgment
Special thanks to Indian Data Club and DPDzero for organizing this challenge and providing a truly engaging way to learn SQL through real-world storytelling.
This project was both a technical test and a narrative investigation, merging logic, analysis, and creativity.

🏁 Final Verdict
🧍‍♂️ Killer: David Kumar
👔 Role: DevOps Engineer, Engineering Department
🕒 Time of Crime: October 15, 2025 — 9:00 PM
📍 Location: CEO’s Office, TechNova Inc.
✅ Case Closed.

⭐ If you enjoyed this project, give it a star on GitHub!
