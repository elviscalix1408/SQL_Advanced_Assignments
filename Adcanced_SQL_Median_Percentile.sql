/*PERCENTILES*/

with trans_items_percentiles as (
			
		Select
			t.*
			, ntile (100) over(order by items_in_trans) as percentile
		from
			transactions t
		where
			t.trans_dt = '2022-01-12'

)


Select
	min(t.items_in_trans) as items_in_trans
from
	trans_items_percentiles t
where
	t.percentile >= .50