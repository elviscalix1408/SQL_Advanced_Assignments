/*LENGTH AND TRIM*/

create temp table whitespace_test as (
	
	select
		'  Elvis Lopez  ' as my_name


)
;
select
	w.my_name
	, length(w.my_name) as length_of_name
	, trim(w.my_name) as trimmed_name
	, length(trim(w.my_name)) as trimmed_length
from
	whitespace_test w

	
;