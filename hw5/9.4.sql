select GroupName, AvgAvgMark
from Groups
         natural left join (
    select GroupId, avg(cast(AvgMark as float)) as AvgAvgMark
    from (
             select GroupId, AvgMark
             from Students
                      natural left join
                  (
                      select StudentId, avg(cast(Mark as float)) as AvgMark
                      from Marks
                               natural join Students
                      group by StudentId, GroupId
                  ) SISM
         ) as GNAM
    group by GroupId
) as GIAAM

