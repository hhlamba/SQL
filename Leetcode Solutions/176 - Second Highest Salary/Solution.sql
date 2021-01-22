select Max(Salary) as SecondHighestSalary
from Employee 
where Salary < (select Max(Salary) from Employee)