SELECT * FROM quanlysinhvien.class;
select studentName from student where substring(studentName, 1, 1) = "h"; 
select class.StartDate from class where month(class.Startdate) = 12;
select subname from `subject` where credit between 3 and 5;
select studentId from student where studentname = "Hung";

set @ggg = (select studentId from student where studentname = "Hung");
update student set student.classId = 2 where studentId = @ggg;

select student.StudentName, `subject`.SubName, mark.Mark from student join mark
on student.StudentID = mark.StudentID join subject on mark.StudentID = subject.SubID
order by mark desc, student.StudentName asc;