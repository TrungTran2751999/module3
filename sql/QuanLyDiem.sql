-- INSERT INTO Class
-- VALUES (1, 'A1', '2008-12-20', 1);
-- INSERT INTO Class
-- VALUES (2, 'A2', '2008-12-22', 1);
-- INSERT INTO Class
-- VALUES (3, 'B3', current_date, 0);
-- INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
-- VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
-- INSERT INTO Student (StudentName, Address, Status, ClassId)
-- VALUES ('Hoa', 'Hai phong', 1, 1);
-- INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
-- VALUES ('Manh', 'HCM', '0123123123', 0, 2);
-- INSERT INTO Subject
-- VALUES (1, 'CF', 5, 1),
--        (2, 'C', 6, 1),
--        (3, 'HDJ', 5, 1),
--        (4, 'RDBMS', 10, 1);
-- INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
-- VALUES (1, 1, 8, 1),
--        (1, 2, 10, 2),
--        (2, 1, 12, 1);
-- select * from student
-- select * from student where status = 1
-- select * from subject where credit < 10
-- select student.StudentID, student.StudentName, class.ClassName from class inner join student on student.ClassId = class.ClassId where class.ClassName = 'A1'
select student.StudentID, student.StudentName, mark.Mark, subject.SubName 
from student inner join mark on student.StudentID = mark.MarkID inner join 
subject on subject.SubID = mark.SubID where subject.SubName = 'CF'


