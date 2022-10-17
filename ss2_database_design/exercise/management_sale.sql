create database management_sale;

use management_sale;

create table customer(
c_id varchar(10) primary key,
c_name varchar(45),
c_age int 
);

create table `order`(
o_id varchar(10) primary key,
c_id varchar(10),
o_date date,
o_total_price double,
foreign key (c_id) references customer(c_id)
);

create table product(
p_id varchar(10) primary key,
p_name varchar(45),
p_price double
);

create table order_detail(
o_id varchar(10),
p_id varchar(10),
or_qty varchar (10),
primary key(o_id, p_id),
foreign key (o_id) references `order`(o_id),
foreign key (p_id) references product(p_id)
);