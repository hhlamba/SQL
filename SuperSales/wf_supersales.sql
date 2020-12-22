select City, Gender,CAST(Sum(Total) as decimal(36,2)) as sumx,
ROW_NUMBER() OVER(Partition by City ORder by Sum(total) desc) as rn
from supersales
group by City, Gender;
-- RowNumber
-- Rank
-- Dense_Rank
-- NTILE

-- Row Number based on descending Total Revenue for all cities
select City, Gender,CAST(Sum(Total) as decimal(36,2)) as sumx,
ROW_NUMBER() OVER(Partition by City ORder by Sum(total) desc) as rn
from supersales
group by City, Gender;


-- Row Number based on desc Total Revenue for all gender in cities
select City, Gender,CAST(Sum(Total) as decimal(36,2)) as sumx,
ROW_NUMBER() OVER(Partition by City ORder by Sum(total) desc) as rn
from supersales
group by City, Gender;


-- Most revenue generating Product Line in each city
select City, product_line, sum(total),
Row_Number() OVER(Partition by City ORder by sum(total) desc) as rn
from supersales
Group by City, product_line;


-- Favorite product lines based on Gender
select Gender, product_line, sum(total),
Row_Number() OVER(Partition by Gender ORder by sum(total) desc) as rn
from supersales
Group by Gender, product_line;


-- Row_number vs Rank vs Dense_Rank vs Ntile
WITH CTE as
(select gender, product_line, CAST(sum(total) as decimal(10)),
SUM(sum(total)) OVER(partition by Gender) as sumx,
CAST((sum(total)/SUM(sum(total)) OVER(partition by Gender))*100 as decimal(10) )as PCT
from supersales
group by gender, product_line) 
select Gender, Product_line, pct,
ROW_NUMBER() OVER(PARTITION by Gender order by pct desc) as row_num,
RANK() OVER(PARTITION by Gender order by pct desc) as rnk,
DENSE_RANK() OVER(PARTITION by Gender order by pct desc) as drnk,
NTILE(3) OVER(PARTITION by Gender order by pct desc) as ntil
from CTE;




-- Lead and Lag
select GENDER, EXTRACT(MONTH FROM PUR_DATE), SUM(TOTAL),
LAG(SUM(TOTAL)) OVER(partition by Gender order by EXTRACT(MONTH FROM PUR_DATE) ROWS UNBOUNDED PRECEDING) as mnthago1,
LAG(SUM(TOTAL), 2) OVER(partition by Gender order by EXTRACT(MONTH FROM PUR_DATE) ROWS UNBOUNDED PRECEDING) as mnthago2
FROM SUPERSALES
GROUP By GENDER, EXTRACT(MONTH FROM PUR_DATE)
;

