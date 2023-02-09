create view StudentMarks(StudentId, Marks) as
select StudentId, (select count(*) from Marks where Students.StudentId = Marks.StudentId) as Marks
from Students