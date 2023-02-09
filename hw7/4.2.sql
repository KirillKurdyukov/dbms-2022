update Marks
set Mark = (select Mark from NewMarks where Marks.StudentId = StudentId and Marks.CourseId = CourseId)
where exists(select Mark from NewMarks where Marks.StudentId = StudentId and Marks.CourseId = CourseId)