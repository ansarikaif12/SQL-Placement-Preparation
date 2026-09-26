Next: INTERSECT

Basic meaning:

Dono queries mein jo common rows hain, sirf woh return karo.

Example:

SELECT city
FROM employees_table
WHERE department = 'IT'

INTERSECT

SELECT city
FROM employees_table
WHERE department = 'Sales';

Ye dono result sets mein common cities return karega.

⚠️ MySQL mein INTERSECT support/version behavior ko hum basic theory ke roop mein rakhenge; placement ke liye concept samajhna enough hai.

Tiny question 👇

Agar:

Query 1 → Delhi, Noida, Mumbai
Query 2 → Mumbai, Delhi, Pune

INTERSECT kya return karega?

A) Delhi, Mumbai
B) Noida, Pune
C) Delhi, Noida, Mumbai, Pune

👉 A / B / C


✅ Correct! A — Delhi, Mumbai 🔥

INTERSECT = dono result sets mein common rows.

Query 1 → Delhi, Noida, Mumbai
Query 2 → Mumbai, Delhi, Pune

INTERSECT → Delhi, Mumbai