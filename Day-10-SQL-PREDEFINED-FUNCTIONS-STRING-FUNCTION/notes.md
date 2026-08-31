<!-- Function 1 : UPPER()
📌 Interview Definition

UPPER() converts all alphabetic characters of a string into uppercase.

Simple Hindi:

Kisi bhi string ke saare lowercase letters ko uppercase me convert karta hai.

Syntax
UPPER(column_name)

ya

UPPER('kaif')
Example 1
SELECT UPPER('kaif');

Output

KAIF
Example 2
SELECT name,
       UPPER(name)
FROM Employee;

Output

name	UPPER(name)
Aman	AMAN
Kaif	KAIF
Sara	SARA
Important Interview Points
Q1. Kya original data change hota hai?

❌ Nahi.

SELECT UPPER(name)
FROM Employee;

Sirf output change hota hai.

Table ka data same rehta hai.

Agar permanently uppercase karna ho:

UPDATE Employee
SET name = UPPER(name);
Q2. Numbers par kya effect hota hai?
SELECT UPPER('abc123');

Output

ABC123

Numbers same rehte hain.

Q3. Special Characters?
SELECT UPPER('kaif@123');

Output

KAIF@123

Special characters bhi same rehte hain.

Q4. NULL?
SELECT UPPER(NULL);

Output

NULL
Q5. Empty String?
SELECT UPPER('');

Output

''
Real Life Use

Suppose database me data aisa hai:

Kaif
kaif
KAIF
KaIf

Agar compare karna ho:

SELECT *
FROM Employee
WHERE UPPER(name)='KAIF';

Isse sabhi variations match ho jayenge.

LOWER()

Bilkul opposite.

SELECT LOWER('KaIf');

Output

kaif
UPPER vs LOWER
Function	Result
UPPER('Kaif')	KAIF
LOWER('Kaif')	kaif
Placement Interview Questions
Q1

Output?

SELECT UPPER('SQL Interview');
Q2

Output?

SELECT LOWER('ChatGPT123');
Q3

Output?

SELECT UPPER('abc@123');
Q4

Output?

SELECT LOWER(NULL);

 -->


============================


<!-- 
🧠 Placement Notes
1. Kya UPPER() aur LOWER() original data change karte hain?

❌ Nahi.

Ye sirf result ko convert karte hain.

2. Kya ye WHERE me use ho sakte hain?

✅ Haan.

SELECT *
FROM employee
WHERE UPPER(name)='AMAN';
3. Kya ye ORDER BY me use ho sakte hain?

✅ Haan.

SELECT name
FROM employee
ORDER BY UPPER(name);
4. Kya ye GROUP BY me use ho sakte hain?

✅ Haan.

SELECT UPPER(department),
       COUNT(*)
FROM employee
GROUP BY UPPER(department); -->

==============================

<!-- 
Q1 ✅
SELECT UPPER('Kaif123');

Your Answer:

KAIF123

✔ Correct

Q2 ✅
SELECT LOWER('SQL@2026');

Your Answer:

sql@2026

✔ Correct

Q3 ✅
SELECT UPPER(NULL);

Your Answer:

NULL

✔ Correct

Q4 ❌ (Small Mistake)
SELECT LOWER('');

Tumne likha:

null
Correct Answer:
''

Yaani empty string.

Difference samjho:

Value	Meaning
NULL	Unknown value
''	Empty string (value hai, bas length 0 hai)

Ye interview me bahut poocha jata hai.

Example:

SELECT LENGTH('');

Output:

0

Lekin

SELECT LENGTH(NULL);

Output:

NULL

👉 NULL aur empty string kabhi same nahi hote.

Q5 ✅

Statement:

UPPER() permanently table ka data uppercase kar deta hai.

Tumne answer diya:

No

✔ Bilkul sahi.

Sirf UPDATE statement hi permanently data change karta hai. -->



===============================================


