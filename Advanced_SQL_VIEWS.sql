/*VIEW*/

create table tmp_ps_4_5_products as (
	select
		*
	from
		products p
	where
		   p.description like '%PlayStation 5%'
		or p.description like '%PS5%'
		or p.description like '%PS4%'
		or p.description like '%PlayStation 4%'
)
;

/*
	we are going to do this.
*/
create view tmp_ps_4_5_products_vw as (
	select
		*
	from
		products p
	where
		   p.description like '%PlayStation 5%'
		or p.description like '%PS5%'
		or p.description like '%PS4%'
		or p.description like '%PlayStation 4%'
)

Select 
	*
from
	tmp_ps_4_5_products_vw
