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
SELECT e.SSN, e.NAME AS NAME_E, e.LASTNAME, d.NAME as NAME_D, e.DEPARTMENT, d.CODE, d.budget FROM employees e, departments d 
WHERE e.DEPARTMENT=d.CODE;
 -- or from  site 
SELECT SSN, E.Name AS Name_E, LastName, D.Name AS Name_D, Department, Code, Budget
 FROM Employees E INNER JOIN Departments D
 ON E.Department = D.Code;
 
 -- 11 Select the name and last name of each employee, along with the name and budget of the employee's department.
 SELECT e.NAME, e.LASTNAME, d.name, d.BUDGET FROM employees e,DEPARTMENTS d
 where e.department = d.code;

-- 12 Select the name and last name of employees working for departments with a budget greater than $60,000.
 SELECT e.NAME, e.LASTNAME FROM employees e,DEPARTMENTS d
 where e.department = d.code and d.BUDGET > 60000;
 
-- 13 Select the departments with a budget larger than the average budget of all the departments.
SELECT * FROM DEPARTMENTS 
where BUDGET > (select avg(budget) from departments);

-- 14 Select the names of departments with more than two employees.
SELECT d.NAME FROM departments d, employees e
WHERE d.CODE=e.DEPARTMENT GROUP BY d.NAME 
having count(d.name) > 2;


-- 15 Select the name and last name of employees working for departments with second lowest budget.
SELECT e.NAME, e.lastname FROM employees e, DEPARTMENTS d
where e.DEPARTMENT=d.code and d.budget=(SELECT MIN(budget) FROM DEPARTMENTS where budget not in (select MIN(budget) from DEPARTMENTS));

SELECT * FROM departments;
select * from employees;
SELECT MAX(budget) FROM DEPARTMENTS where budget not in (select max(budget) from DEPARTMENTS);

-- 17 Reduce the budget of all departments by 10%.
SELECT * FROM DEPARTMENTS;

UPDATE DEPARTMENTS SET budget=budget*0.9;  -- reduce budgets
UPDATE DEPARTMENTS SET budget=budget*1.11111111; -- restore values

-- 19 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
DELETE FROM employees emp WHERE
emp.DEPARTMENT in (select code from departments where budget > 60000);





-- P.S.  PLAY with ROWNUM !!!
SELECT * FROM employees e; -- all
SELECT * FROM employees WHERE ROWNUM = 1; -- select first row !!
SELECT * FROM employees WHERE ROWNUM  = 2; -- DONT DO LIKE THIS, NOTHING IN RESULT (rownum make sence only with <  operator !!!)
SELECT * FROM employees WHERE ROWNUM <= 2;
-- so we can use rownum only to get top N from table !!!


-- PAGINATION in ORACLE
-- clever solution from stackoverflow, use ronum in interesting way ))
SELECT * 
  FROM (SELECT ssn,name || ' ' || lastname as fl, rownum rn
          FROM (SELECT *
                  FROM employees
                 ORDER BY ssn)
         WHERE ROWNUM <= 6)
 WHERE rn > 3; -- getting employees from  4 to 6
 
 -- when we want to get nth row
 SELECT ID  FROM 
(SELECT ID , ROWNUM AS rn FROM TEST)
 where rn =2; 
 
 --for better understanding rownum http://stackoverflow.com/questions/9679051/why-operator-doesnt-work-with-rownum-other-than-for-value-1