<!-- 
Function 3 : LENGTH()
📌 Interview Definition

LENGTH() returns the length of a string.

Simple Hindi:

String me kitne characters/bytes hain, wo return karta hai.

Syntax
LENGTH(string)

Ya

LENGTH(column_name)
Example 1
SELECT LENGTH('Kaif');

Output

4
Example 2
SELECT name,
       LENGTH(name)
FROM Employee;

Output

name	LENGTH(name)
Aman	4
Kaif	4
Sara	4
Arjun	5
Real Life Example

Agar username ki minimum length check karni ho:

SELECT *
FROM Employee
WHERE LENGTH(name) >= 5;

Output

name
Arjun
Rahul
Important Interview Questions
Q1. LENGTH(NULL)
SELECT LENGTH(NULL);

Output

NULL
Q2. LENGTH('')
SELECT LENGTH('');

Output

0
Q3. Spaces count hote hain?
SELECT LENGTH('Kaif ');

Output

5

👉 Space bhi count hota hai.

Q4.
SELECT LENGTH('Ka if');

Output

5
Function 4 : CHAR_LENGTH()
Definition

CHAR_LENGTH() returns the number of characters in a string.

Syntax

CHAR_LENGTH(string)

Example

SELECT CHAR_LENGTH('Kaif');

Output

4
LENGTH() vs CHAR_LENGTH()

Ye sabse important interview question hai.

English Text
SELECT LENGTH('Kaif');
SELECT CHAR_LENGTH('Kaif');

Output

4
4

Koi difference nahi.

Hindi Text
SELECT LENGTH('भारत');
SELECT CHAR_LENGTH('भारत');

Typical MySQL UTF-8 result:

Function	Output
LENGTH('भारत')	15
CHAR_LENGTH('भारत')	5
Kyu?
LENGTH() bytes count karta hai.
CHAR_LENGTH() characters count karta hai.

Hindi aur emoji jaise Unicode characters ek se zyada bytes le sakte hain.

Emoji Example
SELECT LENGTH('😊');
SELECT CHAR_LENGTH('😊');

Typical UTF-8 output:

Function	Output
LENGTH('😊')	4
CHAR_LENGTH('😊')	1
Interview Shortcut

Yaad rakhna:

LENGTH()      → Bytes
CHAR_LENGTH() → Characters

English strings me dono same result dete hain.

Unicode strings (Hindi, Emoji) me difference aa sakta hai.

Placement Tips
Q. Find employees whose name has exactly 4 characters.
SELECT *
FROM Employee
WHERE LENGTH(name)=4;
Q. Find employees whose name has more than 4 characters.
SELECT *
FROM Employee
WHERE LENGTH(name)>4;
Q. Display employee name along with its length.
SELECT name,
       LENGTH(name) AS total_characters
FROM Employee; -->


=================================================

<!-- 
Q1 ❌
SELECT LENGTH('SQL');

Tumhara Answer:

sql

👉 Dhyan do, LENGTH() string ko convert nahi karta, uski length return karta hai.

✅ Correct Answer:

3
Q2 ❌
SELECT LENGTH('');

Tumhara Answer:

''

✅ Correct Answer:

0

Reason:

Empty string ki length 0 hoti hai.
Q3 ✅
SELECT LENGTH(NULL);

Tumhara Answer:

NULL

✔ Bilkul sahi. -->


<!-- 
Q4 ✅

Difference between LENGTH() and CHAR_LENGTH()

Tumhara Answer:

LENGTH() in bytes, CHAR_LENGTH() in characters.

✔ 100% Correct.

Q5 (Thoda aur complete answer)

Question:

Agar string Hindi ya Emoji me ho, to kaunsa function use karoge aur kyun?

Expected Interview Answer:

CHAR_LENGTH() use karenge, kyunki hume actual visible characters count karne hote hain. LENGTH() bytes count karta hai, isliye Unicode (Hindi, Emoji) me uska result alag aa sakta hai.

