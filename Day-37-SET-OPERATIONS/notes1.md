Chalo, UNION / UNION ALL start karte hain — bilkul basic se.

1️⃣ UNION kya karta hai?

UNION do ya zyada SELECT queries ke results ko combine karta hai.

Example:

SELECT name, department
FROM employees_table
WHERE department = 'IT'

UNION

SELECT name, department
FROM employees_table
WHERE department = 'HR';

Simple meaning:

IT ke results + HR ke results ko ek result mein combine karo.

UNION ka important point

UNION duplicate rows hata deta hai.

Query 1 → A, B, C
Query 2 → C, D, E

UNION → A, B, C, D, E
2️⃣ UNION ALL

UNION ALL duplicates ko remove nahi karta.

Query 1 → A, B, C
Query 2 → C, D, E

UNION ALL → A, B, C, C, D, E
Bas abhi itna yaad rakho:
UNION      → Combine + duplicates remove
UNION ALL  → Combine + duplicates keep
Tiny question 👇

Agar do queries ka result hai:

Query 1 → IT, HR, Sales
Query 2 → HR, Finance

UNION ka result kya hoga?

A) IT, HR, Sales, HR, Finance
B) IT, HR, Sales, Finance
C) IT, Sales, Finance

👉 A / B / C


Ek important rule 👇

UNION / UNION ALL mein dono SELECT statements mein same number of columns hone chahiye.

Example:

SELECT name, department
FROM employees_table

UNION

SELECT name, department
FROM employees_table;

✅ 2 columns + 2 columns → valid

Lekin:

SELECT name, department
FROM employees_table

UNION

SELECT name
FROM employees_table;

❌ 2 columns + 1 column → invalid

Tiny question 🧠

Kya ye query valid hai?

SELECT name, salary
FROM employees_table

UNION

SELECT name, department
FROM employees_table;

A) Yes
B) No



Actually, B — No. 😄

Number of columns same hai, but UNION ke corresponding columns ka compatible data type hona chahiye.

Tumhari query:

SELECT name, salary
FROM employees_table

UNION

SELECT name, department
FROM employees_table;

Second column mein:

salary     → INT
department → VARCHAR

Ye logically same type ka data nahi hai, so aise combine karna appropriate nahi hai.

Simple rule yaad rakho:

For UNION:

Same number of columns ✅
Corresponding columns ka compatible data type ✅

Example:

SELECT name, salary
FROM employees_table

UNION

SELECT name, salary
FROM employees_table;

✅ Valid.

Next tiny question 👇

Agar:

SELECT name, salary
FROM employees_table

UNION

SELECT name, age
FROM employees_table;

salary aur age dono INT hain.

Valid ya invalid?

A) Valid
B) Invalid



✅ Correct! A — Valid. 🔥

Because:

name    → VARCHAR  ↔ VARCHAR
salary  → INT      ↔ age (INT)

So the column count and corresponding data types are compatible.

One more important rule

UNION mein column names first SELECT se aate hain.

Example:

SELECT name AS employee_name, salary
FROM employees_table

UNION

SELECT name, age
FROM employees_table;

Result ke column names honge:

employee_name | salary

Second query ke column names use nahi hote.





✅ Perfect! 🔥 Your UNION query is correct.

SELECT name, department
FROM employees_table
WHERE department = 'IT'

UNION

SELECT name, department
FROM employees_table
WHERE department = 'HR';

This gives all IT + HR employees, and UNION removes duplicate complete rows if any exist.

One small point

UNION duplicate check poori row par karta hai, not just name.

So:

Aman | IT
Aman | HR

These are considered different rows because the department is different.