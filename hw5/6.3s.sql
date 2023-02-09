select StudentId
from Marks
except
select StudentId
from (
         select Marks.StudentId, LPCI.CourseId
         from Marks
                  cross join (
             select CourseId
             from Lecturers
                      natural join Plan
             where LecturerName = :LecturerName
         ) as LPCI
         except
         select StudentId, CourseId
         from Marks
     ) as MASISICI