Example
SELECT LENGTH('😊');       -- 4 (bytes)
SELECT CHAR_LENGTH('😊');  -- 1 (character)
SELECT LENGTH('भारत');       -- 12 (bytes)
SELECT CHAR_LENGTH('भारत');  -- 4 (characters) -->

==============================================
<!-- 
Function 5 : CONCAT()
📌 Interview Definition

CONCAT() joins two or more strings into a single string.

Simple Hindi:

Multiple strings ya columns ko ek string me combine karta hai.

Syntax
CONCAT(string1, string2, string3, ...)

Ya

CONCAT(column1, column2)
Example 1
SELECT CONCAT('Kaif','Ansari');

Output

KaifAnsari

Dhyan do!

Beech me space nahi aaya.

Example 2

Space dena ho:

SELECT CONCAT('Kaif',' ','Ansari');

Output

Kaif Ansari
Example 3

Employee table

name	city
Aman	Delhi
Kaif	Noida
SELECT CONCAT(name,' lives in ',city)
FROM employee;

Output

CONCAT(...)
Aman lives in Delhi
Kaif lives in Noida
Example 4
SELECT name,
       CONCAT('Mr. ',name)
FROM employee;

Output

name	CONCAT(...)
Aman	Mr. Aman
Kaif	Mr. Kaif
Example 5

Salary message

SELECT CONCAT(name,' earns ',salary)
FROM employee;

Output

Aman earns 50000
Kaif earns 35000

👉 Number automatically string me convert ho jata hai.

Important Interview Questions
Q1. Kya CONCAT sirf strings ko join karta hai?

❌ Nahi.

SELECT CONCAT('Salary : ',50000);

Output

Salary : 50000

Number bhi automatically string ban jata hai.

Q2. Agar ek argument NULL ho?
SELECT CONCAT('Kaif',NULL);

Output

NULL

⚠️ MySQL me CONCAT() ka koi bhi argument NULL ho to pura result NULL hota hai.

Ye bahut famous interview question hai.

Q3.
SELECT CONCAT(NULL,NULL);

Output

NULL
Q4.
SELECT CONCAT();

❌ Error

Kam se kam ek argument hona chahiye.

CONCAT vs +

Java/C++ me:

"A" + "B"

SQL me:

CONCAT('A','B')
Real Project Example

Invoice banana ho:

SELECT CONCAT(
'Employee : ',
name,
' | Department : ',
department
)
FROM employee;

Output

Employee : Kaif | Department : HR -->

<!-- 
Tip 2: CONCAT() aur NULL

Ye bahut famous interview question hai.

SELECT CONCAT('A','B');

Output:

AB

Lekin

SELECT CONCAT('A',NULL,'B');

Output:

NULL

👉 Ek bhi argument NULL hua to MySQL me pura result NULL ho jata hai.

Isi problem ko solve karne ke liye next function aata hai: -->



================================

<!-- 
🚀 Next Topic: CONCAT_WS()

WS = With Separator

Ye CONCAT() ka advanced version hai.

Interview Definition

CONCAT_WS() joins multiple strings using a common separator.

Simple Hindi:

Agar sabhi values ke beech same separator lagana ho (-, |, ,, etc.), to CONCAT_WS() use karte hain.

Syntax
CONCAT_WS(separator, string1, string2, string3, ...)
Example 1
SELECT CONCAT_WS('-', 'Aman', 'IT', 'Delhi');

Output

Aman-IT-Delhi
Example 2
SELECT CONCAT_WS(' | ', name, department, city)
FROM employee;

Output

Result
Aman | IT | Delhi
Kaif | HR | Noida
Example 3

Comma separator

SELECT CONCAT_WS(', ', name, department, city)
FROM employee;

Output

Aman, IT, Delhi
Kaif, HR, Noida
⭐ Biggest Difference from CONCAT()

Suppose:

