--1. select everything
select * from air_and_water

--2. rename the column names appropriately
 
--renamed the column manually as I use SSMS
--you can rename database/table/column name manually in SSMS

--3. check for duplicates

select count(*) from air_and_water
select count(distinct(city)) from air_and_water

select row_number() over(partition by city order by city), city
from air_and_water

select city, count(city)
from air_and_water
group by city
having count(city) > 1

select city, region, count(*)
from air_and_water
group by city, region
having count(*) > 1

select city, region, country, count(*)
from air_and_water
group by city, region, country
having count(*) > 1

select * from air_and_water
where city='Aberdeen'

select * from air_and_water
where city='Alexandria'
--there are no duplicate values

--4. round airquality and waterpollution values to two decimal

update air_and_water
set airquality = round(airquality, 2)

update air_and_water
set waterpollution = round(waterpollution, 2)

select * from air_and_water

--5. remove "" from region, country


