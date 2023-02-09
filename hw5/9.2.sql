select StudentName, AvgMark
from Students
         natural left join
     (
         select StudentId, avg(cast(Mark as float)) as AvgMark
         from Marks
         group by StudentId
     ) SISM