CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */
        select TOP 1 t.Salary from (
            select Salary
            , Dense_Rank() Over(Order by Salary Desc) as rnk
            from Employee
            ) as t
        where t.rnk = @N
       
    );
END