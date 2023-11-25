/*STORED PROCEDURES*/

Create table tmp_family_members (
	
	member_id bigserial primary key
	, member_name varchar (255)

)
;

Create table tmp_bank_accounts (
	
	member_id bigserial primary key
	, bank_name varchar (255)

)
;

create procedure add_new_family_member (name varchar(255))
	LANGUAGE SQL
	as $$
		insert into tmp_family_members(member_name) values (name);
		insert into tmp_bank_accounts (bank_name) values (name);
	
	$$
	
	
	
call add_new_family_member ('baby_yoda')


select
	*
from
	tmp_family_members
	
	
select
	*
from
	tmp_bank_accounts