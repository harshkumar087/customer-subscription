-- drop view churn_rate;
create or replace view churn_rate as 
with clean_data as (

	select 
		"customerID",
		gender,
		tenure,
		"Churn",
		"Contract",
		"MonthlyCharges"
	from
		churn_dataset 
),
churn_stats as ( 

	select 
		tenure,
		"Contract" as contract_type,
		count(*) filter (where "Churn" = 'Yes') as churn,
		count(*) as total
	from
		clean_data
	group by
		tenure, contract_type
		
)
select
	tenure as month,
	contract_type,
	churn,
	total,
	round((churn::numeric/total)*100,2) as churn_rate
from 
	churn_stats;

create or replace view top_customers as
with clean_data as (
	
	select
		"customerID",
		tenure,
		"MonthlyCharges" as monthly_charges,
		"Contract",
		"Churn" as churn ,
		"TotalCharges" as total_charges
	from churn_dataset
	
),
filter_data as ( 
	
	select *
	from clean_data
	where churn = 'No' and total_charges is not null

),
priority as ( 
	
	select *
	from filter_data
	order by total_charges desc, monthly_charges desc, tenure desc
	limit 10
	
)
select * from priority;

create or replace view top_contract as
with clean_data as (
	
	select
		tenure,
		"MonthlyCharges" as monthly_charges,
		"Contract" as contract_type,
		"Churn" as churn ,
		"TotalCharges" as total_charges
	from churn_dataset
	
),
filter_data as ( 
	
	select *
	from clean_data
	where churn = 'No' and total_charges is not null

),
priority as ( 
	
	select
		AVG(tenure) as avg_tenure,
		AVG(monthly_charges) as avg_month_charge,
		AVG(total_charges) as avg_total_charge,
		contract_type
	from filter_data
	group by contract_type
	order by avg_total_charge desc, avg_month_charge desc, avg_tenure desc
	
)
select * from priority;
--drop view top_contract 
select * from top_customers;

--select count (distinct "customerID" ) as dist, count(*) as tot from churn_dataset;

/*select * from monthly_churn
limit 20;*/