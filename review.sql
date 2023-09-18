create database StudentDB
use StudentDB

CREATE TABLE STUDENTS(
ID INT IDENTITY (1,1) NOT NULL,
FirstName varchar(255) not null,
age int not null,
grade int not null
)

INSERT INTO Students (FirstName, Age, Grade) VALUES ('Alice', 18, 85.5), ('Bob', 17, 92.3),
     ('Charlie', 19, 78.9),
   ('David', 18, 81.2),
     ('Emma', 17, 95.0),
     ('Frank', 19, 79.5),
     ('Grace', 18, 89.1),
    ('Henry', 17, 91.8),
    ('Isabella', 19, 86.4),
   ('John', 18, 88.7)

