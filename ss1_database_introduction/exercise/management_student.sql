create database my_database;

create table my_database.student(
id int primary key,
name varchar(55),
age int ,
country varchar(55)
);
create table my_database.class(
id int not null,
name varchar(55)
);

create table my_database.teacher(
id int not null,
name varchar(55),
age int,
country varchar(55)
);

