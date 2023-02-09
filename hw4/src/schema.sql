create table Groups
(
    group_id   int     not null generated always as identity,
    group_name char(6) not null,

    primary key (group_id),

    unique (group_name)
);

create table Students
(
    student_id   int         not null generated always as identity,
    student_name varchar(30) not null,
    group_id     int         not null,

    primary key (student_id),

    foreign key (group_id) references Groups (group_id)
);

create table Lectures
(
    lecturer_id   int         not null generated always as identity,
    lecturer_name varchar(30) not null,

    primary key (lecturer_id)
);

create table Courses
(
    course_id   int         not null generated always as identity,
    course_name varchar(35) not null,

    primary key (course_id)
);

create table Reports
(
    student_id  int  not null,
    course_id   int  not null,
    lecturer_id int  not null,
    mark        char not null,

    primary key (student_id, course_id),

    foreign key (student_id) references Students (student_id),
    foreign key (course_id) references Courses (course_id),
    foreign key (lecturer_id) references Lectures (lecturer_id)
);
