/*Update from SELECT*/

select
	*
from tmp_ps_4_5_products
;

update tmp_ps_4_5_products
	set price = null
	
/*Updating price to original*/


/*now to update our table, we can update from a select statement.
*/
update tmp_ps_4_5_products t
	set price = p.price
	from (
			select
			  p.product_id
			 , p.price
					from
						products p
				) p
	where
		t.product_id = p.product_id
		


	
