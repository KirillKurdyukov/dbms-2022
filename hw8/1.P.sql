-- Оптимальное получение по CourseId GroupId
-- ДЗ-7.3.5. Число долгов студента (столбец Students.Debts) (StudentId).
-- ДЗ-7.3.6. Число долгов каждого студента (столбец Students.Debts).
-- ДЗ-7.3.7. Число долгов каждого студента группы (столбец Students.Debts) (GroupName).
create index course_id_to_group_id on Plan using btree (CourseId, GroupId);

-- Оптимальное получение по GroupId CourseId
-- ДЗ-7.3.5. Число долгов студента (столбец Students.Debts) (StudentId).
-- ДЗ-7.3.6. Число долгов каждого студента (столбец Students.Debts).
-- ДЗ-7.3.7. Число долгов каждого студента группы (столбец Students.Debts) (GroupName).
create index group_id_to_course_id on Plan using btree (GroupId, CourseId);

-- Оптимизация запроса у каких групп лектор вел предметы.
-- ДЗ-5.3.3. Которую у него вёл лектор заданный идентификатором (StudentId, StudentName, GroupId по :Mark, :LecturerId).
-- ДЗ-5.3.4. Которую у него вёл лектор, заданный ФИО (StudentId, StudentName, GroupId по :Mark, :LecturerName).
-- ДЗ-5.3.5. Которую вёл лектор, заданный идентификатором (StudentId, StudentName, GroupId по :Mark, :LecturerId).
create unique index lecturer_id_to_subjects on Plan using btree (LecturerId, GroupId, CourseId);