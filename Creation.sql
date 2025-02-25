Drop Table Departments;

Create Table Departments (
dept_id char(4) PRimary Key,
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

copy departments FROM '/data/departments.csv' DELIMITER ',' CSV HEADER QUOTE '"' ESCAPE '"';