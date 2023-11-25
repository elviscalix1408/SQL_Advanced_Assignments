/*QUARTILES*/

/*NTILE is the window command to produce quartiles*/

select
	t.*
	, ntile(4) over(order by t.items_in_trans) as quartile
from
	transactions t
where
	t.trans_dt = '2022-01-12'
	
/*Change the '4' in the NTILE window function to a '100' to produce
percentile*/
	
select
	t.*
	, ntile(100) over(order by t.items_in_trans) as percentile
from
	transactions t
where
	t.trans_dt = '2022-01-12'
	
/*Next I am instructed to add a CTE to refrence the percentile data*/

with trans_items_quartiles as (
				select
					t.*
					, ntile(4) over(order by t.items_in_trans) as quartiles
				from
					transactions t
				where
					t.trans_dt = '2022-01-12'

)

Select
	t.quartiles
	, min(t.items_in_trans) as min_items_in_trans
from
	trans_items_quartiles t
group by
	t.quartiles
