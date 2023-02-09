delete
from Students
where (select count(*) from Marks where StudentId = Students.studentid group by StudentId) >= 3