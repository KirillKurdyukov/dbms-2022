-- PK, используется для join'ов.
-- Использую Hash, для наибольшей производительности.
-- ДЗ-5.2.1. С заданным идентификатором (StudentId, StudentName, GroupName по :StudentId).
-- ДЗ-5.2.2. С заданным ФИО (StudentId, StudentName, GroupName по :StudentName).
create unique index unique_group_id on Groups using hash (GroupId);

-- Группы имеют уникальное название.
-- ДЗ-6.1.2. Учащихся в заданной группе (StudentId, StudentName, GroupId по :GroupName).
create unique index unique_group_name on Groups using hash (GroupName);

-- Join + фильтрация по GroupName. Мы быстрее получим GroupId.
-- Мы чаще хотим по GroupName получить GroupId
-- Возможно группировка по GroupName
-- также будет осуществляться по этому индексу.
-- ДЗ-7.1.2. Удаление студентов по :GroupName
-- ДЗ-7.2.4. Перевод всех студентов из группы в группу по названиям (GroupName, FromGroupName).
-- ДЗ-7.2.5. Перевод всех студентов из группы в группу, только если целевая группа существует (GroupName, FromGroupName).
create index filter_by_group_name_and_get_group_id on Groups using btree (GroupName, GroupId);