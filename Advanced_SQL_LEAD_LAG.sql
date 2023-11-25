/*LEAD function*/

Select
	t.*
/*I am intructed to use the LEAD function and order by transaction date

as seen below*/
	, lead(t.transaction_id) over(order by t.trans_dt) as prior_trans_id
from
	transactions t
where
	t.trans_dt = '2021-01-01'
	
	/*LAG function*/
	
Select
	t.*
/*I am intructed to use the LAG function and order by transaction date

as seen below*/
	, lag(t.transaction_id) over(order by t.trans_dt) as prior_trans_id
from
	transactions t
where
	t.trans_dt = '2021-01-01'
	
	
	/*QUERY with LEAD and LAG cunctions */
	
with numbered_records as (
		select
			t.*
		, row_number() over(order by t.trans_dt, t.transaction_id) as row_num
		from
	transactions t


)


select
	t.*
	, p.transaction_id as prior_transaction_id
from numbered_records t
	left join numbered_records p
on (t.row_num - 1) = p.row_num
order by
	t.row_num

	


