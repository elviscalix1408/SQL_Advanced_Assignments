/*FUNCTIONS*/

select
	t.*
	, cast(
				date_trunc('month', t.trans_dt)-- truncate to first day of the month
			+	interval '1 month' -- bumps forward to the first day of the next month
			- 	interval '1 day' -- subtract a day, giving us the last day of current month
		as date) as last_day_of_current_month
from
	transactions t
	
/*CREATING THE FUNCTION for aboves statement*/

-- specify an input that it takes and the value coming in is a datedata type
-- and output, f1 is FIELD ONE and data type
	
create function last_day_of_current_month (in date, out f1 date) 

-- dollar signs take the palce of parethesis? specific to function creation?
-- line of code is generic, not specific to a table, $1 first parameter being passed in

	as $$
		select
			cast(
				date_trunc('month', $1)-- truncate to first day of the month  
			+	interval '1 month' -- bumps forward to the first day of the next month
			- 	interval '1 day' -- subtract a day, giving us the last day of current month
		as date)
			
	$$
				
LANGUAGE SQL


/*Running the FUNCTION*/

Select
	last_day_of_current_month (cast('2023-05-06' as date))
	
	
/*If you want to call the function from within the original function
created manually, you do as follows*/

select
	t.*
	, cast(
				date_trunc('month', t.trans_dt)-- truncate to first day of the month
			+	interval '1 month' -- bumps forward to the first day of the next month
			- 	interval '1 day' -- subtract a day, giving us the last day of current month
		as date) as last_day_of_current_month
		, last_day_of_current_month(t.trans_dt) as fn_last_day_of_current_month
from
	transactions t