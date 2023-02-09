-- Защита от того, что у одного студента
-- две оценки по одному и тому же предмету
-- ДЗ-5.6.1. Имеющих хотя бы одну оценку у преподавателя (StudentId по :LecturerName).
-- ДЗ-5.6.2. Не имеющих ни одной оценки у преподавателя (StudentId по :LecturerName).
-- ДЗ-5.6.4. Имеющих оценки по всем дисциплинам преподавателя, которые он вёл у этого студента (StudentId по :LecturerName).
create unique index pk_mark on Marks using btree (StudentId, CourseId);

-- Получение по StudentId его курсов и оценок
-- ДЗ-5.3.3. Которую у него вёл лектор заданный идентификатором (StudentId, StudentName, GroupId по :Mark, :LecturerId).
-- ДЗ-5.3.4. Которую у него вёл лектор, заданный ФИО (StudentId, StudentName, GroupId по :Mark, :LecturerName).
-- ДЗ-5.3.5. Которую вёл лектор, заданный идентификатором (StudentId, StudentName, GroupId по :Mark, :LecturerId).
create index fk_student_id on Marks using btree (StudentId, CourseId, Mark);

-- Получение по CourseId студентов и оценки.
-- ДЗ-5.3.3. Которую у него вёл лектор заданный идентификатором (StudentId, StudentName, GroupId по :Mark, :LecturerId).
-- ДЗ-5.3.4. Которую у него вёл лектор, заданный ФИО (StudentId, StudentName, GroupId по :Mark, :LecturerName).
-- ДЗ-5.3.5. Которую вёл лектор, заданный идентификатором (StudentId, StudentName, GroupId по :Mark, :LecturerId).
create index fk_course_id on Marks using btree (CourseId, StudentId, Mark);