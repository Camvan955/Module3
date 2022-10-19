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
select month(hd.ngay_lam_hop_dong) as thang, count(hd.ngay_lam_hop_dong) as so_luong_khach_hang
from hop_dong hd
where year(hd.ngay_lam_hop_dong) = 2021
group by thang
order by thang;

-- task 10:
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, sum(hdct.so_luong)
from hop_dong hd
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
group by so_luong;





