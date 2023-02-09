-- Количество отличников в группе >= 91 :GroupName
select count(*)
from Students
         natural join Groups
         natural join Plan
where 91 <= all (select Mark
                 from Marks
                 where Marks.StudentId = Students.StudentId
                   and Plan.CourseId = Marks.CourseId);