update Students
set Debts = (select count(distinct CourseId)
             from Plan
             where Plan.GroupId = Students.GroupId
               and not exists(select *
                              from Marks
                              where Marks.CourseId = Plan.CourseId
                                and Marks.StudentId = Students.StudentId)),
    Marks = (select count(*) from Marks where StudentId = Students.StudentId)
where true