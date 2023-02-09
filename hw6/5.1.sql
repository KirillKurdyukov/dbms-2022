select distinct StudentId
from Students, Plan
where Students.GroupId = Plan.GroupId
and Plan.LecturerId in (select LecturerId from Lecturers where LecturerName = :LecturerName)
and StudentId in (select StudentId from Marks where CourseId = Plan.CourseId)