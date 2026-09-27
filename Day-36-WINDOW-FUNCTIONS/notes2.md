Ab next tiny step 👇

RANK() ek window function hai jo ranking deta hai.

SELECT
    name,
    salary,
    RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employees_table;

Iska matlab: highest salary = rank 1.

Question: ORDER BY salary DESC yahan kya kar raha hai?

A) Salary ko highest → lowest arrange karke ranking de raha hai
B) Salary ko lowest → highest arrange kar raha hai
C) Salary ko delete kar raha hai

👉 A / B / C

A

✅ Correct! A

ORDER BY salary DESC means highest salary → lowest salary.

So:

SELECT
    name,
    salary,
    RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employees_table;

Conceptually:

Arjun   80000   → 1
Priya   75000   → 2
Rahul   70000   → 3
Sara    65000   → 4
...
One important thing 👇

RANK() same salary ko same rank deta hai.

For example, agar:

Aman   50000
Ankit  50000

then dono ka rank:

Aman   50000   → 7
Ankit  50000   → 7

Bas abhi itna yaad rakho:

RANK() = rows ko ranking dena.

Next tiny question 🧠

Agar hume har department ke andar salary ranking chahiye, toh kya use karenge?

RANK() OVER( ______ department )

A) ORDER BY
B) PARTITION BY
C) GROUP BY

👉 A / B / C

correct answer is B: PARTITION BY 😄

Yaad rakho:

ORDER BY → ranking kis order mein hogi
PARTITION BY → ranking kin groups ke andar hogi

Example:

SELECT
    name,
    department,
    salary,
    RANK() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS dept_rank
FROM employees_table;

Iska meaning:

Har department ke andar highest salary wale employee ko Rank 1 milega.

For example, IT:

Rahul   70000 → 1
Sara    65000 → 2
Ankit   55000 → 3
Aman    50000 → 4

HR ki ranking alag se start hogi:

Simran  45000 → 1
Riya    40000 → 2
Kaif    35000 → 3
Bas ye formula yaad rakho:
RANK() OVER(
    PARTITION BY department
    ORDER BY salary DESC
)

PARTITION BY = group
ORDER BY = order/ranking direction

Next question 👇

Agar hume poori company mein salary ranking chahiye, department-wise nahi, toh kya PARTITION BY department lagayenge?

A) Yes
B) No


✅ Correct! B — No.

Agar poori company mein salary ranking chahiye, toh PARTITION BY nahi lagayenge.

SELECT
    name,
    salary,
    RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employees_table;

Yahan sab employees ek hi group hain, isliye ranking:

highest salary → Rank 1

Ab ek last tiny concept 👇

RANK() aur ROW_NUMBER() mein basic difference:

RANK() → same salary ho toh same rank
ROW_NUMBER() → har row ko unique number

Example:

Salary       RANK()       ROW_NUMBER()
50000        1            1
50000        1            2
40000        3            3

👉 Question: Agar do employees ki salary same hai aur hume dono ko same position deni hai, toh kya use karenge?

A) RANK()
B) ROW_NUMBER()

Exactly! A — RANK() 🔥

Bas abhi Window Functions mein itna clear rakho:

RANK()       → same value = same rank
ROW_NUMBER() → every row = unique number
Next tiny step: ROW_NUMBER()
SELECT
    name,
    salary,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employees_table;

Agar do employees ki salary same bhi ho:

Salary    ROW_NUMBER
50000     1
50000     2
40000     3

👉 Question: ROW_NUMBER() mein same salary wale employees ko same number milega?

A) Yes
B) No

✅ Correct! B — No.

ROW_NUMBER() har employee ko unique number deta hai, even if salary same ho.

Bas ye difference yaad rakho:

RANK()        → Same salary → Same rank
ROW_NUMBER()  → Same salary → Different number
Next tiny question 👇

Agar hume har department ke andar employees ko salary ke basis par unique number dena ho, toh kya ye query sahi hai?

ROW_NUMBER() OVER(
    PARTITION BY department
    ORDER BY salary DESC
)

A) Yes
B) No

yes

✅ Correct! A — Yes. 🔥

ROW_NUMBER() OVER(
    PARTITION BY department
    ORDER BY salary DESC
)

Meaning:

PARTITION BY department → har department ka alag group
ORDER BY salary DESC → highest salary first
ROW_NUMBER() → har employee ko unique number

Example IT:

Rahul   70000 → 1
Sara    65000 → 2
Ankit   55000 → 3
Aman    50000 → 4

HR ki numbering phir se 1 se start hogi.

Next concept 👇

Abhi tak:

AVG()        → average
RANK()       → ranking
ROW_NUMBER() → unique row number

Ek aur basic function hai: DENSE_RANK().

Isme same salary ko same rank milta hai, lekin rank ke beech gap nahi chhodta.

