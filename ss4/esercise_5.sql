create database demo;
use demo;

create table products (
    id int primary key auto_increment,
    product_code varchar(20),
    product_name varchar(20),
    product_price double,
    product_amount int,
    product_description varchar(30),
    product_status bit
);

insert into products(product_code, product_name, product_price,product_amount, product_description,product_status)
value
('CG1','LAPTOP_1',4000,5,'ASUS',1),
('CG2','LAPTOP_2',6000,3,'HP',1),
('CG3','LAPTOP_3',8000,4,'ACER',1),
('CG4','LAPTOP_5',3000,8,'DELL',1),
('CG5','LAPTOP_6',6000,1,'LENOVO',1);

create unique index index_product_code on products(product_code);

select * from products
where product_code = 'CG4';
    
explain select * from products
where product_code = 'CG4';
     
alter table	products add index index_name_price(product_name, product_price);
    
select * from products
where product_name = 'LAPTOP_3' or product_price = 8000;
    
explain select * from products
where product_name = 'LAPTOP_3' or product_price = 8000;
    
create view view_products as 
select product_code, product_name, product_price, product_status 
from products;

select * from view_products;
    
update view_products set product_price = 10000
where product_name = 'LAPTOP_6';
    
drop view view_products;

DELIMITER //
create procedure products_store()
begin
select 
	* 
from 
	products;
end //
DELIMITER ;

call products_store();

drop procedure products_store;

DELIMITER //
create procedure products_store()
begin
insert into products(product_code, product_name, product_price,product_amount, product_description,product_status)
value ('CG9','LAPTOP_15',5500,3,'MSI',0);
end //
DELIMITER ;

DELIMITER //
create procedure products_store()
begin
update products
set product_name = 'LAPTOP_0'
where id = 3;
end //
DELIMITER ;

DELIMITER //
create procedure products_store()
begin
delete from products 
where id = 5;
end //
DELIMITER ;