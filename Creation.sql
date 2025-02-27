Drop Table if exists Dept_Manager;
Drop Table if exists Dept_Emp;
Drop Table if exists Salaries;
Drop Table if exists Employees;
Drop Table if exists Titles;
Drop Table if exists Departments;
Create Table Departments (
dept_no char(4) PRimary Key,
dept_name varchar(100) Not Null
);

Create Table Titles (
title_id char(5) Primary Key,
title varchar(75) Not Null
);

Create Table Employees (
emp_no int Primary Key,
emp_title char(5) Not Null,
birth_date  Date Not Null,
first_name varchar(45) Not Null,
last_name varchar(45) Not Null,
sex char(1) Not Null,
hire_date Date Not Null,
Foreign Key (emp_title) References Titles (title_id)
);
Create Table Salaries (
emp_no int Primary key,
salary int Not Null,
foreign key (emp_no) References Employees (emp_no)
);
Create Table Dept_Emp (
emp_no int,
dept_no char(4),
Primary Key (emp_no,dept_no),
Foreign Key (emp_no) References Employees (emp_no),
Foreign Key (dept_no) References Departments (dept_no)
);

Create Table Dept_Manager (
dept_no char(4),
emp_no int,
Primary Key (emp_no,dept_no),
Foreign Key (emp_no) References Employees (emp_no),
Foreign Key (dept_no) References Departments (dept_no)
);

Copy departments from 'C:/Users/steph/UofM-VIRT-DATA-PT-12-2024-U-LOLC-MWTH/02-Homework/09-SQL/Starter_Code/data/departments.csv' CSV Delimiter ',' Header;
Copy titles from 'C:\Users\steph\UofM-VIRT-DATA-PT-12-2024-U-LOLC-MWTH\02-Homework\09-SQL\Starter_Code\data\titles.csv' CSV Delimiter ',' Header;
Copy employees from 'C:\Users\steph\UofM-VIRT-DATA-PT-12-2024-U-LOLC-MWTH\02-Homework\09-SQL\Starter_Code\data\employees.csv' CSV Delimiter ',' Header;
Copy dept_emp from 'C:\Users\steph\UofM-VIRT-DATA-PT-12-2024-U-LOLC-MWTH\02-Homework\09-SQL\Starter_Code\data\dept_emp.csv' CSV Delimiter ',' Header;
Copy dept_manager from 'C:\Users\steph\UofM-VIRT-DATA-PT-12-2024-U-LOLC-MWTH\02-Homework\09-SQL\Starter_Code\data\dept_manager.csv' CSV Delimiter ',' Header;
Copy salaries from 'C:\Users\steph\UofM-VIRT-DATA-PT-12-2024-U-LOLC-MWTH\02-Homework\09-SQL\Starter_Code\data\salaries.csv' CSV Delimiter ',' Header;

-- Query 1
Select employees.emp_no as emp_no,last_name,first_name,sex,salary
From employees
Join salaries on employees.emp_no=salaries.emp_no;

--Query 2
Select first_name, last_name, hire_date
From employees
Where DATE_PART('year',hire_date)=1986;

--Query 3
Select dm.dept_no,dept_name,e.emp_no,last_name,first_name
From dept_manager as dm
left join employees as e
on dm.emp_no =e.emp_no
left join departments on dm.dept_no=departments.dept_no;

--Query 4
select dept_emp.dept_no,dept_name,e.emp_no,first_name, last_name
From employees as e
join dept_emp on e.emp_no=dept_emp.emp_no
join departments on dept_emp.dept_no=departments.dept_no;

--Query 5
Select first_name, last_name, sex
From employees
Where (first_name='Hercules') and (Last_name Like 'B%');

--Query 6
Select e.emp_no,last_name, first_name
From Employees as Select employees.emp_no as emp_no,last_name,first_name,sex,salary
From employees
Join salaries on employees.emp_no=salaries.emp_no;

--Query 2
Select first_name, last_name, hire_date
From employees
Where DATE_PART('year',hire_date)=1986;
join dept_emp on e.emp_no=dept_emp.emp_no
join departments on departments.dept_no=dept_emp.dept_no
Where dept_name='Sales';

--Query 7
Select e.emp_no,last_name, first_name, dept_name
From Employees as e
join dept_emp on e.emp_no=dept_emp.emp_no
join departments on departments.dept_no=dept_emp.dept_no
Where (dept_name='Sales') or (dept_name='Development');

--Query 8
Select last_name, count(last_name) As Frequency
From employees
group by last_name
order by Frequency desc;
