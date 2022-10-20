use management_student;

-- Hiển thị số lượng sinh viên ở từng nơi
select address, count(studen_id) as so_luong_sinh_vien
from student
group by address;

-- Tính điểm trung bình các môn học của mỗi học viên
select s.studen_id, s.student_name, avg(mark) as diem_trung_binh
from student s
join mark m on s.studen_id = m.studen_id
group by s.studen_id, s.student_name;

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
select s.studen_id, s.student_name, avg(mark) as diem_trung_binh
from student s
join mark m on s.studen_id = m.studen_id
group by s.studen_id, s.student_name
having avg(mark)>15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
select s.studen_id, s.student_name, avg(mark) as diem_trung_binh
from student s
join mark m on s.studen_id = m.studen_id
group by s.studen_id, s.student_name
having avg(mark) >= all (select avg(mark) from mark group by mark.studen_id);
