1️⃣ Basic CTE Syntax
WITH cte_name AS (
    SELECT ...
    FROM ...
    WHERE ...
)
SELECT *
FROM cte_name;
Example

HR employees ko CTE mein store karke display karo:

WITH hr_employees AS (
    SELECT emp_id, name, salary
    FROM employees_table
    WHERE department = 'HR'
)
SELECT *
FROM hr_employees;

Flow:

employees_table
      ↓
   HR filter
      ↓
hr_employees CTE
      ↓
  SELECT *
🎯 Ab tumhari turn

Question 1:

employees_table se ek CTE banao jisme IT department ke employees ho.

Sirf ye columns chahiye:

emp_id
name
salary

Phir CTE se result display karo.