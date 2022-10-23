-- task 2:
use case_study;
select *from nhan_vien where ((ho_ten like "H%") or (ho_ten like "T%") or (ho_ten like "K%")) and (char_length(ho_ten) <=15) ;

-- task 3: 
use case_study;
select*FROM khach_hang where (((YEAR(CURDATE()) - YEAR(ngay_sinh)) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))) >= 18 
and ((YEAR(CURDATE()) - YEAR(ngay_sinh)) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))) <= 50 
and (dia_chi like '%Quảng Trị' or dia_chi like '%Đà Nẵng' ));

-- task 4:
select khach_hang.ma_khach_hang, khach_hang.ho_ten,count(hop_dong.ma_hop_dong) as so_lan_dat_dong
from khach_hang
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where ten_loai_khach = 'Diamond'
group by khach_hang.ma_khach_hang
order by count(hop_dong.ma_hop_dong);

-- task 5:
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong,hd.ngay_ket_thuc, (dv.chi_phi_thue +sum(dvdk.gia*hdct.so_luong)) as tong_tien
from hop_dong hd
left join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
left join loai_khach lk on kh.ma_loai_khach = kh.ma_loai_khach
left join dich_vu dv on hd.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hd.ma_hop_dong;

-- task 6:
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich,dv.chi_phi_thue,ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where dv.ma_dich_vu not in ( select hd.ma_dich_vu from hop_dong hd where (month(hd.ngay_lam_hop_dong) between 1 and 3) and year(hd.ngay_lam_hop_dong) = 2021);

-- task 7:
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where dv.ma_dich_vu in (select dv.ma_dich_vu from dich_vu dv join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu where year(hd.ngay_lam_hop_dong) = 2020) and
dv.ma_dich_vu not in (select dv.ma_dich_vu from dich_vu dv join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu where year(hd.ngay_lam_hop_dong) = 2021)
group by hd.ma_dich_vu;

-- task 8: Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.

-- 
select distinct kh.ho_ten 
from khach_hang kh;
 --
 select kh.ma_khach_hang, kh.ho_ten
 from khach_hang kh
 group by ho_ten;
-- 
select kh.ho_ten
from khach_hang kh 
union 
select kh.ho_ten
from khach_hang kh;

-- task 9:
select month(hd.ngay_lam_hop_dong) as thang, count(kh.ma_khach_hang) as so_luon_khach_hang
from khach_hang kh
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where year(hd.ngay_lam_hop_dong) = '2021'
group by thang
order by thang;

-- task 10:	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc,
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from hop_dong hd
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong;

-- Task 11: Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem 
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang 
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where (lk.ten_loai_khach = 'Diamond') 
and kh.dia_chi like "%Vinh" or kh.dia_chi like  "%Quảng Ngãi";

-- Task 12: Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa 
-- trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được
--  khách hàng đặt vào 6 tháng đầu năm 2021
select hd.ma_hop_dong, nv.ho_ten as ho_ten_nhan_vien, kh.ho_ten as ho_ten_khach_hang, kh.so_dien_thoai,dv.ten_dich_vu, ifnull(sum(hdct.so_luong),0) as so_luong_dich_vu_di_kem,sum(hd.tien_dat_coc) as tien_dat_coc
from hop_dong hd
left join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
left join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where hd.ma_hop_dong in ( select hd.ma_hop_dong
from hop_dong hd
where (month(hd.ngay_lam_hop_dong) between 10 and 12) and (year(hd.ngay_lam_hop_dong) = 2020)) and hd.ma_hop_dong not in (
select hd.ma_hop_dong
from hop_dong hd
where (month(hd.ngay_lam_hop_dong) between 01 and 06) and (year(hd.ngay_lam_hop_dong) = 2021))
group by hdct.ma_hop_dong;

-- Task 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from hop_dong hd 
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong  
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
group by dvdk.ma_dich_vu_di_kem
having  sum(hdct.so_luong) >= all (select sum(hdct.so_luong) from hop_dong_chi_tiet hdct group by hdct.ma_dich_vu_di_kem) ;

