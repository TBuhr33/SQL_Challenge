--drop previous tables, if needed
drop table Manager cascade;
drop table Departments cascade;
drop table Employee_Dept cascade;
drop table Employees cascade;
drop table Salaries cascade;
drop table Titles cascade;

--import CSV Files

copy Manager from 'C:\SQL_HMWK_CSV/dept_manager.csv'
with (format CSV, header);

copy Departments from 'C:\SQL_HMWK_CSV/departments.csv'
with (format CSV, header);

copy Employee_Dept from 'C:\SQL_HMWK_CSV/dept_emp.csv'
with (format CSV, header);

copy Employees from 'C:\SQL_HMWK_CSV/employees.csv'
with (format CSV, header);

copy Salaries from 'C:\SQL_HMWK_CSV/salaries.csv'
with (format CSV, header);

copy Titles from 'C:\SQL_HMWK_CSV/titles.csv'
with (format CSV, header);

--Query the desired data 
select Employees.emp_no, Employees.last_name, Employees.first_name, Employees.gender, Salaries.salary
from Employees
inner join Salaries on Employees.emp_no = Salaries.emp_no;

select Employees.emp_no, Employees.last_name, Employees.first_name
from Employees
inner join Employee_Dept on Employees.emp_no = Employee_Dept.emp_no
where from_date between '1986-01-01' and '1986-12-31';

select Departments.dept_no, Departments.dept_name, Manager.emp_no, Employees.last_name, Employees.first_name, Employee_dept.from_date, Employee_dept.to_date
from Departments
inner join Manager on Departments.dept_no = Manager.dept_no
inner join Employees on Manager.emp_no = Employees.emp_no
inner join Employee_Dept on Employees.emp_no = Employee_Dept.emp_no;

select Departments.dept_name, Employee_Dept.emp_no, Employees.last_name, Employees.first_name
from Employee_Dept
inner join Employees on Employee_Dept.emp_no = Employees.emp_no
inner join Departments on Employee_Dept.dept_no = Departments.dept_no;

select first_name, last_name
from Employees
where (first_name = 'Hercules')
and (last_name like 'B%');

select Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
from Employees
inner join Employee_Dept on Employees.emp_no = Employee_Dept.emp_no
inner join Departments on Employee_Dept.dept_no
where dept_name = 'Sales';

select Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
from Employees
inner join Employee_Dept on Employees.emp_no = Employee_Dept.emp_no
inner join Departments on Employee_Dept.dept_no
where dept_name in ('Sales', 'Development');

select last_name, count(last_name) as name_frequency
from employees
order by name_frequency DESC;