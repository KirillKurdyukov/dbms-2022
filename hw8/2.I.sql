-- Получение по курсу отметок студентов
create index getting_mark_by_course_id on Marks using btree (CourseId, StudentId, Mark);

-- Получение студентов группы
create index getting_students_by_group on Students using btree (GroupId, StudentId);