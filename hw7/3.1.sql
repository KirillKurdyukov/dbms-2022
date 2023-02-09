update Students
set Marks = (select count(*) from Marks where Students.StudentId = Marks.StudentId)
where StudentId = :StudentId