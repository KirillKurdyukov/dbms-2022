select GroupName, CourseName
from Groups,
     Courses
where not exists(
        select StudentId, GroupId
        from Students
        where Students.GroupId = Groups.GroupId
          and StudentId not in (select StudentId from Marks where Marks.CourseId = Courses.CourseId)
    )