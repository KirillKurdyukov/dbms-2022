select StudentId
from Students s
where not exists(
        select CourseId
        from (
                 select CourseId
                 from Plan
                 where LecturerId in (
                     select LecturerId
                     from Lecturers
                     where LecturerName = :LecturerName
                 )
             ) as PCI
        where s.StudentId not in (select StudentId from Marks where CourseId = PCI.CourseId)
    )