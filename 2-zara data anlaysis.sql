-- DATA CLEANING

select*
from zara
limit 10;
create table  stagings_zara like zara;
insert into stagings_zara 
select*
from zara;
select*
from stagings_zara
limit 10;

-- 1 Removing duplicate: using row_number to remove duplicate
select *, row_number() over(partition by `Product ID`,`Product Position`,`Promotion`,`Product Category`, 
`Sales Volume`,`name`,`brand`) as row_num
from stagings_zara
;
with cts_staging as
(select *, row_number() over(partition by `Product ID`,`Product Position`,`Promotion`,`Product Category`, 
`Sales Volume`,`name`,`brand`) as row_num
from stagings_zara)
select * 
from cts_staging
where row_num >1;
-- the table does not contain any duplicates all row are unique because there is no row_number >1
-- 2 Standardization 
select *
from stagings_zara
limit 10;

select distinct `Product Position`
from stagings_zara;

select distinct Promotion
from stagings_zara;

select distinct `Product Category`
from stagings_zara;

select distinct section
from stagings_zara;

select distinct Seasonal
from stagings_zara;

select distinct brand
from stagings_zara;

select distinct name, sku
from stagings_zara
order by name asc;

select substring_index(scraped_at,'T',1)
from stagings_zara;
update stagings_zara set
scraped_at=substring_index(scraped_at,'T',1);

alter table stagings_zara 
rename column scraped_at to Date;

select *
from stagings_zara
limit 10;
update stagings_zara set
Date=str_to_date(Date,'%Y-%m-%d');

select distinct terms
from stagings_zara;

-- there is  no null values

-- 3 drop columns

alter table stagings_zara
drop column url;
alter table stagings_zara
drop column `Product Category`,
 drop column brand;
alter table stagings_zara
drop column description;
alter table stagings_zara
add column Total_price int;

update stagings_zara 
set Total_price=`Sales Volume`* price
;


-- i dropped Url columns because it not necessary for the analysis
-- i dropped product category because we have only one product category "clothing"
-- i dropped brand because we have only one brand  "zara"
-- i drop description because we will not need it for the analysis

select *
from stagings_zara;

-- Data Summary


select distinct Promotion,count(*) as Total_clothing,count(*)/sum(count(*)) over ()*100 as percenatage
from stagings_zara
group by Promotion;


select `Product Position`,count(*) as Total_clothing,count(*)/sum(count(*)) over ()*100 as percenatage
from stagings_zara
group by `Product Position`;


select `Seasonal`,count(*) as Total_clothing,count(*)/sum(count(*)) over ()*100 as percenatage
from stagings_zara
group by `Seasonal`;

select `terms`,count(*) as Total_clothing,count(*)/sum(count(*)) over ()*100 as percenatage
from stagings_zara
group by `terms`;


select terms,`Sales Volume`
from stagings_zara

;


select min(`Sales Volume`) as minimum_sales_volumes,max(`Sales Volume`) as maximum_sales_volumes
from(select terms,`Sales Volume`
from stagings_zara) as sales;


select terms,sum(Total_price) as total_revenue
from (select terms,Total_price
from stagings_zara
order by Total_price asc) as total
group by terms
order by total_revenue desc;

