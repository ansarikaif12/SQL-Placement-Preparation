-- Question:
-- employees_table se har department ke employees ko salary ke basis par rank karo, highest salary ko Rank 1 do.

-- 👉 Khud SQL query likho.
-- Main sirf tumhari query check karunga.


select name, department, 
rank() over(partition by department order by salary desc) 
as dept_rank 
from employees_table;



-- Next practice 👇

-- Ab same question DENSE_RANK() se karo:

-- Har department ke andar salary ke basis par dense rank do.

-- 👉 Query tum likho.

select name, department, salary,
DENSE_RANK() over(partition by department order by salary desc) 
as dept_rank 
from employees_table;


-- Testing purpose:

-- SELECT
--     name,
--     salary,
--     DENSE_RANK() OVER(ORDER BY salary DESC) AS salary_rank
-- FROM employees_table;



-- Question

-- Har department ke andar employees ko salary ke basis par unique row number do.

-- Highest salary → 1

-- Use:

-- ROW_NUMBER() OVER(...)

-- Khud query likho.

select name, department, salary,
ROW_NUMBER() over(partition by department order by salary desc) 
as dept_rank 
from employees_table;




-- Next step — one tiny interview question 👇

-- Suppose IT has:

-- Rahul   70000
-- Sara    65000
-- Ankit   55000
-- Aman    50000

-- What will ROW_NUMBER() give to Rahul?

-- A) 0
-- B) 1
-- C) 2

-- 👉 A / B / C


-- Correct! — 1 🔥

-- Because ORDER BY salary DESC means highest salary first:

-- Rahul   70000 → 1
-- Sara    65000 → 2
-- Ankit   55000 → 3
-- Aman    50000 → 4
-- Next tiny concept 👇

-- Ab ek practical question:

-- IT department mein highest-paid employee ko identify karo using ROW_NUMBER().

-- Hint:

-- ROW_NUMBER() OVER(
--     PARTITION BY department
--     ORDER BY salary DESC
-- )

-- Abhi Window Function + CTE use karke query likho.


with it_dept AS
(
    select name, department, salary,
    ROW_NUMBER() OVER(
     PARTITION BY department
     ORDER BY salary DESC
    )

    from employees_table;
);


❌ Mistakes

1. CTE ke andar ; nahi lagta.

2. CTE banane ke baad usko SELECT karna hota hai.

Aur question specifically IT department ke highest-paid employee ka tha, toh final query mein WHERE dept_rank = 1 lagayenge.


✅ Correct query:
WITH it_dept AS (
    SELECT
        name,
        department,
        salary,
        ROW_NUMBER() OVER(
            PARTITION BY department
            ORDER BY salary DESC
        ) AS dept_rank
    FROM employees_table
    WHERE department = 'IT'
)
SELECT *
FROM it_dept
WHERE dept_rank = 1;

Output:

Rahul | IT | 70000 | 1
Bas CTE ka pattern yaad rakho:
WITH cte_name AS (
    SELECT ...
    FROM ...
)
SELECT ...
FROM cte_name;

Abhi ROW_NUMBER + CTE ka basic use samajh aa gaya. 💯

Next question 👇

Agar har department ka highest-paid employee nikalna ho, toh kya WHERE department = 'IT' CTE ke andar rakhenge?

A) Yes
B) No


Correct! — NO. 🔥

Agar har department ka highest-paid employee chahiye, toh IT filter nahi lagayenge.

WITH ranked_employees AS (
    SELECT
        name,
        department,
        salary,
        ROW_NUMBER() OVER(
            PARTITION BY department
            ORDER BY salary DESC
        ) AS dept_rank
    FROM employees_table
)
SELECT *
FROM ranked_employees
WHERE dept_rank = 1;

Yahan:

PARTITION BY department → har department ki ranking alag
dept_rank = 1           → har department ka highest salary
Next tiny question 👇

Agar hume har department ke top 2 highest-paid employees chahiye, toh final WHERE mein kya likhenge?

A) WHERE dept_rank = 1
B) WHERE dept_rank <= 2
C) WHERE dept_rank = 2

👉 A / B / C


✅ Correct! B — WHERE dept_rank <= 2 🔥

WITH ranked_employees AS (
    SELECT
        name,
        department,
        salary,
        ROW_NUMBER() OVER(
            PARTITION BY department
            ORDER BY salary DESC
        ) AS dept_rank
    FROM employees_table
)
SELECT *
FROM ranked_employees
WHERE dept_rank <= 2;

Isse har department ke top 2 highest-paid employees milenge.

Ab ek important basic difference:
dept_rank = 1   → Top 1
dept_rank <= 2  → Top 2
dept_rank <= 3  → Top 3



-- Next practice 👇

-- Question: employees_table se har department ke top 2 highest-paid employees nikalne ki complete query khud likho.

-- Hint: ROW_NUMBER() + PARTITION BY + CTE

with top2 as
(
    select name, department, salary,
    row_number() over(partition by department order by salary desc) as rnk
    from employees_table
)

select * from top2
where rnk<=2;


-- Yaad rakho:

-- rnk = 1      → Top 1
-- rnk = 2      → Only 2nd
-- rnk <= 2     → Top 2
-- rnk <= 3     → Top 3

-- 🔥 Tumhara approach correct tha, sirf = ki jagah <= chahiye tha.




-- Ab ek practical question 👇

-- Har department ka lowest-paid employee nikalne ki complete query likho using:

-- CTE + ROW_NUMBER()

-- 👉 Tum query likho.


with lowest_salary as
(
    select name, department, salary,
    row_number() over(partition by department order by salary asc) as rnk
    from employees_table
)

select * from lowest_salary
where rnk=1;



-- Logic:

-- PARTITION BY department → each department separately
-- ORDER BY salary ASC      → lowest salary first
-- ROW_NUMBER()             → numbering
-- rnk = 1                  → lowest-paid employee
-- Window Functions ka basic core ab clear hai 💯

-- You have covered:

-- AVG() OVER()
-- PARTITION BY
-- RANK()
-- ROW_NUMBER()
-- DENSE_RANK()
-- CTE + Window Function
-- Top 1 / Top 2
-- Highest / Lowest salary