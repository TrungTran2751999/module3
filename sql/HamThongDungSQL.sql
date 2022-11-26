SELECT Address, COUNT(Address) as 'CountAddress' FROM student group by Address;
SELECT S.StudentID, S.StudentName, AVG(M.mark) FROM student S join mark M on S.StudentID = M.StudentID GROUP BY S.StudentID, S.StudentName;
SELECT S.StudentID, S.StudentName, AVG(M.mark) FROM student S join mark M on S.StudentID = M.StudentID GROUP BY S.StudentID, S.StudentName HAVING AVG(M.mark) > 15;
SELECT S.StudentID, S.StudentName, AVG(M.mark) FROM student S join mark M on S.StudentID = M.StudentID GROUP BY S.StudentID, S.StudentName HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);