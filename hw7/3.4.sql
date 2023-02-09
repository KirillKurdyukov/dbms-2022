update Students
set Marks = (select count(distinct CourseId) from Marks where Students.StudentId = Marks.StudentId)
where true