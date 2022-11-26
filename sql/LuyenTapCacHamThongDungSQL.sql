-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT SubName, MAX(credit) FROM `subject` GROUP BY SubName 
HAVING MAX(credit) >= ALL(SELECT MAX(credit) FROM `subject`);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT S.SubName, M.Mark FROM `subject` S join `mark` M on S.SubID = M.SubID GROUP BY S.SubName, M.Mark
HAVING M.Mark >= ALL(SELECT MAX(M.Mark) FROM `mark` M);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT S.StudentID, S.StudentName, AVG(M.Mark) AS average FROM `student` S join `mark` M on S.StudentID = M.StudentID
GROUP BY S.StudentID