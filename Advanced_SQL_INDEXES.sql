/*INDEXES*/

select
	*
from
	transaction_items
where
	product_id = 1744
	

create index transaction_items_product_id_idx
	on transaction_items (product_id)
	
	
drop index transaction_items_product_id_idx