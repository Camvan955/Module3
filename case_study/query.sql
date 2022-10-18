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
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
join loai_khach lk on kh.ma_loai_khach = kh.ma_loai_khach
join dich_vu dv on hd.ma_dich_vu = hd.ma_dich_vu
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hd.ma_hop_dong;









