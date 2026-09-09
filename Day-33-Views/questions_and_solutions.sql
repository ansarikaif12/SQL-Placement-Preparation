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





-- 🧪 Question 3 — Thoda Level Up

-- Create a View named it_high_salary that contains:

-- emp_id
-- name
-- salary

-- Conditions:

-- Employee IT department ka hona chahiye
-- Salary 60000 se greater honi chahiye

-- 👉 Apni query likho.


