select Distinct buyer_id from Sales as s where EXISTS (select 1 from Product as p where s.product_id = p.product_id AND product_name = 'S8')
EXCEPT
select Distinct buyer_id from Sales as s where EXISTS (select 1 from Product as p where s.product_id = p.product_id AND product_name = 'iPhone')