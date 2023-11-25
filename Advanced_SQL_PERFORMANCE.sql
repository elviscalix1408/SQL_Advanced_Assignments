/*Understanding performance*/

select
	t.trans_dt
  , t.transaction_id
  , sum(p.price) --- plus aggregate function
from
  	transactions t
	
		join transaction_items ti
			on t.transaction_id = ti.transaction_id --- three joins, a no no, too hard to QA, bugs slip in

		join products p
			on p.product_id = ti.product_id
group by
	t.trans_dt
  , t.transaction_id
  
  
  
 /*Good code for good performance, better performance*/
 
 select
	t.trans_dt
  , t.transaction_id
  , ti.price
from
  	transactions t
	
		join (
				select
					  ti.transaction_id
  					, sum(p.price) as price
				from
					transaction_items ti
						
						join products p
						   on p.product_id = ti.product_id
				group by
					ti.transaction_id
			  ) ti
				  on t.transaction_id = ti.transaction_id
				  
/*CTE better*/

with transaction_totals as (
	select
		  ti.transaction_id
		, sum(p.price) as price
	from
		transaction_items ti

			join products p
			   on p.product_id = ti.product_id
	group by
		ti.transaction_id
)

select
	t.trans_dt
  , t.transaction_id
  , ti.price
from
  	transactions t
	
		join transaction_totals ti
			on t.transaction_id = ti.transaction_id

/**/

with transaction_totals as (
	select
		  ti.transaction_id
		, sum(p.price) as price
	from
		transaction_items ti

			join products p
			   on p.product_id = ti.product_id
	group by
		ti.transaction_id
)

select
	t.trans_dt
  , t.transaction_id
  , ti.price
from
  	transactions t
	
		join transaction_totals ti
			on t.transaction_id = ti.transaction_id

/*create TEMP table -- in memory table

use is you will be doing a lot of coding

To run smaller blocks of code

Knowing order of operations*/

create temp table transaction_totals as (
	select
		  ti.transaction_id
		, sum(p.price) as price
	from
		transaction_items ti

			join products p
			   on p.product_id = ti.product_id
	group by
		ti.transaction_id
)
;

select
	t.trans_dt
  , t.transaction_id
  , ti.price
from
  	transactions t
	
		join transaction_totals ti
			on t.transaction_id = ti.transaction_id
			
			
/**/




  