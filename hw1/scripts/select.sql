select group_id, group_no
from groups;

select student_id, name, group_id
from students;

select name, group_no
from students
         natural join groups;

select name, group_no
from students
         inner join groups on students.group_id = groups.group_id;
