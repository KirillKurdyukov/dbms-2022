-- PK, Оптимизация join'ов
-- ДЗ-5.3.4. Которую у него вёл лектор, заданный ФИО (StudentId, StudentName, GroupId по :Mark, :LecturerName).
-- ДЗ-5.6.1. Имеющих хотя бы одну оценку у преподавателя (StudentId по :LecturerName).
-- ДЗ-5.6.2. Не имеющих ни одной оценки у преподавателя (StudentId по :LecturerName).
create unique index unique_lecturer_id on Lecturers using hash (LecturerId);

-- Быстрая фильтрация по имени и получение LecturerId
-- ДЗ-5.3.4. Которую у него вёл лектор, заданный ФИО (StudentId, StudentName, GroupId по :Mark, :LecturerName).
-- ДЗ-5.6.1. Имеющих хотя бы одну оценку у преподавателя (StudentId по :LecturerName).
-- ДЗ-5.6.2. Не имеющих ни одной оценки у преподавателя (StudentId по :LecturerName).
create index filter_by_lecturer_name_and_get_lecturer_id on Lecturers using btree(LecturerName, LecturerId);