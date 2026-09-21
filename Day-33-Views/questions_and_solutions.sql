CREATE TABLE employees_table (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    department VARCHAR(20),
    salary INT,
    city VARCHAR(30)
);

INSERT INTO employees_table VALUES
(101,'Aman',25,'Male','IT',50000,'Delhi'),
(102,'Kaif',22,'Male','HR',35000,'Noida'),
(103,'Sara',28,'Female','IT',65000,'Delhi'),
(104,'Ali',30,'Male','Sales',45000,'Lucknow'),
(105,'Riya',26,'Female','HR',40000,'Noida'),
(106,'Rahul',29,'Male','IT',70000,'Mumbai'),
(107,'Neha',24,'Female','Sales',42000,'Delhi'),
(108,'Arjun',31,'Male','Finance',80000,'Pune'),
(109,'Priya',27,'Female','Finance',75000,'Pune'),
(110,'Rohit',32,'Male','Sales',48000,'Mumbai'),
(111,'Ankit',24,'Male','IT',55000,'Delhi'),
(112,'Simran',23,'Female','HR',45000,'Noida');


CREATE TABLE departments_table (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments_table VALUES
(1,'IT'),
(2,'HR'),
(3,'Sales'),
(4,'Finance'),
(5,'Marketing');



CREATE TABLE employees_bonus (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    bonus INT
);

INSERT INTO employees_bonus VALUES
(101,'Aman',50000,5000),
(102,'Kaif',35000,NULL),
(103,'Sara',65000,7000),
(104,'Ali',45000,NULL),
(105,'Riya',40000,3000),
(106,'Rahul',70000,NULL);




-- 🧪 View Practice — Question 1

-- Hume employees_table se Delhi ke employees ka View banana hai.

-- Requirements:
-- View name: delhi_employees
-- Columns:
-- emp_id
-- name
-- department
-- salary
-- Sirf wahi employees hone chahiye jinka city = 'Delhi'
-- Interviewer:

-- "Create a SQL View named delhi_employees for employees working in Delhi."

-- ✍️ Ab sirf apni SQL query likho.
-- Main check karta hoon.


CREATE view delhi_emp AS
select emp_id, name, department, salary 
from employees_table
where city='Delhi';


SELECT *
FROM delhi_emp;



-- select gender from delhi_emp;  --Unknown column 'gender' in 'field list' [12:27:11 PM]


-- ===============================================================================================


-- 🧪 View Practice — Question 2

-- Ab thoda level up.

-- Interviewer:

-- Create a View named high_salary_employees that contains employees whose salary is greater than ₹60,000.

-- Requirements:
-- View name: high_salary_employees
-- Columns:
-- emp_id
-- name
-- department
-- salary
-- Condition:
-- salary > 60000

-- 💡 Hint: Structure tumhe Q1 se pata hai. Bas condition change hogi.


create view high_salary_employees AS
select * from employees_table
where salary>60000;



-- Lekin interview point ⭐

-- Agar hume sirf specific columns chahiye, to explicitly columns likhna better practice hai:

-- CREATE VIEW high_salary_employees AS
-- SELECT emp_id, name, department, salary
-- FROM employees_table
-- WHERE salary > 60000;

-- Why?

-- Clear hai ki View me kya chahiye.
-- Unnecessary columns avoid hote hain.
-- Underlying table me future me columns add hone par unexpected changes se bach sakte hain.

-- So:

-- SELECT * = valid ✅
-- Specific columns = generally better practice ✅


-- ===============================================================================================

-- 🧪 View Practice — Question 3

-- Ab previous concept clear ho gaya, ab practice continue karte hain.

-- Interviewer:

-- Create a View named it_high_salary that shows only IT employees whose salary is greater than 60,000.

-- Requirements:
-- View name: it_high_salary
-- Columns:
-- emp_id
-- name
-- salary
-- Conditions:
-- department = 'IT'
-- salary > 60000

-- 💡 Tumhe 2 conditions combine karni hain.


create view it_high_salary AS
SELECT emp_id,name,salary from employees_table
where department='IT' and salary>60000;

-- Interview cross-question 🔥

-- Q4. View create karne ke baad agar tumhe uska data dekhna ho, kya query likhoge?

-- Sirf query likho.

select * from it_high_salary;

-- Next — Q5 🔥

-- Ab it_high_salary View se sirf un employees ko nikalo jinki salary 65000 se zyada hai.

select * from it_high_salary where salary>65000;


-- Q6 — Interview-style 🔥

-- Suppose we run:

-- DROP VIEW it_high_salary;

-- Question: Is the employees_table deleted too?

-- DROP VIEW it_high_salary; karne par:

-- ❌ employees_table delete nahi hoti.
-- ❌ Base table ka data delete nahi hota.
-- ✅ Sirf it_high_salary View delete hota hai.

-- Important: View ko drop karne se base table affect nahi hoti. Lekin agar base table ka data modify karoge, toh View ke results affect ho sakte hain.



-- Q7 🔥

-- Agar hum ye run karein:

-- UPDATE employees_table
-- SET salary = 75000
-- WHERE emp_id = 103;

-- Aur it_high_salary View exist karta hai, toh kya View mein Sara ki salary bhi 75000 dikhegi?

-- YES/NO + reason.


-- Tumhara answer correct hai:

-- Yes, 75000 dikhegi because View real-time/current data show karta hai. ✅

-- Thoda interview-ready wording:

-- “A normal View does not store a separate copy of the data. It retrieves data from the underlying table, so when the base table is updated, the updated value is reflected when we query the View.”



-- Q8 🔥

-- Ab ek important concept:

CREATE VIEW hr_employees AS
SELECT emp_id, name, salary
FROM employees_table
WHERE department = 'HR';

-- Kya hum is View ke through directly:

UPDATE hr_employees
SET salary = 50000
WHERE emp_id = 102;

-- kar sakte hain?

-- YES/NO + reason.


-- toh underlying employees_table mein bhi Kaif ki salary 50000 ho jayegi. ✅

-- ⚠️ Interview trap

-- Har View updatable nahi hota.

-- Generally Views involving:

-- GROUP BY
-- Aggregate functions like AVG(), SUM(), COUNT()
-- DISTINCT
-- UNION
-- Complex joins

-- directly updateable nahi hote / restrictions hoti hain.



-- Q9 🔥

-- Ye View hai:

CREATE VIEW department_salary AS
SELECT department, AVG(salary) AS avg_salary
FROM employees_table
GROUP BY department;

-- Kya hum is View ko directly update kar sakte hain?

-- YES/NO + reason.


-- 🔥 Exactly! Correct answer.

-- Tumne main point pakad liya:

-- SELECT department, AVG(salary)
-- FROM employees_table
-- GROUP BY department;

-- Ye View directly updatable nahi hai, because isme:

-- AVG() → aggregate function
-- GROUP BY → multiple rows ko group karke ek result banata hai

-- Isliye SQL ke liye ye clear nahi hota ki ek aggregated value ko underlying table ki kaunsi individual row mein update karna hai.

-- Interview line:

-- “A View containing aggregate functions or GROUP BY is generally non-updatable.” ✅






-- Q10 🔥

-- Ab ye batao:

-- Normal View mein data physically store hota hai ya sirf SQL query/definition store hoti hai?


-- Normal View mein actual data ki separate copy store nahi hoti. View ki SQL query/definition store hoti hai.

-- Base Table → Actual Data
-- View       → SQL Query/Definition

-- Isliye base table ka data change hoga, toh View ko query karne par updated data mil sakta hai. ✅






-- Q11 🔥

-- Agar View ko delete karna ho without deleting the underlying table, kaunsi SQL command use karoge?


-- 🔥 Correct!

-- DROP VIEW view_table_name;

-- For example:

-- DROP VIEW it_high_salary;

-- This deletes only the View, not the underlying employees_table. ✅





-- Q12 — Interview trap 🔥

-- Agar View exist nahi karta aur tum safely delete karna chahte ho without getting an error, kya likhoge?

-- Agar View exist karta hai ya nahi karta, dono cases mein safely drop karna ho:

-- DROP VIEW IF EXISTS view_table_name;

-- Example:

-- DROP VIEW IF EXISTS it_high_salary;
-- Yaad rakhna:

-- IF EXISTS → agar View exist karta hai tabhi DROP karo; warna error mat do. ✅




-- Q13 🔥

-- DROP VIEW aur DROP TABLE mein kya difference hai?

-- 2 lines mein batao.


-- Almost correct! First part bilkul correct hai. Bas second part mein ek important correction hai.

-- DROP VIEW
-- DROP VIEW it_high_salary;

-- ✅ Sirf View delete hota hai.
-- ✅ Underlying employees_table delete nahi hoti.

-- DROP TABLE
-- DROP TABLE employees_table;

-- ✅ Underlying table delete hoti hai.
-- ⚠️ Us table par dependent View bhi usable nahi rahegi; MySQL mein View definition generally remain kar sakti hai but underlying table missing hone ki wajah se View query nahi ho paayegi. So simply “View bhi delete ho jati hai” bolna technically exact nahi hai.

-- Interview-ready answer:

-- DROP VIEW removes the View only, while DROP TABLE removes the actual table and its data. A View depending on that table will no longer work. ✅




-- Q14 🔥

-- Ab ek conceptual question:

-- Kya View ke andar JOIN use kar sakte hain?

-- YES/NO + ek reason.

-- Nahi ❌ — yahan mistake hai.

-- View ke andar JOIN bilkul use kar sakte hain. ✅

-- Example:

-- CREATE VIEW employee_department AS
-- SELECT
--     e.emp_id,
--     e.name,
--     e.salary,
--     d.dept_name
-- FROM employees_table e
-- JOIN departments_table d
-- ON e.department = d.dept_name;

-- Yahan View 2 tables ka JOIN result show kar raha hai.

-- Interview point 🔥

-- View ke andar JOIN, WHERE, GROUP BY, HAVING, aggregates, CASE etc. use kar sakte hain.

-- Bas yaad rakho:

-- JOIN allowed hai in View, but JOIN wali View generally directly updatable nahi hoti.







-- Q15 🔥

-- Kya View ke andar WHERE compulsory hai?

-- YES/NO + reason.

-- 🔥 Correct!

-- WHERE View ke andar compulsory nahi hai. ✅

-- Example without WHERE:

-- CREATE VIEW employee_basic AS
-- SELECT emp_id, name, department, salary
-- FROM employees_table;

-- Ye bhi perfectly valid View hai.

-- Interview line:

-- “WHERE clause is optional while creating a View. A View can be created using a simple SELECT query without any filtering condition.”





-- Q16 🔥

-- Agar base table mein ek new column add kar diya:

-- ALTER TABLE employees_table
-- ADD email VARCHAR(100);

-- Aur existing View mein pehle se ye tha:

-- CREATE VIEW employee_basic AS
-- SELECT emp_id, name, department, salary
-- FROM employees_table;

-- Kya email column automatically employee_basic View mein dikhega?

-- YES/NO + reason.

-- Interview-ready line:

-- “If a View explicitly selects columns, adding a new column to the base table does not automatically add that column to the existing View.”





-- Q17 🔥

-- Ab View ka CREATE OR REPLACE VIEW concept:

-- Suppose existing View hai:

-- CREATE VIEW it_high_salary AS
-- SELECT emp_id, name, salary
-- FROM employees_table
-- WHERE department = 'IT';

-- Ab tum View ko modify karke sirf salary > 60000 wale IT employees dikhana chahte ho.

-- Kaunsi command use karoge?

Existing View ko modify/replace karne ke liye:

CREATE OR REPLACE VIEW it_high_salary AS
SELECT emp_id, name, salary
FROM employees_table
WHERE department = 'IT'
AND salary > 60000;
Simple meaning:

CREATE OR REPLACE VIEW = View already exist hai → uski definition ko replace/update kar do. ✅

Pehle:

WHERE department = 'IT';

Ab:

WHERE department = 'IT'
AND salary > 60000;

====================================================

Q18 🔥

Agar View exist nahi karta aur tum CREATE OR REPLACE VIEW use karte ho, kya ye View create kar dega?


🔥 Correct! YES.

CREATE OR REPLACE VIEW ka behavior:

View exist karta hai → definition replace/update karega.
View exist nahi karta → new View create karega. ✅



Q19 🔥

Ab batao:

View aur CTE (WITH) mein ek main difference kya hai?

Hint: kitni der tak available rehte hain?



View vs CTE

View:

CREATE VIEW it_employees AS
SELECT *
FROM employees_table
WHERE department = 'IT';
Database mein save/reusable rehta hai.
Baad mein kabhi bhi:
SELECT * FROM it_employees;

CTE:

WITH it_employees AS (
    SELECT *
    FROM employees_table
    WHERE department = 'IT'
)
SELECT * FROM it_employees;
Sirf ek SQL statement/query ke duration tak available hota hai.
Query khatam → CTE bhi khatam.
Database mein permanently View ki tarah save nahi hota.
Interview line 🔥

View is a stored/reusable query definition, while a CTE exists only for the duration of a single SQL statement.



Q20:
Agar tumhe same query baar-baar reuse karni ho, View ya CTE — kaunsa choose karoge?

Exactly! VIEW ✅

Because a View is stored in the database and can be reused multiple times, while a CTE is only available for that one SQL statement.