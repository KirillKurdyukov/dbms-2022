select StudentName, CourseName
from Students,
     Courses,
     (
         select StudentId, CourseId
         from Marks
         union
         select StudentId, CourseId
         from Students,
              Plan
         where Students.GroupId = Plan.GroupId
     ) as SICISICI
where Students.StudentId = SICISICI.StudentId
  and Courses.CourseId = SICISICI.CourseId