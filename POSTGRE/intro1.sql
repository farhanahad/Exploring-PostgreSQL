--Department table
-- Each department has many employee

CREATE table Department(
    deptID SERIAL PRIMARY KEY,
    deptName VARCHAR(50)
);


insert into Department values(1,'IT');

DELETE FROM Department where deptID=1;

select * from Department;


--Employee Table
--Each employee belongs to a department
CREATE TABLE Employee(
    empID SERIAL PRIMARY KEY,
    empName VARCHAR(50) NOT NULL,
    departmentID INT,
    CONSTRAINT fk_constraint_dept
    FOREIGN KEY (departmentID)
    REFERENCES Department(deptID)
);

insert into Employee values(1,'Farhan',1);

DELETE from Employee where empID=1;
select * from Employee;


create table courses(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    published_date DATE
);

INSERT INTO courses(course_name,description,published_date) 
VALUES 
('PostgreSQL for developer','A complete guidline PostgreSQL for developer','2020-07-13'),
('PostgreSQL for developer','A complete guidline PostgreSQL for developer',NULL),
('PostgreSQL for developer',NULL,NULL),
('PostgreSQL for developer','A complete guidline PostgreSQL for developer','2020-07-13'),
('PostgreSQL for developer','A complete guidline PostgreSQL for developer','2020-07-13');

select  * from courses;


--## update database table row
-- update table_name
-- SET
-- column1=value1,
-- column2=value2,
-- where condition

update courses
set 
course_name='Postgres',
description='Dummy Text'
where course_id=1;

--2

update courses
set 
course_name='Postgres',
description='Dummy Text'
where course_id>4;

--3

update courses
set 
course_name='Pg',
description=NULL
where course_id=1;


DELETE from courses
where course_id=1; 