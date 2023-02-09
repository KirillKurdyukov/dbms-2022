-- PK, оптимизирует фильтрацию по StudentId 5.1.1.
-- Оптимизирует join с Marks.
-- ДЗ-5.1.1. С заданным идентификатором (StudentId, StudentName, GroupId по :StudentId).
-- ДЗ-5.2.1. С заданным идентификатором (StudentId, StudentName, GroupName по :StudentId).
-- ДЗ-5.3.1. С заданным идентификатором (StudentId, StudentName, GroupId по :Mark, :CourseId).
create unique index unique_student_id on Students using hash (StudentId);

-- В целом оптимизация в том, что мы
-- Фильтруем по StudentName и быстро находим StudentId.
-- Теоретически может ускорить группировку по студенту.
-- ДЗ-5.1.2. С заданным ФИО (StudentId, StudentName, GroupId по :StudentName).
-- ДЗ-5.2.2. С заданным ФИО (StudentId, StudentName, GroupName по :StudentName).
-- ДЗ-6.1.1. С заданным ФИО (StudentId, StudentName, GroupId по :StudentName).
create index filter_by_student_name_and_get_student_id on Students using btree (StudentName, StudentId);

-- Для оптимизации join'ов с Groups (внешний ключ), Plan
-- ДЗ-5.5.1. Которые у него есть по плану (StudentName, CourseName).
-- ДЗ-5.5.2. Есть, но у него нет оценки (StudentName, CourseName).
-- ДЗ-5.3.3. Которую у него вёл лектор заданный идентификатором (StudentId, StudentName, GroupId по :Mark, :LecturerId).
create index foreign_key_group_id on Students using hash (GroupId);