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


-- ss3 thao t??c v???i csdl

-- 1. L???y ra th??ng tin c??c h???c vi??n, v?? cho bi???t c??c h???c vi??n ??ang theo h???c l???p n??o.
  select s.* ,c.name  as class_name
  from student s  join class c on s.class_id=c.id; 

-- 2. L???y ra th??ng tin c??c h???c vi??n, v?? cho bi???t c??c h???c vi??n ??ang theo h???c l???p n??o 
-- v?? c??? c??c b???n ???? ????ng k?? nh??ng ch??a c?? l???p h???c.

 select s.* ,c.name  as class_name
  from student s 
  left join class c on s.class_id=c.id;

-- join 3 b???ng l???y th??m th??ng tin t??n lo???i l???p

select * from room;
select s.id, s.name, s.birthday, c.name as class_name, r.name as room_name
from student s
left join class c on s.class_id = c.id
left join room r on r.class_id=c.id;

-- 3. L???y th??ng tin c???a c??c h???c vi??n t??n 'nguyen minh hai'.
select * from student where name like '% hai';
select * from student where name = 'nguyen minh hai';

-- 4. L???y ra h???c vi??n c?? h??? l?? ???nguyen???
select * from student where name like 'nguyen %';

-- 5. L???y th??ng tin c???a c??c h???c vi??n t??n 'hai' ho???c 'huynh???.

select * from student where name like '% hai' or name like '% huynh';

-- 6. L???y ra c??c h???c vi??n c?? ??i???m l???n h??n 5 .
select * from student where point >5;

-- 7. l???y ra th??ng tin c??c h???c vi??n c?? ??i???m 4,6,8

select * from student where point = 4 or point = 6 or point =8;
select * from student where point in (4,6,8);
-- RegexP : t??m hi???u th??m

-- 8. Th??ng k??? s??? l?????ng h???c sinh theo t???ng lo???i ??i???m.
 select s.point, count(s.point) as so_luong 
 from student s 
 group by s.point;
 
  select * from student;
-- 9 . Th??ng k??? s??? l?????ng h???c sinh theo ??i???m v?? ??i???m ph???i l???n h??n 5

 select s.point, count(s.point) as so_luong 
 from student s 
 where s.point>5
 group by s.point;

-- 10. Th??ng k??? s??? l?????ng h???c sinh theo ??i???m l???n h??n 5 v?? ch??? hi???n th??? v???i s??? l?????ng>=2
 select s.point, count(s.point) as so_luong 
 from student s 
 where s.point>5
 group by s.point
 having so_luong>2;
-- 11. L???y ra danh s??ch h???c vi??n c???a l???p c1121g1 v?? s???p x???p  h???c vi??n theo point gi???m d???n,
-- n???u point b???ng nhau th?? s???p x???p theo t??n t??ng d???n.

select s.name, s.point, c.name as class_name 
from student s
join class c on s.class_id=c.id 
where c.name ='c1121g1'
order by s. point desc, s.name desc ;


