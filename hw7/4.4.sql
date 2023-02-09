merge into Marks
using NewMarks as NM
on Marks.CourseId = NM.CourseId and Marks.StudentId = NM.StudentId
when matched and NM.Mark > Marks.Mark then update set Mark = NM.Mark
when not matched then insert (StudentId, CourseId, Mark) values (NM.StudentId, NM.CourseId, NM.Mark);
