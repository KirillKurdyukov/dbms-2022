select avg(cast(Mark as float)) as AvgMark
from Students
         natural join Marks
where Students.GroupId = :GroupId
  and Marks.CourseId = :CourseId;