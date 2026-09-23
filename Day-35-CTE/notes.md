CTE — Common Table Expression
1. CTE kya hota hai?

CTE = Common Table Expression

CTE ek temporary named result set hota hai jo ek SQL statement ke andar define kiya jata hai aur usi statement ke execution ke dauran use hota hai.

Basic syntax:

WITH cte_name AS (
    SELECT ...
    FROM ...
    WHERE ...
)
SELECT *
FROM cte_name;

Simple language:

CTE = ek query ke result ko temporary naam dekar usi query mein dobara use karna.

2. CTE kyu use karte hain?

Main reason hai complex SQL query ko readable aur manageable banana.

Without CTE:

SELECT *
FROM (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees_table
    GROUP BY department
) AS temp
WHERE avg_salary > 50000;

CTE ke saath:

WITH dept_salary AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees_table
    GROUP BY department
)
SELECT *
FROM dept_salary
WHERE avg_salary > 50000;

CTE version zyada readable hai. ✅

3. CTE ke Benefits
✅ 1. Readability

Complex query ko small logical parts mein divide kar sakte ho.

Step 1 → data prepare
Step 2 → result filter
Step 3 → final output
✅ 2. Complex queries ko easy banana

Nested subqueries bahut deep ho sakti hain:

SELECT ...
FROM (
    SELECT ...
    FROM (
        SELECT ...
    ) x
) y;

CTE se same logic readable ho sakta hai:

WITH first_step AS (...),
second_step AS (...)
SELECT ...
FROM second_step;
✅ 3. Same CTE ko same query mein reuse kar sakte ho

Ek query ke andar CTE ko multiple places par reference karna possible hai.

Example:

WITH high_salary AS (
    SELECT *
    FROM employees_table
    WHERE salary > 60000
)
SELECT *
FROM high_salary;

Multiple CTEs bhi bana sakte ho:

WITH
it_employees AS (...),
high_salary AS (...)
SELECT ...;
✅ 4. Step-by-step SQL logic

Complex problem ko logically break kar sakte ho:

CTE 1
  ↓
CTE 2
  ↓
Final SELECT

Ye placement interviews mein particularly useful hai because query ka logic explain karna easy hota hai.

✅ 5. Recursive problems

CTE ka ek important feature Recursive CTE hai.

Iska use hierarchy/tree type data ke liye ho sakta hai:

Employee
   ↓
Manager
   ↓
Department Head

Recursive CTE hum later separately cover karenge.

4. CTE ke Disadvantages
❌ 1. Permanent nahi hota

CTE database mein permanently save nahi hota.

WITH temp_data AS (...)
SELECT * FROM temp_data;

Query khatam → CTE ka scope khatam.

❌ 2. Reusable database object nahi hai

Agar same result ko baar-baar different queries mein use karna hai, CTE appropriate nahi ho sakta.

Us case mein View useful ho sakta hai.

❌ 3. Performance automatically improve nahi hoti

Ye important interview point hai:

CTE mainly readability and query organization ke liye hota hai; CTE use karne se automatically query faster nahi ho jati.

Actual performance database optimizer aur query structure par depend karti hai.

❌ 4. Complex CTEs difficult ho sakte hain

Agar bahut saare CTEs chain kar diye:

CTE1
 ↓
CTE2
 ↓
CTE3
 ↓
CTE4
 ↓
CTE5

to query phir se difficult to understand ho sakti hai.

5. CTE vs Subquery

Ye important interview question hai. 🔥

CTE	Subquery
WITH use karta hai	Query ke andar directly likhte hain
Complex queries mein readable	Nested hone par readability kam ho sakti hai
Named result set	Usually unnamed result
Multiple CTEs bana sakte hain	Multiple nested subqueries possible
Recursive CTE possible	Recursive structure ke liye CTE commonly used
Current SQL statement tak scope	Current SQL statement tak scope

Example Subquery:

SELECT *
FROM (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees_table
    GROUP BY department
) x
WHERE avg_salary > 50000;

Same logic using CTE:

WITH dept_salary AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees_table
    GROUP BY department
)
SELECT *
FROM dept_salary
WHERE avg_salary > 50000;

Logic same ho sakta hai; CTE generally readability improve karta hai.

6. CTE vs View

Ye bhi very important hai because hum Views already kar chuke hain.

CTE	View
Temporary	Persistent database object
WITH	CREATE VIEW
Sirf current statement mein available	Multiple queries mein reuse
Database mein permanently save nahi hota	Database mein definition save hoti hai
Complex query ko organize karne ke liye	Reusable query abstraction ke liye
Query khatam → CTE scope khatam	View database mein rehta hai
Example CTE
WITH it_employees AS (
    SELECT *
    FROM employees_table
    WHERE department = 'IT'
)
SELECT *
FROM it_employees;

Query khatam → CTE khatam.

Example View
CREATE VIEW it_employees AS
SELECT *
FROM employees_table
WHERE department = 'IT';

Ab baad mein:

SELECT *
FROM it_employees;

kar sakte ho.

7. CTE vs Temporary Table

Ek aur useful difference:

CTE	Temporary Table
WITH se create	CREATE TEMPORARY TABLE
Current statement ka scope	Session/connection ke scope mein available ho sakta hai
Data separately table ke form mein create karna zaroori nahi	Temporary table physically create hoti hai
Mainly query organization	Temporary data ko multiple statements mein use karna
Automatically statement ke baad scope end	Session/connection end ya explicitly drop hone tak

Placement ke liye abhi basic distinction yaad rakho.

8. CTE ka Scope

CTE:

WITH temp AS (
    SELECT *
    FROM employees_table
)
SELECT *
FROM temp;

Ye chalega. ✅

Lekin:

SELECT *
FROM temp;

baad mein alag query ke roop mein ❌ nahi chalega.

Because CTE ka scope sirf us SQL statement tak hota hai.

9. Multiple CTEs

Ek hi query mein multiple CTEs bana sakte ho:

WITH
it_employees AS (
    SELECT *
    FROM employees_table
    WHERE department = 'IT'
),
high_salary AS (
    SELECT *
    FROM it_employees
    WHERE salary > 60000
)
SELECT *
FROM high_salary;

Flow:

employees_table
       ↓
it_employees
       ↓
high_salary
       ↓
final SELECT

Ye complex SQL mein bahut useful pattern hai.

10. CTE ke Types

Placement level par mainly:

1. Non-recursive CTE

Normal CTE:

WITH data AS (
    SELECT ...
)
SELECT *
FROM data;
2. Recursive CTE

CTE khud ko reference karta hai.

WITH RECURSIVE ...

Common use cases:

Hierarchies
Employee-manager relationships
Tree structures
Sequence generation

Recursive CTE ko hum separately practice karenge.

🔥 Interview Quick Revision

Q: CTE kya hai?

CTE is a temporary named result set defined using WITH, available only within the current SQL statement.

Q: Why use CTE?

Mainly to improve readability, organize complex queries, and break SQL logic into logical steps.

Q: Is CTE permanent?

❌ No.

Q: CTE vs View?

CTE is temporary and statement-scoped; View is a persistent database object.

Q: CTE automatically query ko faster karta hai?

❌ No. CTE mainly improves query organization/readability; performance depends on the query and optimizer.

Q: CTE vs Subquery?

Both can represent intermediate results, but CTEs are generally easier to read and organize, especially for complex multi-step queries.

Ab theory clear hai, to Basic CTE → WITH syntax → hamare employees_table par practice karte hain.