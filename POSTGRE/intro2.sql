-- Active: 1691243207227@@127.0.0.1@5432@test1

CREATE TABLE IF NOT EXISTS departments(
    deptID SERIAL PRIMARY KEY,
    name text not null
);
insert into departments values(1,'CE');
INSERT INTO departments(name) 
VALUES
('IT'),
('CSE'),
('EEE'),
('CIVIL');

SELECT * from departments;


CREATE TABLE IF NOT EXISTS employees(
    empID SERIAL PRIMARY KEY,
    name text not null,
    email text not null,
    salary integer not null,
    joining_date date not null,
    deptID integer not null,
    CONSTRAINT  fk_deptID
    FOREIGN KEY(deptID)
    REFERENCES departments(deptID) 
);

INSERT INTO employees(name,email,salary,joining_date,deptID)
VALUES
('Farhan','farhanahad3@gmail.com',10000,'2020-07-13',1),
('Farhana','farhan@gmail.com',100007,'2020-07-14',2),
('Farha','farha@gmail.com',100005,'2020-07-15',3),
('Arif','Arif@gmail.com',100007,'2020-07-16',4),
('Alif','Alif@gmail.com',100009,'2020-07-17',5);

select * from employees;

SELECT empID,name,email,salary from employees;

SELECT * from employees
where salary=10000;

SELECT * from employees
where salary>90000 AND salary<120000;


SELECT * from employees
where joining_date>'2020-07-14';

--not equal
SELECT * from employees
where name <> 'Farha';

SELECT * from employees
ORDER BY name
ASC LIMIT 2;
--offset using pagination: ASC LIMIT 2 OFFSET 1 means next page;
SELECT * from employees
ORDER BY name
DESC;

--order by - by default ascending
--highest salary from employees table
SELECT * from employees
ORDER BY salary DESC
LIMIT 1;

--third highest salary from employees table
SELECT * from employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- IN,NOT IN,BETWEEN,LIKE

SELECT * from employees
where empid IN(2,3,4,100);

SELECT * from employees
where empid NOT IN(2,3,4,100);


SELECT * from employees
where salary BETWEEN 10000 AND 100000;

--LIKE using string searching

SELECT * from employees
where name like '%a%';    -- any a will be show

SELECT * from employees
where name like 'a%';     --starting a . it's case sensitive

SELECT * from employees
where name like 'F%';

SELECT * from employees
where name like '%a';     --last character a

SELECT * from employees
where name like '_a%';    --second position a

SELECT * from employees
where name like '__r%';     --3rd position r

SELECT * from employees
where name like 'F%n';      --1st character F last character n

SELECT * from employees
where name deptID IS NULL;

--aggregate functiion
SELECT AVG(salary) AS AverageSalary from employees;
SELECT MIN(salary) AS MinimumSalary from employees;
SELECT MAX(salary) AS MaximumSalary from employees;
SELECT SUM(salary) AS SumSalary from employees;

SELECT deptID,AVG(salary) from employees GROUP BY deptID;
SELECT deptID,SUM(salary) from employees GROUP BY deptID;


SELECT * from employees e
RIGHT JOIN departments d ON e.deptID=d.deptID;

SELECT d.name,avg(e.salary),sum(e.salary),max(e.salary) from employees e
FULL JOIN departments d ON e.deptID=d.deptID
GROUP BY d.name HAVING avg(e.salary)>10000;

SELECT d.name,sum(salary),avg(salary),min(salary),count(*) from departments d
FULL JOIN employees e ON e.deptID=d.deptID
GROUP BY d.deptID