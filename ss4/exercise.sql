-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select s.sub_id, s.sub_name,s.status, max(s.credit) 
from subject s;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.sub_id, s.sub_name, s.credit, max(m.mark) as max_mark
from `subject` s 
join mark m on s.sub_id = m.sub_id; 

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.studen_id, s.student_name,avg(m.mark) as diem_trung_binh
from student s
join mark m on s.studen_id = m.studen_id
group by s.studen_id
order by m.mark desc;


