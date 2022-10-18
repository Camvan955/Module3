create database if not exists c0722g1;
use c0722g1;
create table class(
id int auto_increment primary key,
`name` varchar(20)
);
create table room(
id int auto_increment primary key,
`name` varchar(20),
class_id int,
foreign key (class_id) references class(id)
);
create table jame (
username varchar(50) primary key,
`password` varchar(50)
);
create table student(
id int auto_increment primary key,
`name` varchar(50),
birthday date,
gender boolean,
email varchar(50),
point float,
username varchar(50) unique,
class_id int,
foreign key (username) references jame(username),
foreign key (class_id) references class(id)
);
create table instructor(
id int auto_increment primary key,
`name` varchar(50),
birthday date,
salary float
);
create table instructor_class (
 instructor_id int,
 class_id int,
 primary key(instructor_id,class_id),
 foreign key (instructor_id) references instructor(id),
 foreign key (class_id) references class(id),
 start_time date,
 end_time date
);

insert into class (name) values ('c1121g1'), ('c1221g1'),('a0821i1'),('a0921i1');
insert into room(name,class_id) values ('Ken',1), ('Jame',1),('Ada',2),('Andy',2);

insert into jame(`username`,`password`)
 values('cunn','12345'),('chunglh','12345'),('hoanhh','12345'),('dungd','12345'),('huynhtd','12345'),
 ('hainm','12345'),('namtv','12345'),('hieuvm','12345'),('kynx','12345'),('vulm','12345');

insert into jame(`username`,`password`)
 values('chau','12345');
 
insert into instructor(`name`,birthday, salary)
 values('tran van chanh','1985-02-03',100),('tran minh chien','1985-02-03',200),('vu thanh tien','1985-02-03',300);
insert into instructor(`name`,birthday, salary)
 values('tran van nam','1989-12-12',100);


 
 insert into student(`name`,birthday, gender,`point`, class_id,`username`) 
 values ('nguyen ngoc cu','1981-12-12',1,8,1,'cunn'),
 ('le hai chung','1981-12-12',1,5,1,'chunglh'),
 ('hoang huu hoan','1990-12-12',1,6,2,'hoanhh'),
 ('dau dung','1987-12-12',1,8,1,'dungd'),
 ('ta dinh huynh','1981-12-12',1,7,2,'huynhtd'),
 ('nguyen minh hai','1987-12-12',1,9,1,'hainm'),
 ('tran van nam','1989-12-12',1,4,2,'namtv'),
 ('vo minh hieu','1981-12-12',1,3,1,'hieuvm'),
 ('le xuan ky','1981-12-12',1,7,2,'kynx'),
 ('le minh vu','1981-12-12',1,7,1,'vulm');

  insert into student(`name`,birthday, gender,`point`, class_id,`username`) 
 values ('nguyen van a','1981-12-12',1,8,null,'nguyea'),('tran van b','1981-12-12',1,5,null,'nguyenb');
 
 
  insert into student(`name`,birthday, gender,`point`, class_id,`username`) 
 values ('nguyen minh hai chau','1981-12-12',1,8,null,'chau');
 
 insert into instructor_class(class_id,instructor_id) values (1,1),(1,2),(2,1),(2,2),(3,1),(3,2);

select * from room;
select* from class;
select* from student;
select* from jame;
delete from student;
select* from instructor;
select * from instructor_class;


-- ss3 thao tác với csdl

-- 1. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào.
  select s.* ,c.name  as class_name
  from student s  join class c on s.class_id=c.id; 

-- 2. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào 
-- và cả các bạn đã đăng ký nhưng chưa có lớp học.

 select s.* ,c.name  as class_name
  from student s left join class c on s.class_id=c.id; 

-- join 3 bảng lấy thêm thông tin tên loại lớp

select * from room;
select s.id, s.name, s.birthday, c.name as class_name, r.name as room_name
from student s
left join class c on s.class_id = c.id
left join room r on r.class_id=c.id;

-- 3. Lấy thông tin của các học viên tên 'nguyen minh hai'.
select * from student where name like '% hai';
select * from student where name = 'nguyen minh hai';

-- 4. Lấy ra học viên có họ là “nguyen”
select * from student where name like 'nguyen %';

-- 5. Lấy thông tin của các học viên tên 'hai' hoặc 'huynh’.

select * from student where name like '% hai' or name like '% huynh';

-- 6. Lấy ra các học viên có điểm lớn hơn 5 .
select * from student where point >5;

-- 7. lấy ra thông tin các học viên có điểm 4,6,8

select * from student where point = 4 or point = 6 or point =8;
select * from student where point in (4,6,8);
-- RegexP : tìm hiểu thêm

-- 8. Thông kế số lượng học sinh theo từng loại điểm.
 select s.point, count(s.point) as so_luong 
 from student s 
 group by s.point;
 
  select * from student;
-- 9 . Thông kế số lượng học sinh theo điểm và điểm phải lớn hơn 5

 select s.point, count(s.point) as so_luong 
 from student s 
 where s.point>5
 group by s.point;

-- 10. Thông kế số lượng học sinh theo điểm lớn hơn 5 và chỉ hiện thị với số lượng>=2
 select s.point, count(s.point) as so_luong 
 from student s 
 where s.point>5
 group by s.point
 having so_luong>2;
-- 11. Lấy ra danh sách học viên của lớp c1121g1 và sắp xếp  học viên theo point giảm dần,
-- nếu point bằng nhau thì sắp xếp theo tên tăng dần.

select s.name, s.point, c.name as class_name 
from student s
join class c on s.class_id=c.id 
where c.name ='c1121g1'
order by s. point desc, s.name desc ;


