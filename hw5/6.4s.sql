select SIGI.StudentId
from (
         select SLMPSI.StudentId, LPGI.GroupId
         from (
                  select StudentId
                  from Students
                           natural join Lecturers
                           natural join Marks
                           natural join Plan
                  where Lecturers.LecturerName = :LecturerName
              ) as SLMPSI
                  cross join (
             select GroupId
             from Lecturers
                      natural join Plan
             where Lecturers.LecturerName = :LecturerName
         ) as LPGI
         except
         select StudentId, SICIGI.GroupId
         from (
                  select S.StudentId, GICI.CourseId, GICI.GroupId
                  from (
                           select StudentId
                           from Students
                                    natural join Lecturers
                                    natural join Marks
                                    natural join Plan
                           where Lecturers.LecturerName = :LecturerName
                       ) as S
                           cross join (
                      select GroupId, CourseId
                      from Lecturers
                               natural join Plan
                      where Lecturers.LecturerName = :LecturerName
                  ) as GICI
                  except
                  select StudentId, CourseId, GroupId
                  from Students
                           natural join Lecturers
                           natural join Marks
                           natural join Plan
                  where LecturerName = :LecturerName
              ) as SICIGI
     ) as SIGI