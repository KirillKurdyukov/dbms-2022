select *
from Students
where StudentId in (select StudentId from Marks where CourseId = :CourseId and Mark = :Mark)