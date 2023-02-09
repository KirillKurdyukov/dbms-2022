delete
from Students
where coalesce((select count(*) from Marks where StudentId = Students.studentid group by StudentId), 0) <= 3
