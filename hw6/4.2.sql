select StudentName, CourseName
from
    Students, Courses
where StudentId in (select StudentId from Marks where CourseId = Courses.CourseId and Mark <= 2)
  and CourseId in (select CourseId from Plan where GroupId = Students.GroupId)