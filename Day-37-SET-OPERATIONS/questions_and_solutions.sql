-- Ab ek practical question 👇

-- employees_table se IT aur HR employees ke names ek combined list mein chahiye, duplicate names remove karne hain.

-- 👉 Query khud likho using UNION.

select name, department
from employees_table
where department='IT'

union 

select name, department
from employees_table
where department='HR'



-- ✅ Perfect! 🔥 Your UNION query is correct.

-- SELECT name, department
-- FROM employees_table
-- WHERE department = 'IT'

-- UNION

-- SELECT name, department
-- FROM employees_table
-- WHERE department = 'HR';

-- This gives all IT + HR employees, and UNION removes duplicate complete rows if any exist.

-- One small point

-- UNION duplicate check poori row par karta hai, not just name.

-- So:

-- Aman | IT
-- Aman | HR

-- These are considered different rows because the department is different.



-- Next practice 👇

-- Same question, but this time use UNION ALL.

-- 👉 IT + HR employees ki list banao using UNION ALL.



select name, department
from employees_table
where department='IT'

union all 

select name, department
from employees_table
where department='HR'