-- Вывести курсы, которые ведет преподаватель :LecturerId
select CourseName
from Courses
natural join Plan
where LecturerId = :LecturerId;