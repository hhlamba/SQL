SELECT item_category as Category,
SUM(CASE WHEN DATEPART(WEEKDAY, order_date) = 2 THEN quantity ELSE 0 END) AS Monday,
SUM(CASE WHEN DATEPART(WEEKDAY, order_date) = 3 THEN quantity ELSE 0 END) AS Tuesday,
SUM(CASE WHEN DATEPART(WEEKDAY, order_date) = 4 THEN quantity ELSE 0 END) AS Wednesday,
SUM(CASE WHEN DATEPART(WEEKDAY, order_date) = 5 THEN quantity ELSE 0 END) AS Thursday,
SUM(CASE WHEN DATEPART(WEEKDAY, order_date) = 6 THEN quantity ELSE 0 END) AS Friday,
SUM(CASE WHEN DATEPART(WEEKDAY, order_date) = 7 THEN quantity ELSE 0 END) AS Saturday,
SUM(CASE WHEN DATEPART(WEEKDAY, order_date) = 1 THEN quantity ELSE 0 END) AS Sunday
FROM Orders O RIGHT JOIN Items I ON O.item_id = I.item_id
GROUP BY item_category
ORDER BY item_category;