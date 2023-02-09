create view AllMarks(StudentId, Marks) as
select StudentId,
       (select count(*) from Marks where Students.StudentId = Marks.StudentId) +
       (select count(*) from NewMarks where Students.StudentId = NewMarks.StudentId) as Marks
from Students