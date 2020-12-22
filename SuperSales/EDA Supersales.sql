-- Rating of each branch
select 'Branch_'||branch as Branch, avg(rating) as Rating
from supersales
group by branch
order by Rating desc, Branch
;

-- Rating of each branch by Customer Type
select 'Branch_'||branch as Branch, 
customer_type as CustomerType, 
avg(rating) as Rating, 
count(*) as NumberOfTransaction
from supersales
group by branch, customer_type
order by Branch, CustomerType, Rating desc
;

-- Does Gender bring in difference in Customer Experience?
select 'Branch_'||branch as Branch, Gender, avg(rating) as Rating, count(*) as NumberOfTransaction
from supersales
group by branch, Gender
order by Branch, Gender ,Rating desc
;

select branch, 
CAST(AVG(case  when Gender = 'Male' and customer_type = 'Member' then Rating end) as decimal(3,2)) as Male_members,
CAST(AVG(case when Gender = 'Female' and customer_type = 'Member' then Rating end) as decimal(3,2)) as Female_members,
CAST(AVG(case  when Gender = 'Male' and customer_type = 'Normal' then Rating end) as decimal(3,2)) as Male_Non_members,
CAST(AVG(case when Gender = 'Female' and customer_type = 'Normal' then Rating end) as decimal(3,2)) as Female_Non_members
from supersales
group by branch
;











