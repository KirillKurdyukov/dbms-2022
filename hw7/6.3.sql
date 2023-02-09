-- PostgreSQL 14.5

create function onBadUpdateMark() returns trigger as
$bad_update_mark$
begin
    return old;
end
$bad_update_mark$ language plpgsql;

create trigger PreserveMarks
    before update
    of Mark
    on Marks
    for each row
    when ( old.Mark > new.Mark )
execute function onBadUpdateMark();

