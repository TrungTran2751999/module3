select * from student;
select * from student where status = 1;
select * from subject where credit < 10;
select student.StudentID, student.StudentName, class.ClassName from class inner join student on student.ClassId = class.ClassId where class.ClassName = 'A1';
select student.StudentID, student.StudentName, mark.Mark, subject.SubName 
from student inner join mark on student.StudentID = mark.MarkID inner join 
subject on subject.SubID = mark.SubID where subject.SubName = 'CF'