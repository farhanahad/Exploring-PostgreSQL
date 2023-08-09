-- Active: 1691243207227@@127.0.0.1@5432@test2

CREATE DATABASE test2;


CREATE TABLE department(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
INSERT INTO department(department_id,department_name) 
VALUES
(1,'IT'),
(2,'CSE'),
(3,'EEE'),
(4,'CIVIL');

SELECT * from department;

CREATE TABLE employees(
    employee_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    department_id INT,
    job_role VARCHAR(100),
    manager_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

INSERT INTO employees (employee_id, full_name, department_id, job_role, manager_id) VALUES
(1, 'John Doe', 1, 'Software Engineer', NULL),
(2, 'Jane Smith', 2, 'Marketing Manager', NULL),
(3, 'Michael Johnson', 3, 'Sales Executive', 2),
(4, 'Emily Adams', 2, 'Marketing Coordinator', 2),
(30, 'Angela Miller', 3, 'Account Manager', 24);

SELECT * from employees;

SELECT employees.full_name,employees.job_role,department.department_name
from employees
INNER JOIN department ON department.department_id=employees.department_id;

--inner join
SELECT *
from employees
INNER JOIN department ON department.department_id=employees.department_id;

--left join
SELECT *
from employees
LEFT JOIN department ON department.department_id=employees.department_id;

--Right join
SELECT *
from employees
RIGHT JOIN department ON department.department_id=employees.department_id;

--full join
SELECT *
from employees
FULL JOIN department ON department.department_id=employees.department_id;

--natural join
SELECT *
from employees
NATURAL JOIN department ;


--cross join
SELECT *
from employees
CROSS JOIN department ;








