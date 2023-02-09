select StudentId, StudentName, GroupName
from Students as S,
     Groups as G
where S.GroupId = G.GroupId
  and StudentId not in
      (
          select StudentId
          from Marks
          where CourseId in
                (select CourseId from Courses where CourseName = :CourseName)
      )