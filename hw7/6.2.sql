-- PostgreSQL 14.5

create function checkAllMarksOnGroups() returns trigger as
$check_all_marks_on_groups$
DECLARE
    i record;
    j record;
begin
    for i in select * from Students
        loop
            for j in select * from Students
                loop
                    if (i.GroupId = j.GroupId and (select count(*) from Marks where i.StudentId = Marks.StudentId) <>
                                                  (select count(*) from Marks where j.StudentId = Marks.StudentId)) then
                        raise exception 'Fail update / insert Marks table';
                    end if;
                end loop;
        end loop;

    return null;
end
$check_all_marks_on_groups$ language plpgsql;

create trigger SomeMarks
    after update or insert
    on Marks
    for each statement
    execute function checkAllMarksOnGroups();

-- насчет второго триггера не уверен. Ибо добавлять студентов / переводить хотелось бы без проверки отметок. trade-off
create trigger SomeStudents
    after update or insert
    on Marks
   for each statement
execute function checkAllMarksOnGroups();