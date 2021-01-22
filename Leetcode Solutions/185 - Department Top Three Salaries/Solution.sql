WITH CTE as (
    select Id
    , Name
    , Salary, DepartmentId
    , Dense_Rank() over(Partition by DepartmentId Order by Salary desc) as rnk
    from Employee
)
select d.Name as Department
, c.Name as Employee
, c.Salary from CTE as c JOIN Department as d
on c.DepartmentId = d.Id 
where c.rnk <=3;