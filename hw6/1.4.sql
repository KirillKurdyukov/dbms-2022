select *
from Students
where StudentId in (
    select StudentId
    from Marks
    where Mark = :Mark
    and CourseId in (select CourseId from Courses where CourseName = :CourseName)
)