/*PARTITIONS/ TABLE PARTITIONS*/

create table partitioned_transactions (
	customer_id bigint, 
	trans_dt date, 
	transaction_id bigint, 
	items_in_trans integer, 
	store_id bigint

) partition by range (trans_dt) --- partition table created


Create table transactions_2020 partition of partitioned_transactions
-- creating partition table based off 2020 transactions in partition_transactions partitioned table
for values from ('2020-01-01') to ('2021-01-01') -- establishing range of values
;

Create table transactions_2021 partition of partitioned_transactions
for values from ('2021-01-01') to ('2022-01-01') 
;

Create table transactions_2022 partition of partitioned_transactions
for values from ('2022-01-01') to ('2023-01-01')
;

Create table transactions_2023 partition of partitioned_transactions
for values from ('2023-01-01') to ('2024-01-01') 
;

drop table partition_transactions


/*Inserting records into the main partiton table, not the partitioned
tables, to test this out*/

insert into partitioned_transactions values (1, '2021-01-01', null, null, null)

-- running select statement on partitioned table to retrieve newly added value

select
	*
from
	transactions_2021
