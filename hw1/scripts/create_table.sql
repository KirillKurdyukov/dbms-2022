create table Groups
(
    group_id int,
    group_no char(6)
);

create table Students
(
    student_id int,
    name varchar(30),
    group_id int
);