name	department	city
Aman	IT	NULL
CONCAT()
SELECT CONCAT(name,' | ',department,' | ',city)
FROM employee;

Output

NULL

❌ Ek bhi NULL aaya to pura result NULL.

CONCAT_WS()
SELECT CONCAT_WS(' | ',name,department,city)
FROM employee;

Output

Aman | IT

✅ NULL value ko ignore kar diya.

Interview Questions
Q1

Output?

SELECT CONCAT_WS('-', 'A', 'B', 'C');
Q2

Output?

SELECT CONCAT_WS('-', 'A', NULL, 'C');
Q3

Output?

SELECT CONCAT_WS(',', 'SQL', 'MySQL', 'Oracle');
Q4

True or False?

CONCAT_WS() ignores NULL values.

Q5

Difference between CONCAT() and CONCAT_WS()? -->

<!-- 

🎯 Interview Questions

Ab bina SQL run kiye answer do.

Q1
SELECT CONCAT_WS('-', 'A', 'B', 'C');
Q2
SELECT CONCAT_WS('-', 'A', NULL, 'C');
Q3
SELECT CONCAT('A', NULL, 'C');
Q4

Kaunsa function NULL values ko ignore karta hai?

CONCAT()
CONCAT_WS()
Q5

Kab use karoge?

Aman works in IT

CONCAT() ya CONCAT_WS()?

📌 Interview Shortcut (Yaad Rakhna)
Function	Kab Use Karen?
CONCAT()	Jab custom sentence banana ho. Example: "Aman works in IT"
CONCAT_WS()	Jab same separator baar-baar use ho. Example: "Aman | IT | Delhi"
CONCAT()	Agar ek argument NULL hua → Pura result NULL
CONCAT_WS()	NULL values ko ignore karta hai -->








=======================================




<!-- 🚀 Function 6: SUBSTRING() / SUBSTR()

⭐⭐⭐⭐⭐ Placement Importance: Very High

Interview Definition:

SUBSTRING() is used to extract a part of a string.

Simple Hindi:

String ka koi bhi chhota part nikalna ho to SUBSTRING() use karte hain.

Syntax 1 (Most Common)
SUBSTRING(string, start_position)

Yeh start_position se lekar end tak sab return karega.

Example
SELECT SUBSTRING('Kaif',2);

Output

aif

Kyun?

K  a  i  f
1  2  3  4

Position 2 se start hua.

Syntax 2
SUBSTRING(string, start_position, length)

Yahan tum bataoge:

Kahan se start karna hai
Kitne characters chahiye
Example
SELECT SUBSTRING('Kaif',2,2);

Output

ai
K  a  i  f
1  2  3  4

Position 2 se 2 characters.

Example 1
SELECT SUBSTRING('Database',1,4);

Output

Data
Example 2
SELECT SUBSTRING('Database',5);

Output

base
Example 3

Employee table:

SELECT name,
       SUBSTRING(name,1,2)
FROM employee;

Output

name	Result
Aman	Am
Kaif	Ka
Rahul	Ra
Position Counting
D  a  t  a  b  a  s  e
1  2  3  4  5  6  7  8

SQL indexing starts from 1, not 0.

⚠️ Very important interview point.

Negative Position ⭐⭐⭐⭐⭐

MySQL me negative index bhi use kar sakte ho.

SELECT SUBSTRING('Kaif',-2);

Output

if

Explanation:

K  a  i  f
      ↑  ↑
     -2 -1

Negative means end se counting.

Aur:

SELECT SUBSTRING('Database',-4);

Output

base
Another Example
SELECT SUBSTRING('Database',-4,2);

Output

ba
Interview Edge Cases
Q1
SELECT SUBSTRING('Kaif',1,10);

Output?

👉

Kaif

Error nahi aayega.

Q2
SELECT SUBSTRING('Kaif',10);

Output?

👉

''

Empty string.

Q3
SELECT SUBSTRING(NULL,1,2);

