/*DATE FUNCTIONS*/

Select
	t.*
	, t.trans_dt + interval '1 day'
	, t.trans_dt + interval '1 month'
from
	transactions t
	
/*day_part function, EXTRACTING something out of the DATE/ DAY
year, day or month alone*/

select
	t.*
	, date_part('day', trans_dt) as day_of_month
	, date_part('month', trans_dt) as month_number
	, date_part('year', trans_dt) as year_number
from
	transactions t
	
/*DATE_TRUNC functions*/

select
	t.*
	,cast (date_trunc('month', t.trans_dt)as date) as first_day_of_month
from
	transactions t
	
	
/*DATE_TRUNC to last day of the month*/

select
	t.*
	,cast
	
	(date_trunc('month', t.trans_dt) -- truncates to first day of the month
	+ interval '1 month' -- bumps forward to the first day of next month
	- interval '1 day' -- subracts to last day of previous month
	 as date) 
	 
	 as last_day_of_current_month

from
	transactions t
	
/*DATE_TRUNC to the last day of previous month*/

select
	t.*
	,cast
	
	(date_trunc('month', t.trans_dt) -- truncates to first day of the month
	- interval '1 day' -- subracts to last day of previous month
	 as date) 
	 
	 as last_day_of_previous_month

from
	transactions t
	
	

	
	


	
