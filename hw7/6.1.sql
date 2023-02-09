-- PostgreSQL 14.5

create function checkMarkOfStudents() returns trigger as
$check_mark_of_students$
begin
    if (
        exists(select *
               from Students
               where StudentId = new.StudentId
                 and GroupId in (select GroupId from Plan where CourseId = new.CourseId))
        )
    then
        return new;
    else
        return old;
    end if;
end;
$check_mark_of_students$ language plpgsql;

create trigger NoExtraMarks
    before insert or update
    on Marks
    for each row
execute function checkMarkOfStudents()