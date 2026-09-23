WITH hr_employees AS (
    SELECT emp_id, name, salary
    FROM employees_table
    WHERE department = 'HR'
)
SELECT *
FROM hr_employees;

select * from employees_table;


Question 1:

employees_table se ek CTE banao jisme IT department ke employees ho.

Sirf ye columns chahiye:

emp_id
name
salary

Phir CTE se result display karo.


WITH it_employees AS (
    SELECT emp_id, name, salary
    FROM employees_table
    WHERE department = 'IT'
)
SELECT *
FROM hr_employees;



Question 2 🔥

Ab CTE mein IT employees nikalo jinki salary 60000 se greater hai.

Expected columns:

emp_id
name
salary


with it_empl as(
    select emp_id, name, salary
    from employees_table
    where department = 'IT'
    and salary>60000
)
select * from it_empl;


Next Question 3

CTE ka use karke har department ka average salary nikalo.

Expected output:

department | avg_salary

👉 Query khud likho.


with avg_salary as (
    select department, avg(salary) as avg_salary
    from employees_table
    group by department
)
select * from avg_salary;


🎯 Next Question 4 — CTE + having

Ab isi CTE ko use karke sirf un departments ko display karo jinka average salary 50,000 se greater hai.

Expected:

department | avg_salary

with highest_avg_salary_of_dept as 
(
    select department, avg(salary) as highest_avg_salary from employees_table
    group by department
    having highest_avg_salary>50000
)
select * from highest_avg_salary_of_dept;



🎯 Next: CTE + JOIN

Ab thoda placement-level question:

employees_table aur departments_table ko join karke ek CTE banao jisme:

emp_id
name
department
dept_name

ho.

Join condition:

e.department = d.dept_name

Phir CTE se sirf IT employees display karo.


with it_empl as
(
    select e.emp_id, e.name, e.department, d.dept_name
    from employees_table e 
    join departments_table d
    on e.department = d.dept_name
)
select * from it_empl
where department='IT';


Question 👇

CTE use karke IT department ke employees nikalo jinki salary 60000 se zyada hai.

emp_id | name | salary



with it_empl as
(
    select emp_id, name, salary
    from employees_table 
    where department='IT'
)
select * from it_empl
where salary>60000;