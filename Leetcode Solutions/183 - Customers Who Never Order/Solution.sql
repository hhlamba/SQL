select Name as Customers 
from Customers as c 
where not exists (
    select 1 
    from Orders as o 
    where o.CustomerId = c.Id
)