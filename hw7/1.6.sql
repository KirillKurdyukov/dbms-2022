delete
from Students as s
where exists(select *
             from Plan as p
             where s.GroupId = p.GroupId
               and not exists(
                     select *
                     from Marks
                     where Marks.CourseId = p.CourseId
                       and Marks.StudentId = s.StudentId
                 )
          )