Output?

👉

NULL
Q4
SELECT SUBSTRING('Kaif',0,2);

MySQL me result:

''

⚠️ Kyunki indexing 1 se start hoti hai.

Real Project Examples
Mobile Number
9876543210

Last 4 digits:

SELECT SUBSTRING('9876543210',-4);

Output

3210
PAN Number
ABCDE1234F

First 5 letters:

SELECT SUBSTRING('ABCDE1234F',1,5);

Output

ABCDE
Email
kaif@gmail.com

First 4 characters:

SELECT SUBSTRING('kaif@gmail.com',1,4);

Output

kaif -->
<!-- 

Placement Tips

Yaad rakhna ye 3 rules:

Index starts from 1, not 0.
Negative index → end se counting.
Agar requested length string se zyada ho, to error nahi aata, jitna available hota hai utna return hota hai. -->
<!-- 
Placement Interview

Agar interviewer pooche:

Difference between SUBSTRING() and SUBSTR()?

Best answer:

There is no difference in MySQL. SUBSTR() is simply an alias of SUBSTRING(). Both have the same syntax and produce the same output.

Fir kaunsa use karna chahiye?

Main recommend karunga SUBSTRING().

Kyun?

✅ Ye zyada descriptive hai.
✅ Most companies aur documentation me isi ka use hota hai.
✅ Readability better hoti hai.

SUBSTR() bhi bilkul valid hai, lekin placement aur production code me SUBSTRING() likhne ki aadat banao.

🎯 Ek aur interview fact

MySQL me ek aur syntax bhi valid hai:

SELECT SUBSTRING('Database' FROM 1 FOR 4);

Output:

Data

Lekin ye syntax interviews aur real projects me bahut kam use hota hai.

Tum hamesha ye wala use karna:

SELECT SUBSTRING('Database',1,4);

Ye sabse common aur interviewer-friendly syntax hai. 🚀 -->


===============================================================

<!-- 
🚀 LEFT() and RIGHT()

⭐⭐⭐⭐☆ Placement Importance: High

Ye dono SUBSTRING() ke shortcut functions hain.

1. LEFT()
Definition

String ke left (starting) side se specified number of characters return karta hai.

Syntax
LEFT(string, number_of_characters)
Example
SELECT LEFT('Kaif',2);

Output

Ka
SELECT LEFT('Database',4);

Output

Data
Equivalent of SUBSTRING()

Ye dono same hain:

SELECT LEFT(name,3)
FROM employee;
SELECT SUBSTRING(name,1,3)
FROM employee;
2. RIGHT()
Definition

String ke right (ending) side se specified number of characters return karta hai.

Syntax
RIGHT(string, number_of_characters)
Example
SELECT RIGHT('Kaif',2);

Output

if
SELECT RIGHT('Database',4);

Output

base
Equivalent of SUBSTRING()

Ye dono same hain:

SELECT RIGHT(name,3)
FROM employee;
SELECT SUBSTRING(name,-3)
FROM employee;
LEFT vs RIGHT vs SUBSTRING
Function	Meaning	Equivalent
LEFT(str,n)	First n characters	SUBSTRING(str,1,n)
RIGHT(str,n)	Last n characters	SUBSTRING(str,-n)
SUBSTRING(str,start,len)	Kisi bhi position se	Most flexible
Edge Cases
Q1
SELECT LEFT('Kaif',10);

Output

Kaif
Q2
SELECT RIGHT('Kaif',10);

Output

Kaif
Q3
SELECT LEFT('Kaif',0);

Output

''
Q4
SELECT RIGHT('Kaif',0);

Output

''
Q5
SELECT LEFT(NULL,2);

Output

NULL
Q6
SELECT RIGHT(NULL,2);

Output

NULL
Real Project Examples
Employee initials
SELECT LEFT(name,1)
FROM employee;
Mobile number ke last 4 digits
SELECT RIGHT('9876543210',4);

