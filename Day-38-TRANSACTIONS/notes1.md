Transactions mein flow rahega:

Basic concept
COMMIT
ROLLBACK
SAVEPOINT
Small practice questions
Query-writing practice
Placement-style questions

Aur jaise abhi kiya, pehle tum query/answer doge, phir main check karunga.

Chalo start karte hain. 👇

Transactions — Step 1

Transaction = SQL operations ka ek group jo ek unit ki tarah execute hota hai.

Example:

START TRANSACTION;

UPDATE employees_table
SET salary = salary + 5000
WHERE emp_id = 101;

COMMIT;

COMMIT ka basic meaning:

Changes ko permanently save karna.



Transactions — Step 2: ROLLBACK

ROLLBACK ka use hota hai changes ko undo karne ke liye, agar abhi tak COMMIT nahi kiya hai.

Example:

START TRANSACTION;

UPDATE employees_table
SET salary = salary + 5000
WHERE emp_id = 101;

ROLLBACK;

👉 Salary increase undo ho jayega.

Yaad rakho:
COMMIT → changes save
ROLLBACK → changes undo
Interview Question 🔥



Transactions — Step 3: SAVEPOINT

SAVEPOINT ka use transaction ke beech mein ek checkpoint banane ke liye hota hai.

Example:

START TRANSACTION;

UPDATE employees_table
SET salary = salary + 5000
WHERE emp_id = 101;

SAVEPOINT sp1;

UPDATE employees_table
SET salary = salary + 3000
WHERE emp_id = 102;

ROLLBACK TO sp1;

COMMIT;

Yahan:

Employee 101 ka change → rahega
Employee 102 ka change → undo hoga
COMMIT → remaining changes save honge
Simple yaad rakho:
COMMIT → Save all
ROLLBACK → Undo transaction changes
SAVEPOINT → Checkpoint



🔥 Interview Question

Agar transaction mein 3 updates hain aur tum sirf second update ko undo karna chahte ho, first update ko nahi, toh kya use karoge?

A) COMMIT
B) ROLLBACK
C) SAVEPOINT + ROLLBACK TO SAVEPOINT



Correct! C) SAVEPOINT + ROLLBACK TO SAVEPOINT 🔥

Exactly.

Transactions — Quick Revision
START TRANSACTION → Transaction start
SAVEPOINT         → Checkpoint
ROLLBACK TO       → Checkpoint tak undo
ROLLBACK          → Transaction changes undo
COMMIT            → Changes permanently save