create view StudentDebts(StudentId, Debts) as
select StudentId,
       (select count(distinct CourseId)
        from Plan
        where Plan.GroupId = Students.GroupId
          and not exists(select *
                         from Marks
                         where Marks.StudentId = Students.StudentId
                           and Marks.CourseId = Plan.CourseId)) as Debts
from Students