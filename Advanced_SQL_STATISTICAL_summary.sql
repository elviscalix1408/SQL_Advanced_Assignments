/*STATISTICAL SUMMARY*/

/*Create a CTE for the transaction totals

we need to grab transactions_items Join them to the products tables to get the price

We need to get the amount of dollars that were spent per individual transaction

Then we will do a statistical summary over those transactions*/


with transaction_totals as(
		
		Select
			ti.transaction_id
			, sum(p.price) as total_sales
		from
			transaction_items ti
			join products p
		on p.product_id = ti.product_id
	group by
		ti.transaction_id

)

, trans_sales as (
		
		select
		t.trans_dt
		, t.transaction_id
		, ti.total_sales
		, ntile(4) over(order by ti.total_sales asc) as quartile
	from
		transactions t
			join
				transaction_totals ti
			on t.transaction_id = ti.transaction_id

)

, quartile_summary as (
	
		Select
			s.quartile
			, min(s.total_sales) as total_sales
		from
			trans_sales s
		group by
			s.quartile
		order by
			s.quartile
)

, total_sales_summary as (
		select
			 avg(s.total_sales) as avg_total_sales
			,  min(s.total_sales) as min_total_sales
			,  max(s.total_sales) as max_total_sales
	
		from 
			trans_sales s

)

	
select
	s.avg_total_sales
	, s.min_total_sales
	, s.max_total_sales
	, max(case when q.quartile = 1 then q.total_sales else 0 end)as quartile_1_total_sales
	, max(case when q.quartile = 2 then q.total_sales else 0 end)as median_total_sales
	, max(case when q.quartile = 3 then q.total_sales else 0 end)as quartile_3_total_sales
from
	total_sales_summary s
	, quartile_summary  q
group by
	s.avg_total_sales
	, s.min_total_sales
	, s.max_total_sales
	
