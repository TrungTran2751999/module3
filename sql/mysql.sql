create table mark(MarkID int not null primary key auto_increment, 
				  SubID int not null,
                  StudentID int not null,
                  Mark float default 0 check(Mark between 0 and 100),
                  unique(subID, StudentID),
                  foreign key (SubID) references subject(SubID),
                  foreign key (StudentID) references student(StudentID))
                  
                  
