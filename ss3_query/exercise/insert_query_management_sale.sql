use management_sale;

insert into management_sale.customer value 
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

insert into management_sale.`order` value 
(1, 1, '2006-03-21', null),
(2, 2, '2006-03-23', null),
(3, 1, '2006-03-16', null);

insert into management_sale.`product` value
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

insert into management_sale.order_detail value 
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select * from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select distinct customer.c_name, product.p_name
from customer 
join `order` on customer.c_id = `order`.c_id
join order_detail on `order`.o_id = order_detail.o_id
join product on order_detail.o_id = product.p_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customer.c_id, customer.c_name,customer.c_age
from customer 
left join `order` on  customer.c_id = `order`.c_id
where `order`.c_id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select `order`.o_id, `order`.o_date, product.p_price * order_detail.or_qty  as total
from `order`
join order_detail on `order`.o_id = order_detail.o_id
join product on order_detail.p_id = product.p_id;







