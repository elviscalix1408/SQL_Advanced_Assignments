/*INTERSECT does not return duplicates, only common values in each table*/

Create temp table tmp_foods (
	food_name varchar(255)


)
;

insert into tmp_foods values ('pizza');
insert into tmp_foods values ('tacos');
insert into tmp_foods values ('apples');
insert into tmp_foods values ('grapes');
insert into tmp_foods values ('pizza');
;

create temp table tmp_fav_foods (
		food_name varchar(255)
)

;

insert into tmp_fav_foods values ('pizza');
insert into tmp_fav_foods values ('tacos');


select
	f.food_name
from
	tmp_foods f
	
intersect
	
select
	f.food_name
from
	tmp_fav_foods f

