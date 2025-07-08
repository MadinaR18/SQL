create database SchoolDB
go 
use SchoolDB

create table Student ( ID INT, Name VARCHAR(50), Age INT, Primary Key (ID));
insert into Student values (1,'Ali','23'), (2,'Malika','26'),(3,'Omar','30')
select * from Student 



