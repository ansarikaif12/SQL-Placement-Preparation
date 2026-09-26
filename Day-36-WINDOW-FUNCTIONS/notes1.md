Window Functions
1. Window Function kya hota hai?

Window Function ek aisa SQL function hai jo multiple rows ko consider karke calculation karta hai, lekin individual rows ko remove nahi karta.

Simple difference:

GROUP BY
SELECT department, AVG(salary)
FROM employees_table
GROUP BY department;

Result mein har department ki ek row aayegi.

Window Function
SELECT
    name,
    department,
    salary,
    AVG(salary) OVER(PARTITION BY department) AS dept_avg
FROM employees_table;

Yahan employees ki individual rows bhi rahengi, aur har employee ke saath uske department ka average salary bhi dikhega.

Example:

name   department   salary   dept_avg
Aman   IT           50000    60000
Sara   IT           65000    60000
Rahul  IT           70000    60000
Ankit  IT           55000    60000
🔑 Main difference

GROUP BY → rows ko group karke rows reduce karta hai.

Window Function → calculation karta hai but rows ko retain karta hai.

Basic Syntax
function() OVER(
    PARTITION BY column
    ORDER BY column
)

Abhi sirf OVER() aur PARTITION BY par focus karenge.

Important Window Functions

Placement ke liye:

ROW_NUMBER()
RANK()
DENSE_RANK()
LAG()
LEAD()
AVG() OVER()
SUM() OVER()

Hum ek-ek karke practice karenge.

🎯 First concept: OVER()

Example:

SELECT
    name,
    salary,
    AVG(salary) OVER() AS overall_avg_salary
FROM employees_table;

AVG(salary) OVER() poori table ka average calculate karega, lekin har employee ki row retain karega.

Tumhara first question 👇

Is query ka purpose kya hai?

SELECT
    name,
    salary,
    AVG(salary) OVER() AS avg_salary
FROM employees_table;



Ek-ek chhote step mein karte hain. Abhi PARTITION BY, RANK(), etc. sab bhool jao.

Step 1: Normal AVG()

Ye query dekho:

SELECT AVG(salary)
FROM employees_table;

Ye kya karegi?

👉 Puri table ki average salary ka sirf ek result degi.

Step 2: Ab AVG() OVER()
SELECT
    name,
    salary,
    AVG(salary) OVER() AS avg_salary
FROM employees_table;

Yahan important difference hai:

Normal AVG:

AVG(salary)
     ↓
one result

AVG() OVER():

AVG(salary) OVER()
        ↓
average calculate karo
        ↓
har employee ki row ke saath dikhao

Example conceptually:

Aman    50000    53667
Kaif    35000    53667
Sara    65000    53667
Ali     45000    53667
...

Same average har row ke saath aa raha hai.

Bas abhi itna yaad rakho:

OVER() window function ko rows ko retain karte hue calculation karne deta hai.

Abhi PARTITION BY nahi karenge.

Chhota sa question:
SELECT
    name,
    salary,
    AVG(salary) OVER() AS avg_salary
FROM employees_table;

Isme avg_salary kya represent karega?

A) Har employee ki salary
B) Puri table ki average salary
C) Har department ki average salary

👉 A/B/C

B

🔥 Exactly — B!

AVG(salary) OVER()

→ puri table ki average salary calculate karega aur har employee ki row ke saath show karega.

Ab next tiny step 👇

Ab hum PARTITION BY introduce karte hain.

SELECT
    name,
    department,
    salary,
    AVG(salary) OVER(PARTITION BY department) AS dept_avg
FROM employees_table;

Yahan:

PARTITION BY department
        ↓
employees ko department-wise groups mein divide karo
        ↓
har department ka average salary nikalo

Example:

Aman   IT       50000   IT ka average
Sara   IT       65000   IT ka average
Rahul  IT       70000   IT ka average

Kaif   HR       35000   HR ka average
Riya   HR       40000   HR ka average
...

Important: Rows delete/group nahi hoti. Har employee ki row rahegi. ✅

Ab sirf itna batao:

PARTITION BY department ka matlab kya hai?

A) Employees ko department ke basis par groups mein divide karna
B) Employees ko delete karna
C) Salary ko sort karna

👉 A/B/C


✅ Correct! A

PARTITION BY department ka simple meaning:

Employees ko department ke basis par groups mein divide karna.

Example:

SELECT
    name,
    department,
    salary,
    AVG(salary) OVER(PARTITION BY department) AS dept_avg
FROM employees_table;

Yahan:

IT → IT employees ka average
HR → HR employees ka average
Sales → Sales employees ka average
Finance → Finance employees ka average

But important: employees ki individual rows delete/group nahi hoti. Har employee ki row wahi rehti hai.