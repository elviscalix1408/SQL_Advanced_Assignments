/*AUTO-INCREMENT PRIMARY KEY*/

Create table tmp_customers (
	customer_id bigserial primary key -- bigserial assigns unique ID to every record
	, first_name varchar(255)
	, last_name varchar(255)
)


insert into tmp_customers (first_name, last_name) values ('bob', 'belchar');
insert into tmp_customers (first_name, last_name) values ('Kara', 'Smith');
insert into tmp_customers (first_name, last_name) values ('Talum', 'Talom');

Select
	*
from
	tmp_customers
	
	
	
delete
from
tmp_customers
;