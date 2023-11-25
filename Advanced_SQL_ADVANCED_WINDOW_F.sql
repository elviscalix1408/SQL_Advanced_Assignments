/*ADVANCED WINDOWS FUNCTION*/

with transactions_total as (

		Select
			ti.transaction_id
			, sum(p.price) as price
		from
			transaction_items ti
			join
				products p
			on p.product_id = ti.product_id
		group by
				ti.transaction_id


)

, daily_sales_summary as (
		
		select
			t.trans_dt
			, sum(ti.price) as total_sales
		from
			transactions t
				join
					transactions_total ti
						on t.transaction_id = ti.transaction_id
		group by
			t.trans_dt
		order by
			t.trans_dt

)

select
	d.trans_dt
	, d.total_sales
	, cast(avg(d.total_sales) over(order by d.trans_dt rows between 2 preceding and current
							 row) as int) as total_sales_trailing_3d
from
	daily_sales_summary d
order by
	d.trans_dt



/*Result set sums up previous days sales into the next column, adding
previous dates total to current dates total*/
select
	d.trans_dt
	, d.total_sales
	, sum(d.total_sales) over(order by d.trans_dt) running_total_sales
from
	daily_sales_summary d
order by
	d.trans_dt
	
	
/*What if we wanted to do mathematical operations over a couple of rows
instead of all the rows

This is where between operator can work*/


select
	d.trans_dt
	, d.total_sales
	, sum(d.total_sales) over(order by d.trans_dt rows between unbounded preceding and current
							 row) as running_total_sales
from
	daily_sales_summary d
order by
	d.trans_dt
	
/*output column trailing 3 days of sales

Current row, and two prior rows pulled together and summed up*/

select
	d.trans_dt
	, d.total_sales
	, sum(d.total_sales) over(order by d.trans_dt rows between 2 preceding and current
							 row) as total_sales_trailing_3rd
from
	daily_sales_summary d
order by
	d.trans_dt 
	
	
/*1 preceding and one following*/.

select
	d.trans_dt
	, d.total_sales
	, sum(d.total_sales) over(order by d.trans_dt rows between 1 preceding and 1 following
							 ) as total_sales_trailing_3rd
from
	daily_sales_summary d
order by
	d.trans_dt 
	

/*Run the AVG*/

select
	d.trans_dt
	, d.total_sales
	, cast(avg(d.total_sales) over(order by d.trans_dt rows between 2 preceding and current
							 row) as int) as total_sales_trailing_3d
from
	daily_sales_summary d
order by
	d.trans_dt 