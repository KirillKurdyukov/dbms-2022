insert into Courses (course_name)
values ('Теоркод'),
       ('Базы данных'),
       ('Software design');

insert into Groups (group_name)
values ('M34391'),
       ('M34381'),
       ('M34371');

insert into Students (student_name, group_id)
values ('Евгений Чернацкий', 1),
       ('Федор Надуткин', 2),
       ('Кирилл Курдюков', 3);

insert into Lectures (lecturer_name)
values ('Трифонов П.В'),
       ('Корнеев Г.А.'),
       ('Киракозов А.Х');

insert into Reports (student_id, course_id, lecturer_id, mark)
values (1, 1, 1, 'A'),
       (1, 2, 2, 'A'),
       (1, 3, 3, 'A'),
       (2, 1, 1, 'A'),
       (2, 2, 2, 'A'),
       (2, 3, 3, 'A'),
       (3, 1, 1, 'A'),
       (3, 2, 2, 'A'),
       (3, 3, 3, 'A');