Example:

Salary       RANK()       DENSE_RANK()
50000        1            1
50000        1            1
40000        3            2

👉 Question: DENSE_RANK() mein same salary wale employees ko same rank milega?

A) Yes
B) No

✅ Correct! A — Yes. 🔥

DENSE_RANK() mein same salary ko same rank milta hai.

Bas RANK() se ek difference:

Salary    RANK()    DENSE_RANK()
50000     1         1
50000     1         1
40000     3         2
30000     4         3

👉 RANK() → gap aa sakta hai
👉 DENSE_RANK() → gap nahi aata

Ab ek chhota recap 🧠
ROW_NUMBER() → unique number
RANK()       → same value = same rank, gap possible
DENSE_RANK() → same value = same rank, no gap
Next question

Agar salaries hain:

80000
70000
70000
60000

RANK() mein 60000 ko kya rank milega?

A) 3
B) 4
C) 2

👉 A / B / C


Correct! B — 4 🔥

Because RANK() leaves a gap when there is a tie:

Salary    RANK()
80000     1
70000     2
70000     2
60000     4

Whereas DENSE_RANK():

Salary    DENSE_RANK()
80000     1
70000     2
70000     2
60000     3
Ab Window Functions ka basic part almost clear hai. 💪

Next, ek real interview-style question:

Question:
employees_table se har department ke employees ko salary ke basis par rank karo, highest salary ko Rank 1 do.

👉 Khud SQL query likho.
Main sirf tumhari query check karunga.


✅ Correct:

SELECT
    name,
    department,
    RANK() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS dept_rank
FROM employees_table;
Yaad rakho:
RANK()       → function
OVER(...)    → window ka rule
PARTITION BY → groups
ORDER BY     → ranking order

Tumhari logic bilkul sahi thi; sirf RANK() ka syntax fix karna tha. ✅

Next practice 👇

Ab same question DENSE_RANK() se karo:

Har department ke andar salary ke basis par dense rank do.

👉 Query tum likho.

✅ Correct:

SELECT
    name,
    department,
    DENSE_RANK() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS dept_rank
FROM employees_table;
Ab ek important syntax pattern yaad rakho:
FUNCTION() OVER(...)

Examples:

AVG(salary) OVER(...)
RANK() OVER(...)
DENSE_RANK() OVER(...)
ROW_NUMBER() OVER(...)

Tumhari Window Function ki logic sahi ja rahi hai. 💯


Window Function ke saath abhi GROUP BY mat lagao.

Ek simple rule yaad rakho:

GROUP BY → rows ko combine karta hai
Window Function → rows ko retain karke calculation/ranking karta hai




Next tiny question

Agar har department ka lowest-paid employee nikalna ho, toh ORDER BY salary mein kya use karenge?

A) ASC
B) DESC

✅ Correct! A — ASC 🔥

Lowest salary ko pehle lane ke liye:

ORDER BY salary ASC

Then ROW_NUMBER() mein:

ROW_NUMBER() OVER(
    PARTITION BY department
    ORDER BY salary ASC
)

So:

ASC  → Lowest → Highest
DESC → Highest → Lowest



Window Functions ka basic core ab clear hai 💯

You have covered:

AVG() OVER()
PARTITION BY
RANK()
ROW_NUMBER()
DENSE_RANK()
CTE + Window Function
Top 1 / Top 2
Highest / Lowest salary





Exactly — ROW_NUMBER() mein SQL ko ek ordering rule chahiye hota hai. Sirf salary same hai toh database ke paas naturally koi reason nahi hota ki pehle employee ko 1 aur doosre ko 2 kyun de.

Example
SELECT
    name,
    salary,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employees_table;

Agar:

Aman   50000
Ankit  50000
Sara   40000

Toh Aman ko 1 aur Ankit ko 2 milna guaranteed nahi hai. Database kisi bhi order mein un dono ko number de sakta hai.

Agar tum fixed/consistent order chahte ho 👇

Salary ke baad emp_id ko tie-breaker bana do:

SELECT
    name,
    salary,
    ROW_NUMBER() OVER(
        ORDER BY salary DESC, emp_id ASC
    ) AS row_num
FROM employees_table;

Ab:

Aman   50000   emp_id 101 → 1
Ankit  50000   emp_id 111 → 2
Sara   40000   emp_id 103 → 3

Because:

salary DESC → higher salary first
emp_id ASC  → same salary mein smaller emp_id first
🧠 Bas itna yaad rakho

ROW_NUMBER() khud decide nahi karta ki same salary mein kaun 1 aur kaun 2 hoga.

Jo columns tum ORDER BY mein doge, unhi ke basis par order decide hoga.

ROW_NUMBER() OVER(
    ORDER BY salary DESC, emp_id ASC
)

👉 Salary = primary ordering
👉 emp_id = tie-breaker
