update Marks
set Mark = (case
                when coalesce(
                             (select Mark
                              from NewMarks
                              where Marks.StudentId = StudentId
                                and Marks.CourseId = CourseId), 0) >
                     Marks.Mark then (select Mark
                                      from NewMarks
                                      where Marks.StudentId = StudentId
                                        and Marks.CourseId = CourseId)
                else Marks.Mark end)
where true