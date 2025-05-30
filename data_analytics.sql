/*SELECT * FROM public.df_orders
ORDER BY order_id ASC;*/

--find top 10 highest reveue generating products 

--select sum(quantity*sale_price) as revenue,product_id from public.df_orders group by product_id order by sum(quantity*sale_price) desc limit 10;

--find top 5 highest selling products in each region

WITH CTE as
(SELECT
	dense_rank() over(partition by d.region order by (d.quantity*d.sale_price) desc) as rn,
	d.product_id,
  d.region,
  (d.quantity*d.sale_price) revenue
FROM public.df_orders d
ORDER BY d.region,revenue desc)
select * from cte c where c.rn <=5 order by c.region


--
with cte as (
select region,product_id,sum(quantity*sale_price) as sales
from df_orders
group by region,product_id)
select * from (
select *
, row_number() over(partition by region order by sales desc) as rn
from cte) A
where rn<=5 order by A.region

---find month over month growth comparison for 2022 and 2023 sales eg : jan 2022 vs jan 2023

with CTE as 
	(SELECT
	TO_CHAR(ORDER_DATE, 'MM') AS month,
	TO_CHAR(ORDER_DATE, 'YYYY') AS year,
	SUM(QUANTITY * SALE_PRICE) SALES
FROM
	DF_ORDERS
GROUP BY
	TO_CHAR(ORDER_DATE, 'MM'),
	TO_CHAR(ORDER_DATE, 'YYYY'))

SELECT
	month,
	
		sum(CASE
			WHEN YEAR = '2022' THEN SALES
			ELSE 0
		END)
	 AS "sales_2022",
	
		sum(CASE
			WHEN YEAR = '2023' THEN SALES
			ELSE 0
		END)
	 AS "sales_2023"
FROM
	CTE group by month order by month;

-----for each category which month had highest sales 
WITH CTE as(
select category,to_char(order_date,'MM-YYYY') as "month" ,sum(quantity*sale_price) sales from DF_ORDERS group by category,"month" order by category,month),
CTE_2 as(select row_number() over (partition by category order by sales desc) rn,* from cte)

select * from CTE_2 where rn = 1

;

---which sub category had highest growth by profit in 2023 compare to 2022
WITH CTE as
(select sub_category,to_char(order_date,'YYYY') as year, profit from df_orders),
CTE_2 as
(select sub_category, sum(case when year = '2022' then profit else 0 end) "2022",sum(case when year = '2023' then profit else 0 end) "2023" from CTE group by sub_category)

select sub_category, ("2023"-"2022") growth from CTE_2 order by growth desc limit 1;




