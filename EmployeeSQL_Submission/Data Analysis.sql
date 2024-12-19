--#1 List employee #, last name, first name, sex, and salary for all employees

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
join salaries s
on e.emp_no = s.emp_no;

--#2 list first name, last name, and hire date for employees hired in 1986
select first_name, last_name, hire_date 
from employees 
where hire_date >= '1986-01-01' AND hire_date < '1987-01-01';

--#3 list the manager of each department and their department number, department name, employee number, last name, first name
--employees has name also emp_no
--dept manager has dept no and emp no
--departments has dept no and dept name
--matching emp no to emp no in employees with get me the names
--matching the dept no to dept no in departments will get me department title


select d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
from employees e
join dept_manager dm on e.emp_no = dm.emp_no
join departments d on dm.dept_no = d.dept_no
where d.dept_name in 
	(
    select d.dept_name
    from departments d
    join dept_manager dm on d.dept_no = dm.dept_no
	);

--#4 list the department number for each employee and their employee number, last name, first name, and department name
--similar to above with dept_emp

select d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on d.dept_no = de.dept_no;

--#5 list first name, last name, sex for each employee named Hercules and has a last name starting with B
--first name is exact but last name just needs like I believe

select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

--#6 list all employees in the sales dept and their emp. number, last name, first name 
--*****should i remove dept name????
select d.dept_name, e.emp_no, e.last_name, e.first_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
where d.dept_no in 
	(
	select dept_no 
	from departments  
	where dept_name = 'Sales'
	);

--#7 list employees in the sales and development departments with their emp number, last name, first name, and department name

select e.emp_no, e.last_name, e.first_name, d.dept_name 
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
where d.dept_no in 
	(
	select dept_no 
	from departments  
	where dept_name = 'Sales' or dept_name = 'Development'
	);

--#8 list frequency counts (descending), of all employee last names
--**** i need to double check this one too cause i got a lot of rows

select count(last_name) desc, last_name
from employees
group by last_name;



