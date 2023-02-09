## Функциональные зависимости в БД "Университет".

Дано отношение с атрибутами StudentId, 
StudentName, GroupId, GroupName, CourseId, CourseName, LecturerId, LecturerName, Mark.

###Задание 1.

1. StudentId -> StudentName, GroupId, GroupName
2. LecturerId -> LecturerName
3. GroupId -> GroupName
4. CourseId -> CourseName
5. GroupId, CourseId -> LecturerId
6. StudentId, CourseId -> Mark
7. GroupName -> GroupId // Уникальное имя группы

###Задание 2.

{ StudentId, StudentName, GroupId, GroupName, CourseId, CourseName, LecturerId, LecturerName, Mark }

По ФЗ 1.1 можно вычеркнуть StudentName, GroupId, GroupName. Так они выводимы из StudentId.

{ StudentId, ~~StudentName~~, ~~GroupId~~, ~~GroupName~~, CourseId, CourseName, LecturerId, LecturerName, Mark }

По ФЗ 1.2 можно вычеркнуть LecturerName. Так как оно выводимо из LecturerId

{ StudentId, CourseId, CourseName, LecturerId, ~~LecturerName~~, Mark }

По ФЗ 1.4 и ФЗ 1.6 можно вычеркнуть CourseName, так как выводимо из CourseId, 
и Mark, так как выводимо из StudentId, CourseId.

{ StudentId, CourseId, ~~CourseName~~, LecturerId, ~~Mark~~ }

По ФЗ 1.1 и 1.5 можно вычеркнуть LecturerId. (Так как GroupId содержится в ФЗ 1.5)

И того имеем надключ { StudentId, CourseId }. 
Надключ потому что проделав все шаги выше в обратном порядке, мы получим что наше замыкание атрибутов.

Докажем, что это ключ: 

1. { StudentId, ~~CourseId~~ }, замыкание { StudentId } = { StudentId, StudentName, GroupId, GroupName }
2. { ~~StudentId~~, CourseId }, замыкание { CourseId } = { CourseId, CourseName }

Итого { StudentId, CourseId } - ключ.

Докажем, что он единственный:

1. Без StudentId не существует надключа, так как он не находится в правой части. 
2. Без CourseId не существует надключа, так как он не находится в правой части.

=> Все надключи содержат атрибуты StudentId, CourseId => StudentId, CourseId - единственный ключ.

### Задания 3. 

#### 3.1 Замыкание { GroupId, CourseId }.

1. ФЗ 1.3 { GroupId, GroupName, CourseId }
2. ФЗ 1.4 и ФЗ 1.5 { GroupId, GroupName, CourseId, CourseName, LecturerId }
3. ФЗ 1.2 { GroupId, GroupName, CourseId, CourseName, LecturerId, LecturerName }

Итого { GroupId, GroupName, CourseId, CourseName, LecturerId, LecturerName }.

#### 3.2 Замыкание { StudentId, CourseId }

{ StudentId, StudentName, GroupId, GroupName, CourseId, CourseName, LecturerId, LecturerName, Mark }

Так как ключ. 

#### 3.3 Замыкание { StudentId, LecturerId }

1. ФЗ 1.1 и ФЗ 1.2 { StudentId, StudentName, GroupId, GroupName, LecturerId, LecturerName }

Итого { StudentId, StudentName, GroupId, GroupName, LecturerId, LecturerName }

### Задание 4. 

Расщипление правых частей: 

1. StudentId -> StudentName
2. StudentId -> GroupId
3. StudentId -> GroupName
4. LecturerId -> LecturerName
5. GroupId -> GroupName
6. CourseId -> CourseName
7. GroupId, CourseId -> LecturerId
8. StudentId, CourseId -> Mark
9. GroupName -> GroupId

Попытка удаление атрибута в левой части ФЗ.

GroupId, ~~CourseId~~ -> LecturerId
замыкание { GroupId } = { GroupId, GroupName }, что не содержит LecturerId

~~GroupId~~, CourseId -> LecturerId
замыкание { CourseId } = { CourseId, CourseName }, что не содержит LecturerId

StudentId, ~~CourseId~~ -> Mark
замыкание { StudentId } = { StudentId, GroupId, StudentName, GroupName }, что не содержит Mark

~~StudentId~~, CourseId -> Mark
замыкание { CourseId } = { CourseId, CourseName }, что не содержит Mark

Попытка удаление ФЗ из S.

1. StudentId -> StudentName
2. StudentId -> GroupId
3. ~~StudentId -> GroupName~~
4. LecturerId -> LecturerName
5. GroupId -> GroupName
6. CourseId -> CourseName
7. GroupId, CourseId -> LecturerId
8. StudentId, CourseId -> Mark
9. GroupName -> GroupId

Удалим первую ФЗ  => замыкание { StudentId } / (StudentId -> StudentName) не содержит StudentName, 
так как его больше нет в правой части => удалить нельзя

Удалим вторую ФЗ => замыкание { StudentId } / (StudentId -> GroupId) не содержит GroupId,
так как его больше нет в правой части => удалить нельзя

Удалим третью ФЗ => замыкание { StudentId } / (StudentId -> GroupName) = 
{ StudentId, StudentName, GroupId, GroupName } => можно удалить, так как содержит GroupName

Удалим четвертую ФЗ => замыкание { LecturerId } / (LecturerId -> LecturerName) = {} не содержит LecturerName,
так как его больше нет в правой части => удалить нельзя

Удалим пятую ФЗ => замыкание { GroupId } / (GroupId -> GroupName) = {} не содержит GroupName,
так как его больше нет в правой части => удалить нельзя

Удалим шестую ФЗ => замыкание { CourseId } / (CourseId -> CourseName) = {} не содержит CourseName,
так как его больше нет в правой части => удалить нельзя

Удалим седьмую ФЗ => замыкание { GroupId, CourseId } / (GroupId, CourseId -> LecturerId) не содержит LecturerId,
так как его больше нет в правой части => удалить нельзя

Удалим восьмую ФЗ => замыкание { StudentId, CourseId } / (StudentId, CourseId -> Mark) не содержит Mark,
так как его больше нет в правой части => удалить нельзя

Удалим девятую ФЗ => замыкание { GroupName } / (GroupName -> GroupId) = {} не содержит GroupId

Итого:

1. StudentId -> StudentName
2. StudentId -> GroupId
3. LecturerId -> LecturerName
4. GroupId -> GroupName
5. CourseId -> CourseName
6. GroupId, CourseId -> LecturerId
7. StudentId, CourseId -> Mark
8. GroupName -> GroupId
