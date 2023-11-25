/*RANK*/

select
	t.*
	, rank() over(order by t.items_in_trans desc) as rank_val
from
	transactions t
where
	t.trans_dt = '2022-01-12'
	
	
	/*DENSE_RANK*/
	
select
	t.*
	, dense_rank() over(order by t.items_in_trans desc) as rank_val
from
	transactions t
where
	t.trans_dt = '2022-01-12'
	
	/*RANK, DENSE_RANK, ROW NUMBER*/

select
	t.*
	, row_number() over(order by t.items_in_trans desc) as row_num
	, rank() over(order by t.items_in_trans desc) as rank_val
	, dense_rank() over(order by t.items_in_trans desc) as dense_rank_val
from
	transactions t
where
	t.trans_dt = '2022-01-12'
	
