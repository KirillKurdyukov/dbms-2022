delete
from Students
where not exists(select * from Marks where StudentId = Students.StudentId)