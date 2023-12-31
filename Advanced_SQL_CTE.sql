Create temp table trans_w_attributes as (
)

/*

1. CTEs
	
	in past lessons we used subqueries, but these arent easy to
	read and they can make teh code messy very quickly
*/


select
	t.customer_id
  , t.transaction_id
  , t.trans_dt
  , t.min_cust_trans_dt
  , t.has_trans_in_last_90d
  , t.has_trans_in_last_60d
  , t.has_trans_in_last_30d
  , case
  		-- if first purchase within last 30 days
  		when t.min_cust_trans_dt >= (
			select
				max(trans_dt) today_date
			from
				transactions t
		 ) - interval '30 days'
			then 'new'
		-- first trans more than 30 days ago
		when t.has_trans_in_last_60d = 1
			 and t.has_trans_in_last_30d = 0
			then 'dormant' 
		when
				 t.has_trans_in_last_60d = 0
			 and t.has_trans_in_last_30d = 0
			then 'churned'
		else
			'active'
	end as customer_status
from
	(
		select
		t.customer_id
	  , t.transaction_id
	  , t.trans_dt
	  , min(t.trans_dt) over(partition by t.customer_id) as min_cust_trans_dt
	  , case when t.trans_dt >= (
								select
									max(trans_dt) today_date
								from
									transactions t
							 ) - interval '90 days'
				then 1 
				else 0 
		  end as has_trans_in_last_90d
	  , case when t.trans_dt >= (
								select
									max(trans_dt) today_date
								from
									transactions t		
							 ) - interval '60 days'
				then 1 
				else 0 
		  end as has_trans_in_last_60d
	  , case when t.trans_dt >= (
								select
									max(trans_dt) today_date
								from
									transactions t
							 ) - interval '30 days'
				then 1 
				else 0 
		  end as has_trans_in_last_30d
	from
		transactions t
	) t
where
	has_trans_in_last_90d = 1