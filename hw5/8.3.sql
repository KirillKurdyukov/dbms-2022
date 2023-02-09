select GroupName, SumMark
from Groups
         natural left join
     (
         select GroupId, SUM(Mark) as SumMark
         from Marks
                  natural join Students
         group by GroupId
     ) SISM
         natural join Groups