-- Task 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(dvdk.ma_dich_vu_di_kem) as so_lan_su_dung
from hop_dong hd
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem 
having count(dvdk.ma_dich_vu_di_kem) <= all (select count(hdct.so_luong) from hop_dong_chi_tiet hdct group by hdct.ma_dich_vu_di_kem);

-- Task 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi, count(hd.ma_nhan_vien) as so_lan_lap_hop_dong
from nhan_vien nv
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
where year(hd.ngay_lam_hop_dong) between 2020 and 2021
group by hd.ma_nhan_vien
having count(hd.ma_nhan_vien) between 1 and 3;

-- Task 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set sql_safe_updates = 0;
delete from nhan_vien 
where nhan_vien.ma_nhan_vien not in ( select hop_dong.ma_nhan_vien 
from hop_dong 
where year(hop_dong.ngay_lam_hop_dong) between 2019 and 2021);
-- select * from nhan_vien;

-- Task 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng
-- với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
 update loai_khach set ten_loai_khach = 'Diamond'
 where (
 select hd.ma_khach_hang from hop_dong hd
 join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
 join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
 join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
 where year(hd.ngay_lam_hop_dong) = 2021 and (dvdk.gia * hdct.so_luong) + dv.chi_phi_thue > 10000000
 group by hd.ma_khach_hang);
 
 -- Task 18. Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
set sql_safe_updates = 0;
set foreign_key_checks = 0;
delete from khach_hang kh
 where kh.ma_khach_hang in (select hop_dong.ma_khach_hang
 from hop_dong
 where year(hop_dong.ngay_lam_hop_dong) < 2021);
 
 -- Task 19: Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
set sql_safe_updates = 0;

update dich_vu_di_kem 
set gia = gia * 2
where ma_dich_vu_di_kem in (
select * from
(select dvdk.ma_dich_vu_di_kem
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
where year(hd.ngay_lam_hop_dong) = 2020
group by dvdk.ten_dich_vu_di_kem
having sum(hdct.so_luong) > 10) as x);

  -- Task 20: Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
  -- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
  
select ma_nhan_vien, ho_ten, email,so_dien_thoai, ngay_sinh, dia_chi from nhan_vien
union
select ma_khach_hang, ho_ten, email,so_dien_thoai, ngay_sinh, dia_chi from khach_hang;

-- Task 21:	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân
-- viên có địa chỉ là “Đà Nẵng” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng
-- bất kì với ngày lập hợp đồng là “tháng 4 2021”.

create view v_nhan_vien as
select nv.* 
from nhan_vien nv 
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where nv.dia_chi like'% Đà Nẵng'
and month(hd.ngay_lam_hop_dong) in (4)
and year(hd.ngay_lam_hop_dong) in (2021);

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu”
--  đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.

set sql_safe_updates = 0;
update nhan_vien nv 
set nv.dia_chi = 'Liên Chiểu'
where ma_nhan_vien in (
select * from
(select v_nhan_vien.ma_nhan_vien
from v_nhan_vien) as x);
                
-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng
-- nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang

delimiter // 
create procedure sp_xoa_khach_hang (ma_khach int)
begin
delete from khach_hang
where ma_khach_hang = ma_khach;
end //
delimiter ;
    
call sp_xoa_khach_hang(1);
    
-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong
-- với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung,
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
    
delimiter //
create procedure sp_them_moi_hop_dong(ma_hd int, ngay_lam datetime, ngay_ket_thuc datetime, tien_coc double, ma_nv int, ma_kh int, ma_dich_vu int )
    begin
    set foreign_key_checks = 0; 
    insert into hop_dong(ma_hop_dong,ngay_lam_hop_dong,ngay_het_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
	value(ma_hd,ngay_lam,ngay_ket_thuc,tien_coc,ma_nv,ma_kh,ma_dich_vu);
    set foreign_key_checks = 1;      
	end //
delimiter ;
call sp_them_moi_hop_dong(13,'2022-12-08','2022-12-09',0,3,1,3);
    
 -- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng
 -- hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong
 -- ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
