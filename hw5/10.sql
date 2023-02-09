select StudentId,
       coalesce(Total, 0)              as Total,
       coalesce(Passed, 0)             as Passed,
       coalesce(Total - Passed, Total) as Failed
from (select StudentId, count(DISTINCT CourseId) as Total
      from Students
               natural left join Plan
      group by StudentId, GroupId) SIT
         natural left join (select StudentId, GroupId, count(DISTINCT CourseId) as Passed
                            from Students
                                     natural join Marks
                                     natural join Plan
                            group by StudentId, GroupId
) SIP
