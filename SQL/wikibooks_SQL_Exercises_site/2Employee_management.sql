-- create tables
CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  Budget decimal NOT NULL 
);

CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  Department INTEGER NOT NULL , 
  FOREIGN KEY (department) REFERENCES Departments(Code) 
) ;

-- 2 insert data
INSERT INTO Departments(Code,Name,Budget) VALUES(14,'IT',65000);
INSERT INTO Departments(Code,Name,Budget) VALUES(37,'Accounting',15000);
INSERT INTO Departments(Code,Name,Budget) VALUES(59,'Human Resources',240000);
INSERT INTO Departments(Code,Name,Budget) VALUES(77,'Research',55000);

INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('123234877','Michael','Rogers',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('152934485','Anand','Manikutty',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('222364883','Carol','Smith',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('326587417','Joe','Stevens',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332154719','Mary-Anne','Foster',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332569843','George','ODonnell',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('546523478','John','Doe',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('631231482','David','Smith',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('654873219','Zacary','Efron',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('745685214','Eric','Goldsmith',59);
INSERT INTO Employees(SSN,NAME,LastName,Department) VALUES('845657245','Elizabeth','Doe',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657246','Kumar','Swamy',14);

-- 3 test
SELECT * FROM DEPARTMENTS;
select * from EMPLOYEES;
---------------------------------- Exercises

--1 Select the last name of all employees
SELECT lastname FROM employees;

-- 2 Select the last name of all employees, without duplicates.
select distinct lastname from employees;

-- 3 Select all the data of employees whose last name is "Smith".
select * from employees where lastname = 'Smith';

-- 4 Select all the data of employees whose last name is "Smith" or "Doe".
SELECT * FROM employees WHERE lastname = 'Smith' OR lastname = 'Doe';
--or 
SELECT * FROM employees WHERE lastname in ('Smith', 'Doe');

-- 5 Select all the data of employees that work in department 14.
select * from employees where department = 14;

-- 7 Select all the data of employees whose last name begins with an "S".
select * from employees where lastname like 'S%';

-- 8 Select the sum of all the departments' budgets.
SELECT SUM (budget) FROM departments;

-- 9 Select the number of employees in each department (you only need to show the department code and the number of employees).
select department, count(department) from employees group by department;

-- 10 Select all the data of employees, including each employee's department's data.