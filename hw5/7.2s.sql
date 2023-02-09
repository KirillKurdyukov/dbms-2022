select GroupName, CourseName from Groups
natural join Courses
natural join (
    select Students.GroupId, Marks.CourseId
    from Marks
             cross join Students
    except
    select CIGICIGI.GroupId, CIGICIGI.CourseId
    from (
             select Marks.CourseId, Students.StudentId, Students.GroupId
             from Marks
                      cross join Students
             except
             select Marks.CourseId, Students.StudentId, Students.GroupId
             from Marks
                      natural join students
         ) as CIGICIGI
) as GICIGICI