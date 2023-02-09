select StudentName, CourseName
from Students,
     Courses
where StudentId not in (select StudentId from Marks where CourseId = Courses.CourseId)
  and CourseId in (select CourseId from Plan where GroupId = Students.GroupId)
