create database mySQLdemo;

use mySQLdemo;
 
 show databases;
 
 CREATE TABLE Student_table(
    StudentID int,
    FirstName varchar(255),
    LastName varchar(255),
    Address varchar(255),
    City varchar(255)
);

show tables;
describe Student_table;

ALTER TABLE Student_table
ADD Email varchar(255);

ALTER TABLE Student_table
DROP COLUMN LastName;

TRUNCATE table Student_table;

set sql_safe_updates=0;

INSERT INTO Student_table (StudentID , FirstName, LastName, Address, City, Email) 
VALUES
(1,"TANYA", "SINGH","Vasant Vihar","DELHI","tanya@gmail.com"),
(2,"AMIT", "KUMAR","Avas Vikas","DELHI","amit@gmail.com"),
(3,"GAURI", "RAO","Adarsh Colony","BANGALORE","gauri@gmail.com"),
(4,"MANAV", "BHATT","Milan Vihar","NEW DELHI","manav@gmail.com"),
(5,"RIYA", "KAPOOR","Kahiram","UDAIPUR","riya@gmail.com");

select * from Student_table;

select * from Student_table where FirstName="Tanya"; 
select * from Student_table where FirstName="Tanya" and Address="Vasant Vihar"; 

select * from Student_table where FirstName in("TANYA","MANAV"); 

select * from Student_table where StudentID between 1 and 2; 

INSERT INTO Student_table (StudentID , FirstName, Address, City, Email) 
VALUES
(6,"TANYA","North 350","U.S.A","taniya@gmail.com"),
(7,"TANYA","Ekta Colony","Noida","tanyaa@gmail.com"),
(8,"TANYA","Pg Vihar","Amritsar","taniyaas@gmail.com");

select * from Student_table;
select * from Student_table where FirstName like 'T%'; 
select * from Student_table where FirstName like '%a%'; 

INSERT INTO Student_table (StudentID , FirstName, Address, City) 
VALUES
(9,"Shubh","A Block Kashiram","Moradabad"),
(10,"Muskan","Milan Vihar Colony","Delhi");
select * from Student_table;

