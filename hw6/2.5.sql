select StudentId, StudentName, GroupName
from Students as S,
     Groups as G
where S.GroupId = G.GroupId
  and StudentId not in
      (select StudentId from Marks where CourseId in (select CourseId from Courses where CourseName = :CourseName))
  and S.GroupId in
      (
          select GroupId
          from Plan
          where CourseId in
                (select CourseId from Courses where CourseName = :CourseName)
      )