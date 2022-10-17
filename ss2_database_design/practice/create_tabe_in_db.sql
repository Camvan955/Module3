create database quan_ly_diem_thi;

use quan_ly_diem_thi;

create table hoc_sinh(
ma_hs varchar(10) primary key,
ten_hs varchar(45),
ngay_sinh date,
lop varchar(20),
gioi_tinh bit(1)
);

create table mon_hoc(
ma_mon_hoc varchar(20) primary key,
ten_mon_hoc varchar(20),
ma_gv varchar(10),
foreign key (ma_gv) references giao_vien(ma_gv)
);

create table bang_diem(
ma_hs varchar(10),
ma_mon_hoc varchar(20),
diem_thi double,
ngay_kt date,
primary key (ma_hs, ma_mon_hoc),
foreign key (ma_hs) references hoc_sinh(ma_hs),
foreign key (ma_mon_hoc) references mon_hoc(ma_mon_hoc)
);

create table giao_vien(
ma_gv varchar(10) primary key,
ten_gv varchar(45),
so_dien_thoai varchar(15)
);