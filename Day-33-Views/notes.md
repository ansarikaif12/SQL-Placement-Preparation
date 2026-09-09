<!-- 1. What is a View?

A View is a virtual table created from a SQL query.

Simple definition:

View = A saved SQL query that we can use like a table.

Suppose our table is:

SELECT *
FROM employees_table;

And hume baar-baar sirf IT employees chahiye:

SELECT *
FROM employees_table
WHERE department = 'IT';

Instead of writing this query repeatedly, hum iska View bana sakte hain:

CREATE VIEW it_employees AS
SELECT *
FROM employees_table
WHERE department = 'IT';

Ab hum simply:

SELECT *
FROM it_employees;

kar sakte hain.

2. Why do we use Views?

Views ke 4 major reasons yaad rakho:

① Simplify Complex Queries

Agar query bahut long hai:

SELECT e.name, e.salary, d.dept_name
FROM employees_table e
JOIN departments_table d
ON e.department = d.dept_name
WHERE e.salary > 50000;

Isko View me save kar sakte hain.

② Reusability

Ek baar View bana diya → baar-baar use karo.

SELECT * FROM high_salary_employees;
③ Security

Suppose employee table me:

emp_id
name
salary
department
city

Lekin kisi user ko salary nahi dikhani.

View:

CREATE VIEW employee_public AS
SELECT emp_id, name, department, city
FROM employees_table;

Ab user ko:

SELECT * FROM employee_public;

se salary nahi milegi.

④ Data Abstraction

User ko underlying complex tables/query ka structure pata hona zaroori nahi.

User simply:

SELECT * FROM employee_public;

use karta hai.

3. Basic Syntax
CREATE VIEW view_name AS
SELECT column1, column2
FROM table_name
WHERE condition;

Example:

CREATE VIEW delhi_employees AS
SELECT emp_id, name, department, salary
FROM employees_table
WHERE city = 'Delhi';

Now:

SELECT *
FROM delhi_employees;
4. Important Concept ⭐

View normally data ka separate copy nahi banata.

Suppose:

CREATE VIEW it_employees AS
SELECT *
FROM employees_table
WHERE department = 'IT';

View underlying employees_table par based hai.

Agar underlying table ka relevant data change hota hai, View se query karne par updated result reflect ho sakta hai.

Remember:

View stores the query definition, not normally a separate copy of the underlying table's data.

5. View ko Table ki tarah use kar sakte hain?
YES ✅

For example:

CREATE VIEW it_employees AS
SELECT *
FROM employees_table
WHERE department = 'IT';

Then:

SELECT name
FROM it_employees;

And:

SELECT name, salary
FROM it_employees
WHERE salary > 60000;

Yaani View ke upar bhi normal SELECT, WHERE, ORDER BY etc. laga sakte ho.

🎯 Interview Question

Q: What is a View in SQL?

Best answer:

A View is a virtual table based on the result of a SQL query. It is mainly used to simplify complex queries, provide reusable query logic, and restrict access to specific data. -->

<!-- 

Bas ye 3 lines abhi yaad rakho

Table = actual stored data

View = saved query / virtual table

View query karne par underlying table(s) se data retrieve hota hai

Yaad rakhna:

Normal View → Data ki copy ❌ → Query definition ✅

Materialized View → Query result ki physical copy/store ✅


View banane ke liye WHERE condition compulsory nahi hai.

WHERE sirf tab lagate hain jab hume data filter karna ho.

1. Without WHERE ✅
CREATE VIEW all_employees AS
SELECT emp_id, name, salary
FROM employees_table;

Ye valid View hai. Isme saare employees ka selected data available hoga.

2. With WHERE ✅
CREATE VIEW it_employees AS
SELECT emp_id, name, salary
FROM employees_table
WHERE department = 'IT';

Yahan sirf IT employees milenge.

3. JOIN ke saath bhi View bana sakte ho ✅
CREATE VIEW employee_department AS
SELECT e.name, e.salary, d.dept_name
FROM employees_table e
JOIN departments_table d
ON e.department = d.dept_name;
4. GROUP BY ke saath bhi ✅
CREATE VIEW department_salary AS
SELECT department, AVG(salary) AS avg_salary
FROM employees_table
GROUP BY department;
5. Aggregate function ke saath bhi ✅
CREATE VIEW salary_summary AS
SELECT
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary,
    AVG(salary) AS average_salary
FROM employees_table;
🔥 Main point

CREATE VIEW ke andar normal SELECT query likh sakte ho.

CREATE VIEW
     ↓
   SELECT
     ↓
WHERE optional
JOIN optional
GROUP BY optional
Aggregate optional
CASE optional

Bas ek basic rule:

View = kisi SELECT query ko naam dekar save karna.

Isliye WHERE View ki requirement nahi hai, sirf filtering ke liye hai. -->