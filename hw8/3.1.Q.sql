-- Студенты с такой то оценкой по такому курсу
select StudentId, StudentName
from Students
where StudentId in (select StudentId
                    from Marks
                    where CourseId = :CourseId
                      and Mark = :Mark);