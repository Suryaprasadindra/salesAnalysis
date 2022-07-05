use project
-- inspecting data
select * from[dbo].[sales_data_sample]

--checking unique values
select distinct status from sales_data_sample
select distinct YEAR_ID from sales_data_sample
select distinct PRODUCTLINE from sales_data_sample
select distinct COUNTRY from sales_data_sample
select distinct DEALSIZE from sales_data_sample
select distinct TERRITORY from sales_data_sample

-- A N A L Y S I S

-- total sales productline  wise
select PRODUCTLINE,floor(sum(sales)) REVENUE from sales_data_sample
group by PRODUCTLINE
order by 2 desc;

--total sales year wise
select YEAR_ID,floor(sum(sales)) REVENUE from sales_data_sample
group by YEAR_ID
order by 2 desc;

-- total sales country wise
select COUNTRY,floor(sum(sales)) REVENUE from sales_data_sample
group by COUNTRY
order by 2 desc;

--total sales city wise
select CITY,floor(sum(sales)) REVENUE from sales_data_sample
group by CITY
order by 2 desc;

--checking how many months that sales happened in a year
select distinct month_id from sales_data_sample
where  YEAR_ID = 2005 /* here sales data collected upto 5 months*/
select distinct month_id from sales_data_sample
where  YEAR_ID = 2004 /* here sales data collected upto 12 months*/
select distinct month_id from sales_data_sample
where  YEAR_ID = 2003 /* here sales data collected upto 12 months*/

--total sales dealsize wise
select DEALSIZE,floor(sum(sales)) REVENUE from sales_data_sample
group by DEALSIZE
order by 2 desc;


-- what was the best month for sales in a specifi year ? how much was earned in that month?
select month_id,floor(sum(sales)) revenue,count(ordernumber) frequency
from sales_data_sample
where year_id = 2003
group by MONTH_ID
order by 2 desc

-- which product has got more orders in 11th mon in 2003
select month_id,productline, floor(sum(sales)) revenue,count(ordernumber) frequency
from sales_data_sample
where year_id = 2003 and MONTH_ID = 11
group by MONTH_ID,PRODUCTLINE
order by 3 desc;

-- list of customers who ordered maximum orders
select customername,count(quantityordered)orders_count
from sales_data_sample
group by CUSTOMERNAME
order by 2 desc

-- orders count year wise by customers
select customername,count(quantityordered)orders_count
from sales_data_sample
where year_id = 2004
group by CUSTOMERNAME
order by 2 desc

-- in 2004 highest orders from 4th quarter
select QTR_ID,count(quantityordered)orders_count
from sales_data_sample
where year_id = 2004
group by QTR_ID
order by 2 desc

--in 2004 highest orders from 4th quarter and which month got highest orders in that 4th qtr ?
select QTR_ID,count(quantityordered)orders_count
from sales_data_sample
where year_id = 2004 and MONTH_ID = 11
group by QTR_ID
order by 2 desc

--in 2004 highest orders from 4th quarter and which month got highest orders in that 4th qtr ? and which product line got more orders in that particular qtr (top 3)?
select top 3 dealsize,count(dealsize) dealsizecount,PRODUCTLINE,count(productline) productlinescount,QTR_ID,count(quantityordered)orders_count
from sales_data_sample
where year_id = 2004 and MONTH_ID = 11 
group by QTR_ID , productline,DEALSIZE
order by 2 desc

-- in 2003
select dealsize,count(dealsize) dealsizecount,PRODUCTLINE,count(productline) productlinescount,QTR_ID,count(quantityordered)orders_count
from sales_data_sample
where year_id = 2003 and MONTH_ID = 11
group by QTR_ID , productline,DEALSIZE
order by 4 desc

