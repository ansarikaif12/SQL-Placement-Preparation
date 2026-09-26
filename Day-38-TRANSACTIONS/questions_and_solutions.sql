-- Write the SQL query for this:

-- Transaction start karo → emp_id = 101 ki salary ₹5,000 increase karo → SAVEPOINT sp1 banao → emp_id = 102 ki salary ₹3,000 increase karo → sirf second update ko undo karo → finally changes COMMIT karo.


start Transaction;

update employees_table
set salary=salary+5000
where emp_id=101;

SAVEPOINT sp1;

update employees_table
set salary=salary+3000
where emp_id=102;

rollback to sp1;

COMMIT;



Result:
emp_id = 101 → +₹5,000 ✅
emp_id = 102 → +₹3,000 undo ✅
Final COMMIT → first change saved ✅

One small syntax note: MySQL accepts START TRANSACTION; your capitalization doesn't matter.

Next tiny concept: SAVEPOINT vs ROLLBACK

Suppose:



Next tiny concept: SAVEPOINT vs ROLLBACK

Suppose:

START TRANSACTION;

UPDATE employees_table
SET salary = salary + 5000
WHERE emp_id = 101;

SAVEPOINT sp1;

UPDATE employees_table
SET salary = salary + 3000
WHERE emp_id = 102;

ROLLBACK;

❓Yahan emp_id = 101 ka change kya hoga?

A) Save rahega
B) Undo ho jayega




❌ Not quite — correct answer is B) Undo ho jayega.

Because:

ROLLBACK;

poori current transaction ke uncommitted changes undo kar deta hai.

So:

emp_id = 101 → +5000 ❌ Undo
emp_id = 102 → +3000 ❌ Undo

SAVEPOINT sp1 banaya tha, but humne ROLLBACK TO sp1 nahi kiya. Humne direct ROLLBACK kiya, jo entire transaction ko undo karta hai.

Yaad rakho 🔥
ROLLBACK              → sab undo
ROLLBACK TO sp1       → sp1 ke baad wale changes undo
COMMIT                → changes save

Next question:

Agar humein emp_id = 101 ka change rakhna hai aur emp_id = 102 ka change undo karna hai, toh kya use karenge?

A) ROLLBACK
B) ROLLBACK TO sp1
C) COMMIT


✅ Correct! B) ROLLBACK TO sp1 🔥

Exactly.

ROLLBACK TO sp1
→ sp1 ke baad ke changes undo
→ sp1 se pehle ke changes remain

So in our example:

emp_id = 101 → +5000 remains ✅
emp_id = 102 → +3000 undone ❌
Then COMMIT → remaining change save ✅
Transactions chapter — basic concepts done! 🎯

Final interview recap:

START TRANSACTION → transaction start
COMMIT            → changes save
ROLLBACK          → all uncommitted changes undo
SAVEPOINT         → checkpoint
ROLLBACK TO       → checkpoint ke baad ke changes undo