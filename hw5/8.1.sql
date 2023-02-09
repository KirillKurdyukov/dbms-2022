select SUM(Mark) as SumMark
from Marks
where StudentId = :StudentId
