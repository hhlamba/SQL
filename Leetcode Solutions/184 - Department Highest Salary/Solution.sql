with cte as (
    select DepartmentId
    , Id
    , Name
    , Salary
    , Rank() OVER(partition by DepartmentId order by Salary desc) as rnk
    from Employee
)
select d.Name as Department
, c.Name as Employee
, c.Salary from CTE as c join Department as d 
on c.DepartmentId = d.Id
where rnk = 1