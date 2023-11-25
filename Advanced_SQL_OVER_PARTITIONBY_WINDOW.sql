/*OVER/ PARTITION BY/ WINDOW STATEMENTS*/



Select
	t.customer_id
	, t.trans_dt
	, t.transaction_id
	, t.items_in_trans
	, t.store_id
	, min (t.items_in_trans) over(partition by t.trans_dt) as min_items_in_trans
	, avg (t.items_in_trans) over(partition by t.trans_dt) as avg_items_in_trans
	, max (t.items_in_trans) over(partition by t.trans_dt) as max_items_in_trans
	, count (t.items_in_trans) over(partition by t.trans_dt) as count_items_in_trans
from
	transactions t
	
select
	t.trans_dt
	, count(t.items_in_trans) as total_count_items_per_day
from
	transactions t
group by
	t.trans_dt
	, t.items_in_trans
order by
	t.trans_dt asc
	
	





/*PART 2*/

Select
	t.*
	, row_number() over(t.trans_dt) as row_num
from
	transactions t
	
	
/*ORDER BY customer_id and trans_dt*/

Select
	t.*
	, row_number() over(t.customer_id, t.trans_dt) as trans_hist_num
from
	transactions t
	
/*How many customers are making multiple purchases per day

for this will need to use the partition and ORDER BY trans_dt*/

Select
	t.*
	, row_number() over(partition by t.customer_id, t.trans_dt order by t.trans_dt) as trans_hist_num
from
	transactions t
;






	