Output

3210
PAN ka first 5 letters
SELECT LEFT('ABCDE1234F',5);

Output

ABCDE
PAN ka last character
SELECT RIGHT('ABCDE1234F',1);

Output

F -->



======================================


<!-- 🚀 Function 9: TRIM(), LTRIM(), RTRIM()

⭐⭐⭐⭐☆ Placement Importance: High

Ye functions string ke extra spaces remove karte hain.

1. TRIM()
Definition

String ke left aur right dono side ke extra spaces remove karta hai.

Syntax
TRIM(string)
Example
SELECT TRIM('   Kaif   ');

Output

Kaif
Example
SELECT TRIM('    SQL');

Output

SQL
Example
SELECT TRIM('MySQL     ');

Output

MySQL
Important Point
SELECT TRIM('  Kaif Ansari  ');

Output

Kaif Ansari

👉 Beech ke spaces remove nahi honge.

Sirf starting aur ending ke spaces remove honge.

Example
SELECT TRIM('Kaif    Ansari');

Output

Kaif    Ansari

Middle ke 4 spaces waise hi rahenge.

2. LTRIM()
Definition

Sirf left side (starting) ke spaces remove karta hai.

Syntax
LTRIM(string)
Example
SELECT LTRIM('   Kaif   ');

Output

Kaif   

Left ke spaces remove hue.

Right wale abhi bhi hain.

3. RTRIM()
Definition

Sirf right side (ending) ke spaces remove karta hai.

Syntax
RTRIM(string)
Example
SELECT RTRIM('   Kaif   ');

Output

   Kaif

Right ke spaces remove hue.

Left wale abhi bhi hain.

Visual Understanding

Suppose string hai:

"___Kaif___"

(_ = space)

TRIM()
Kaif
LTRIM()
Kaif___
RTRIM()
___Kaif
Real Project Example

Database me data aaya:

"   Aman   "

Search fail ho sakti hai.

Before saving:

UPDATE employee
SET name = TRIM(name);

Ab name clean ho jayega.

Edge Cases
Q1
SELECT TRIM('');

Output?

''
Q2
SELECT TRIM(NULL);

Output?

NULL
Q3
SELECT TRIM('Kaif');

Output?

Kaif

Already clean hai.

Interview Question ⭐⭐⭐⭐⭐

Difference?

Function	Removes
TRIM()	Left + Right spaces
LTRIM()	Left spaces only
RTRIM()	Right spaces only -->
<!-- 
🎯 Placement Tip

Interview me agar pooche:

"What's the difference between TRIM(), LTRIM(), and RTRIM()?"

Short answer:

TRIM() → Left + Right spaces remove karta hai.
LTRIM() → Sirf left spaces remove karta hai.
RTRIM() → Sirf right spaces remove karta hai. -->



==============================



<!-- Function 10: REPLACE()
Definition

REPLACE() string ke andar kisi old text ko new text se replace karta hai.

Simple Hindi:

Agar string ke andar koi word ya character badalna ho, to REPLACE() use karte hain.

Syntax
REPLACE(string, old_text, new_text)
Example 1
SELECT REPLACE('I Love Java','Java','SQL');
Output
I Love SQL
Example 2
SELECT REPLACE('Kaif Ansari','Ansari','Khan');
Output
Kaif Khan
Employee Table Example

Department me IT ki jagah Information Technology dikhana hai.

SELECT name,
       REPLACE(department,'IT','Information Technology')
FROM employee;

Output

Name	Department
Aman	Information Technology
Sara	Information Technology
Rahul	Information Technology

⚠️ Database update nahi hoga.
Sirf output change hoga.

Multiple Occurrences
SELECT REPLACE('SQL SQL SQL','SQL','MySQL');

Output

MySQL MySQL MySQL

👉 Sabhi occurrences replace hongi.

Character Replace
SELECT REPLACE('987-654-3210','-','');

