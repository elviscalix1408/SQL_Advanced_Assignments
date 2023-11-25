/*SPLIT*/


with partitioned_date as 
(select
	split_part('2023M01', 'M', 1) as date_yyyy
	, split_part('2023M01', 'M', 2) as date_mm)
	
select
	cast
	(concat(p.date_yyyy, '-', p.date_mm, '-01')as date)
	as first_of_month_dt
from
	partitioned_date p