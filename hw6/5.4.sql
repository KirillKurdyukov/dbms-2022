select StudentId
from Students s
where not exists(
        select StudentId, Students.GroupId
        from Students,
             Plan,
             Lecturers
        where s.StudentId = StudentId
          and Students.GroupId = Plan.GroupId
          and Lecturers.LecturerId = Plan.LecturerId
          and Lecturers.LecturerName = :LecturerName
          and Plan.CourseId not in (select CourseId from Marks where s.StudentId = StudentId)
    )