select StudentName, CourseName
from Students,
     Courses
where GroupId in (select GroupId from Plan where Plan.CourseId = Courses.CourseId)
  and StudentId not in (select StudentId from Marks where Mark > 2 and Marks.CourseId = Courses.CourseId)