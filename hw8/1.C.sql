-- PK, ускоряет нахождение по CourseId
-- Также оптимизирует join'ы
-- ДЗ-5.5.1. Которые у него есть по плану (StudentName, CourseName).
-- ДЗ-5.5.2. Есть, но у него нет оценки (StudentName, CourseName).
-- ДЗ-5.5.3. Есть, но у него не 4 или 5 (StudentName, CourseName).
create unique index unique_course_id on Courses using hash (CourseId);

-- Фильтрация по CourseName
-- и быстрое получение по ней CourseId.
-- Для дальнейших join'ов.
-- ДЗ-5.3.2. С заданным названием (StudentId, StudentName, GroupId по :Mark, :CourseName).
-- ДЗ-5.4.1. Среди всех студентов (StudentId, StudentName, GroupId по :CourseName).
-- ДЗ-5.4.2. Среди студентов, у которых есть эта дисциплина (StudentId, StudentName, GroupId по :CourseName)
create index filter_by_course_name_and_get_course_id on Courses using btree (CourseName, CourseId);