Output

9876543210
Space Remove
SELECT REPLACE('Kaif Ansari',' ','');

Output

KaifAnsari
Case Sensitive ⭐⭐⭐
SELECT REPLACE('SQL sql Sql','SQL','Java');

Output

Java sql Sql

Sirf exact "SQL" replace hua.

sql aur Sql same nahi maane jayenge.

NULL Handling
SELECT REPLACE(NULL,'A','B');

Output

NULL
Word Not Found
SELECT REPLACE('Database','Python','Java');

Output

Database

Kuch replace hi nahi hua.

Empty String
SELECT REPLACE('Kaif','','A');

Output

Kaif

Empty string search karne se generally koi replacement nahi hota.

Real Project Examples
Change email domain
SELECT REPLACE('kaif@gmail.com',
               'gmail.com',
               'company.com');

Output

kaif@company.com
Remove Hyphen
SELECT REPLACE('ABC-123-XYZ',
               '-',
               '');

Output

ABC123XYZ
Replace Spaces with Underscore
SELECT REPLACE('Kaif Ansari',
               ' ',
               '_');

Output

Kaif_Ansari
Difference Between REPLACE() and UPDATE
SELECT REPLACE(name,'A','X')
FROM employee;

✔ Sirf output change.

UPDATE employee
SET name = REPLACE(name,'A','X');

✔ Database permanently update ho jayega. -->
<!-- 
📌 Interview Shortcut
Function	Purpose
TRIM()	Remove spaces from left & right
LEFT()	First n characters
RIGHT()	Last n characters
SUBSTRING()	Extract from any position
REPLACE()	Replace one text with another -->



=====================================


<!-- 
🚀 Function 11: REVERSE()

⭐⭐⭐⭐☆ Placement Importance: Medium-High

Ye function string ko ulta (reverse) kar deta hai.

Definition

REVERSE() string ke saare characters ka order reverse kar deta hai.

Simple Hindi:

Jo string hai usko ulta kar deta hai.

Syntax
REVERSE(string)
Example 1
SELECT REVERSE('Kaif');

Output

fiaK
Example 2
SELECT REVERSE('Database');

Output

esabataD
Employee Table Example
SELECT name,
       REVERSE(name)
FROM employee;

Output

Name	Reverse
Aman	namA
Kaif	fiaK
Sara	araS
Numbers
SELECT REVERSE('12345');

Output

54321
Mixed String
SELECT REVERSE('SQL123');

Output

321LQS
Spaces
SELECT REVERSE('Kaif Ansari');

Output

irasnA fiaK

Space bhi reverse position me chala jayega.

NULL Handling
SELECT REVERSE(NULL);

Output

NULL
Empty String
SELECT REVERSE('');

Output

''
Palindrome Check (Interview)
SELECT name,
       REVERSE(name)
FROM employee;

Agar

name == REVERSE(name)

To string palindrome hai.

Example:

madam

Reverse bhi

madam
Real Project Example

Password ya sensitive data ko secure karne ke liye REVERSE() use nahi kiya jata.

⚠️ Interview Point:

REVERSE() encryption nahi hai.

Ye sirf characters ka order ulta karta hai. -->



============================================



<!-- 🚀 Function 12: INSTR()

⭐⭐⭐⭐⭐ Placement Importance: High

Definition

INSTR() kisi string ke andar kisi character ya substring ki first occurrence ki position return karta hai.

Simple Hindi:

Kisi word ya character ka position batata hai.

Syntax
INSTR(string, substring)
Example 1
SELECT INSTR('Database','base');

Output

5

Explanation

D  a  t  a  b  a  s  e
1  2  3  4  5  6  7  8
            ↑
Example 2
SELECT INSTR('Kaif Ansari','Ansari');

Output

6
Example 3
SELECT INSTR('kaif@gmail.com','@');

Output

5
Character Search
SELECT INSTR('Database','a');

