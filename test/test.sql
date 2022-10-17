use test_database;
create table test_database.student(
id int,
name varchar(55),
age int,
address varchar(55)
);

insert into student (id,name,age,address) value (1,'Van', 23, 'Hue'), (2,'Anh', 23, 'DN'),(3,'Duc', 23, 'Hue') ;

select * from student;

SET SQL_SAFE_UPDATES =0;
UPDATE student SET age = 23 where  id = 1;

SET SQL_SAFE_UPDATES = 1;
DELETE from student where id = 3;




	