Last Set Operation: EXCEPT

Basic meaning:

First query mein jo hai, but second query mein nahi hai.

Example:

Query 1 → Delhi, Noida, Mumbai
Query 2 → Mumbai, Delhi, Pune

EXCEPT → Noida

Simple:

UNION      → dono ko combine
UNION ALL  → dono ko combine + duplicates keep
INTERSECT  → common
EXCEPT     → first mein hai, second mein nahi

⚠️ MySQL mein EXCEPT ko bhi basic theory ke roop mein rakhenge; placement ke liye concept enough hai.

Tiny question 👇

Agar:

Query 1 → A, B, C, D
Query 2 → C, D, E

EXCEPT ka result kya hoga?

A) C, D
B) A, B
C) A, B, C, D, E

👉 A / B / C

✅ Correct! B — A, B 🔥

Because EXCEPT means:

First query ke results mein se woh rows rakho jo second query mein nahi hain.

Query 1 → A, B, C, D
Query 2 → C, D, E

EXCEPT → A, B
🎯 Set Operations complete!
UNION       → Combine + duplicates remove
UNION ALL   → Combine + duplicates keep
INTERSECT   → Common rows
EXCEPT      → First mein hai, second mein nahi