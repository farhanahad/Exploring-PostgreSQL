--## create a database
CREATE DATABASE test1;

--## Rename DATABASE
ALTER DATABASE test1 RENAME TO test2; 

--## Delete DATABASE
DROP DATABASE student;

--## Create a student table

CREATE TABLE student(
    student_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    cgpa NUMERIC(1,2)
)


--## Rename a TABLE
ALTER TABLE student RENAME TO learners;

--## Delete all rows in a table without deleting the table
TRUNCATE TABLE user1;

--## Delete a table
 DROP TABLE "user1";


--##Create a table with constraints
--## 1
create table "user"(
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE,
    email VARCHAR(255) UNIQUE
)

--## 2nd way
create table "user"(
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
)


--##3rd way

create table "user"(
    user_id SERIAL ,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    PRIMARY KEY(user_id)
)

--##4th way(Composite key)

create table "user1"(
    user_id SERIAL ,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    PRIMARY KEY(user_id,username)
)

--## 5th way(Multiple uniqueness)

create table "user1"(
    user_id SERIAL ,
    username VARCHAR(255)  NOT NULL,
    email VARCHAR(255)  NOT NULL,
    PRIMARY KEY(user_id,username),
    UNIQUE(user_id,username)
)

--## 7th way(Default value)

create table "user1"(
    user_id SERIAL ,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
   age int DEFAULT 18
)

--## Insert a DATA

--## way:1

 insert into user1 values (1,'abc','abc@gmail.com');

--##way:2

insert into user1(user_id,username,email,age) values (2,'abcd','abcd@gmail.com',20);

--##way-3 multiple value INSERT
insert INTO user1(username,email)
 VALUES
 ('abcd1','abcd1@gmail.com'),
 ('abcd2','abcd2@gmail.com');

 --## Way:4
 insert INTO user1
 VALUES
 (1,'abcd1','abcd1@gmail.com'),
 (2,'abcd2','abcd2@gmail.com');


--## Alter TABLE
--add a column,drop a column,change datatype of a column
--rename a column ,set default value for a COLUMN
--add constraint to a column,drop constraint for a COLUMN
--table RENAME
--alter table table_name action

--## Add a COLUMN
ALTER TABLE user1
ADD COLUMN password VARCHAR(255) DEFAULT 'admin123' not null;

--## add a COLUMN
ALTER TABLE user1
ADD COLUMN demo int;

--## Delete a column

ALTER TABLE user1
DROP COLUMN age;


--##Change datatype of a column

ALTER TABLE user1
ALTER COLUMN demo type text;


--## set default value for a column
ALTER TABLE user1
alter column country set DEFAULT 'bangladesh';
INSERT INTO user1 values (3,'abc3','abc3@gmail.com');

--## drop default value for a column
ALTER TABLE user1
alter column country DROP DEFAULT ;
INSERT INTO user1 values (4,'abc4','abc4@gmail.com');

--## Rename a column
ALTER TABLE user1
RENAME COLUMN demo to country;

--## Add constraint to a column

ALTER TABLE user1
ALTER COLUMN country set NOT NULL;

--## Drop constraint for a column
ALTER TABLE user1
ALTER COLUMN  country drop NOT NULL;

--## ADD a contstraint
ALTER TABLE user1
ADD CONSTRAINT unique_email UNIQUE(email);

--## Delete a contstraint
ALTER TABLE user1
DROP CONSTRAINT unique_email ;

--## Read the data
--SELECT username FROM user1;
SELECT * FROM user1;