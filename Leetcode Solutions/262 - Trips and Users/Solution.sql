select a1.Day
, CAST(ROUND(CAST(Cancelled AS DECIMAL(3,2))/total,2) as decimal(3,2)) as 'Cancellation Rate'
from (
    select Request_at as Day
    , sum(CASE WHEN left(Status,3) = 'can' THEN 1  ELSE 0 END) as 'Cancelled'
    , count(*) as total
    from Trips as t 
    where EXISTS (select 1 from Users as u1 where u1.Users_Id = t.Driver_Id and u1.Banned = 'No') 
    AND   EXISTS (select 1 from Users as u2 where u2.Users_Id = t.Client_Id and u2.Banned = 'No') 
    group by Request_at
) as a1
where Day between '2013-10-01' AND '2013-10-03'