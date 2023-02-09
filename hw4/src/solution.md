## Нормализация БД "Университет".

Дано отношение с атрибутами StudentId, StudentName, GroupId, GroupName, CourseId, CourseName, LecturerId, LecturerName,
Mark.

### Задание 1.

С предыдущего задания имеем следующие функциональные зависимости:

1. StudentId -> StudentName
2. StudentId -> GroupId
3. LecturerId -> LecturerName
4. GroupId -> GroupName
5. CourseId -> CourseName
6. GroupId, CourseId -> LecturerId
7. StudentId, CourseId -> Mark
8. GroupName -> GroupId

### 1НФ

И один единственный ключ { StudentId, CourseId }.

По построению это отношение находиться в 1НФ. Так как есть ключ, нет повторяющихся групп, все атрибуты атомарны.

### 2НФ

Отношение не принадлежит ко второй нормальной форме, так как неключевой атрибут StudentName зависит от части ключа
StudentId, и CourseName функционально зависит от части ключа CourseId и тд.

На практике было сказано, что по GroupId, CourseId -> LecturerId нельзя декомпозировать, так как слева не только часть
ключа. По транзитивности имеем следующую связь StudentId -> StudentName, GroupId, GroupName. Дабы не потерять связи (
GroupId -> GroupName), будем декомпозировать отношение по этой ФЗ.

{ StudentId, StudentName, GroupId, GroupName } - StudentId ключ.

{ StudentId, CourseId, CourseName, LecturerId, LecturerName, Mark } - StudentId, CourseId ключ Почему сохранилась связь
GroupId, CourseId -> LecturerId.

StudentId -> GroupId => StudentId, CourseId -> GroupId, CourseId (по правилу добавлению) =>
по транзитивности StudentId, CourseId -> LecturerId. (Можно заменить?)

{ StudentId, CourseId, CourseName, LecturerId, LecturerName, Mark }

Декомпозиция по CourseId -> CourseName:

{ CourseId, CourseName } { StudentId, CourseId, LecturerId, LecturerName, Mark }

Итого:

{ StudentId, StudentName, GroupId, GroupName } - 2НФ { CourseId, CourseName } - 5НФ, по теореме Дейта - Фейгина 1, так
как все ключи простые (один ключ)
и отношение находится в 3НФ { StudentId, CourseId, LecturerId, LecturerName, Mark } - 2НФ

### 3НФ

{ StudentId, StudentName, GroupId, GroupName } - не принадлежит 3НФ, так как GroupName транзитивно зависит от
StudentId (StudentId -> GroupId, GroupId -> GroupName).

Декомпозиция по последней ФЗ в цепочке.

{ GroupId, GroupName } - GroupId ключ, { StudentId, GroupId, StudentName } - StudentId ключ

{ StudentId, CourseId, LecturerId, LecturerName, Mark } - не принадлежит 3НФ, так как LecturerName транзитивно зависит
от StudentId, CourseId. (StudentId, CourseId -> LecturerId, LecturerId -> LecturerName)

Декомпозиция по LecturerId -> LecturerName

{ LecturerId, LecturerName } - LecturerId ключ { StudentId, CourseId, LecturerId, Mark } - StudentId, CourseId ключ

Итого:

{ CourseId, CourseName } - 5НФ { GroupId, GroupName } - 5НФ по теореме Дейта - Фейгина 1 (аналогично отношению выше)
{ StudentId, GroupId, StudentName } - 5НФ по теореме Дейта - Фейгина 1 (аналогично отношению выше)
{ LecturerId, LecturerName } - 5НФ по теореме Дейта - Фейгина 1 (аналогично отношению выше)
{ StudentId, CourseId, LecturerId, Mark } - НФБК, так 3НФ и неперекрывающиеся ключи (ключ один)

### НФБК

Достигли, за счет теоремы.

### 4НФ

Далее будет доказано, что данные отношения в 5НФ, а оттуда как следствие 4НФ (как было показано на лекции)

### 5НФ

Как было замечено ранее (GroupId, GroupName), (StudentId, GroupId, StudentName),
(CourseId, CourseName), (LecturerId, LecturerName) - 5НФ, по теореме Дейта Фейгина, так как все ключи простые (один
ключ) и отношения находится в 3НФ.

(StudentId, CourseId, LecturerId, Mark) - это отношение в 3НФ и имеет ключ StudentId, CourseId (непростой, теоремой не
обойтись). Значит надключ хотя бы содержит StudentId, CourseId. А чтобы не являться надключом нужно исключить
присутствие этих двух атрибутов.

Пусть это не так, тогда ЗС *{X1, X2 ... Xn}, где какое то Xi - не надключ. Не умоляя общности скажем, что в нем нет
StudentId.

Хорошо будет двигаться направо по кругу. Если Xi+1 не содержит StudentId - хорошо представим, что мы изначально выбрали
его. Иначе мы нашли Xi и Xi+1 у одного нет StudentId, а другого есть. Утверждается, что мы сможем найти такую пару, тк
мы естественным соединением должны получить исходное отношение, где есть атрибут StudentId.

Тогда когда будет происходить естественное соединение Xi и Xi+1, то произойдет стирание части данных, потому что мы не
индифицируем студента в Xi. Таким образом у нас на курсе студенты с одним именем и оценкой слипнуться. Или что - то
около того.

Противоречие.

StudentId, CourseId, LecturerId, Mark } - 5НФ
