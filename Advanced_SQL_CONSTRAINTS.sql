/*CONSTRAINTS -- a rule that we put on a field inside a database table

ensures */

create table tmp_bobs_family (
	customer_id bigserial primary key
	, first_name varchar(255)
	, last_name varchar(255) check (last_name = 'piz')
)
;

insert into tmp_bobs_family (first_name, last_name) values ('bobby', 'piz');
insert into tmp_bobs_family (first_name, last_name) values ('lany', 'piz');
insert into tmp_bobs_family (first_name, last_name) values ('liz', 'piz');

select
	*
from
	tmp_bobs_family
	

insert into tmp_bobs_family (first_name, last_name) values ('Miz', 'LIZ');
