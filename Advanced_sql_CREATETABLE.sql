/*Inset from SELECT*/

create table tmp_ps_4_5_products as 

(select
	*
from
	products p
where
	   p.description like '%PlayStation 5%'
	or p.description like '%PS5%'
	or p.description like '%PS4%'
	or p.description like '%PlayStation 4%')
