select StudentName, SumMark
from Students
         natural left join
     (
         select StudentId, SUM(Mark) as SumMark
         from Marks
                  natural join Students
         group by StudentId
     ) SISM

