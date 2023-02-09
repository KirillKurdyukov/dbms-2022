insert into Marks
select StudentId, CourseId, Mark
from NewMarks
where not exists(select StudentId, CourseId
                 from Marks
                 where StudentId = NewMarks.StudentId and CourseId = NewMarks.CourseId)