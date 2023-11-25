/*PERCENT RANK*/

select
	t.*
	, percent_rank() over(order by t.items_in_trans) as perc_rank
from
	transactions t
where
	t.trans_dt = '2022-1-12'