delete
from Students as s
where coalesce((select count(distinct CourseId)
                from Plan as p
                where s.GroupId = p.GroupId
                  and not exists(select *
                                 from Marks
                                 where s.StudentId = Marks.StudentId
                                   and p.CourseId = Marks.CourseId)), 0) >= 2