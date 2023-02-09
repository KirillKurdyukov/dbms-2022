select GroupName, AvgMark
from Groups
         natural left join
     (
         select GroupId, avg(cast(Mark as float)) as AvgMark
         from Marks
                  natural join Students
         group by GroupId
     ) SISM
         natural join Groups