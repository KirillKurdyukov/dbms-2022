create view Debts(StudentId, Debts) as
select Students.StudentId, count(distinct Plan.CourseId)
from Students
natural join Plan
left join Marks on Plan.CourseId = Marks.CourseId and Students.StudentId = Marks.StudentId
where Marks.Mark is null
group by Students.StudentId