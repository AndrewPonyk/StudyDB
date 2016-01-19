CREATE TABLE departments_pluralsight
(dept_id NUMBER NOT NULL PRIMARY KEY,
dept_name VARCHAR2(60)
);




INSERT INTO departments_pluralsight (dept_id,dept_name)
                      VALUES(1,'IT');
INSERT INTO departments_pluralsight (dept_id,dept_name)
                      VALUES(2,'Accounting');
COMMIT;


CREATE TABLE employee_pluralsight
(emp_id NUMBER NOT NULL PRIMARY KEY,
emp_name VARCHAR2(60),
emp_dept_id  NUMBER ,
emp_loc VARCHAR2(60),
emp_sal  NUMBER,
emp_status VARCHAR2(1)
);


insert into employee_pluralsight(emp_id,emp_name,emp_dept_id,emp_loc,emp_sal,emp_status) VALUES(10,'Tom',1,'CA',50000,'A');
insert into employee_pluralsight(emp_id,emp_name,emp_dept_id,emp_loc,emp_sal,emp_status) VALUES(20,'John',1,'CA',40000,'A');
insert into employee_pluralsight(emp_id,emp_name,emp_dept_id,emp_loc,emp_sal,emp_status) VALUES(50,'Tim',2,'WA',40000,'A');
insert into employee_pluralsight(emp_id,emp_name,emp_dept_id,emp_loc,emp_sal,emp_status) VALUES(60,'Jack',2,'WA',70000,'A');
COMMIT;


--CONSTRAINT emp_dept_fk FOREIGN KEY(emp_dept_id) 
--REFERENCES departments_pluralsight(dept_id)

ALTER TABLE employee_pluralsight ADD CONSTRAINT emp_dept foreign key (emp_dept_id)
references departments_pluralsight(dept_id);

-- rollback
-- drop table departments_pluralsight
-- drop table employee_pluralsight;