Output

2

⚠️ Sirf first occurrence ki position return hoti hai.

Substring Not Found
SELECT INSTR('Database','Java');

Output

0
NULL Handling
SELECT INSTR(NULL,'a');

Output

NULL
Empty String
SELECT INSTR('','a');

Output

0
🚀 Function 13: LOCATE()

LOCATE() bhi almost same kaam karta hai.

Syntax
LOCATE(substring, string)

Dhyan do!

INSTR()

INSTR(string, substring)

LOCATE()

LOCATE(substring, string)

👉 Argument order ulta hai.

Example
SELECT LOCATE('base','Database');

Output

5
SELECT LOCATE('@','kaif@gmail.com');

Output

5
⭐ Extra Power of LOCATE()

Ye third argument bhi leta hai.

Syntax

LOCATE(substring, string, start_position)

Example

SELECT LOCATE('a','Database',3);

Output

4

Explanation

D  a  t  a  b  a  s  e
1  2  3  4  5  6  7  8

Search position 3 se start hui.

Isliye answer 4.

INSTR() vs LOCATE()
Feature	INSTR()	LOCATE()
Find position	✅	✅
Returns first occurrence	✅	✅
Returns 0 if not found	✅	✅
Third parameter (start position)	❌	✅
More flexible	❌	✅
Employee Examples
INSTR()
SELECT name,
       INSTR(name,'a')
FROM employee;
LOCATE()
SELECT city,
       LOCATE('o',city)
FROM employee; -->
<!-- 
⭐ Interview Trick

Suppose interviewer asks:

SELECT LOCATE('a','Banana');

Output?

2

Not

4

Not

6

👉 Kyunki INSTR() aur LOCATE() hamesha first occurrence return karte hain.

⭐ Another Interview Trick
SELECT LOCATE('a','Banana',3);

Output?

4

Yahan search 3rd position se start hui.

Ye question companies ka favorite hai. -->



=============================================


<!-- 🚀 Function 14: ASCII()

⭐⭐⭐⭐☆ Placement Importance: Medium

Definition

ASCII() kisi string ke first character ka ASCII value return karta hai.

Simple Hindi:

Pehle character ka numeric (ASCII) value return karta hai.

Syntax
ASCII(string)
Example 1
SELECT ASCII('A');

Output

65
Example 2
SELECT ASCII('a');

Output

97
Example 3
SELECT ASCII('Kaif');

Output

75

Kyun?

Pehla character K hai.

ASCII of K = 75

Numbers
SELECT ASCII('1');

Output

49

⚠️ Ye number 1 nahi hai.

Ye character '1' ka ASCII value hai.

Empty String
SELECT ASCII('');

Output

0
NULL
SELECT ASCII(NULL);

Output

NULL
🚀 Function 15: CHAR()

CHAR() ASCII value se character banata hai.

Syntax
CHAR(number)
Example 1
SELECT CHAR(65);

Output

A
Example 2
SELECT CHAR(97);

Output

a
Example 3
SELECT CHAR(75);

Output

K
Multiple Characters
SELECT CHAR(72,69,76,76,79);

Output

HELLO
ASCII() vs CHAR()
ASCII()	CHAR()
Character ➜ Number	Number ➜ Character
ASCII('A') = 65	CHAR(65) = 'A'
Takes string	Takes integer
Employee Example
SELECT name,
       ASCII(name)
FROM employee;

Output

Name	ASCII
Aman	65
Kaif	75
Sara	83
Real Project Example

Sort employees by first letter code.

SELECT name,
       ASCII(name)
FROM employee;
Interview Tricks ⭐⭐⭐⭐
Q1
SELECT ASCII('ABC');

Output?

65

Sirf first character dekha jayega.

Q2
SELECT CHAR(65,66,67);

Output?

ABC
Q3
SELECT ASCII(' ');

Output?

32

Space ka bhi ASCII value hota hai. -->