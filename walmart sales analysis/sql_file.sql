create database walmart;
use walmart;
drop table sales;
create table sales(
	Order_ID varchar(20),
	Order_Date date,
	Ship_Date date,
	Customer_Name varchar(50),
	Country varchar(50),
	City varchar(50),
	State varchar(50),
	Postal_Code	int,
    check(Postal_code between 10000 and 99999),
    Region varchar(10),
	Category varchar(20),
	Sub_Category varchar(20),
	Product_Name varchar(200),
	Sales decimal,
	Quantity int,
	Discount decimal,
	Profit decimal
);

select * from sales;


-- for the most profitable customer
select distinct customer_name , 
sum(profit) as total_profit 
from sales
group by customer_name
order by  total_profit desc;

-- for standardizing the country name
update sales
set country = 'USA'
where country IN ('United States', 'USA');

SET SQL_SAFE_UPDATES = 1;

-- QUERYING THE ZONE WITH MOST SALES

SELECT Region, SUM(SALES) AS Total_sales FROM SALES group by Region order by Total_sales desc;

-- querying the the sub category with highest profits
SELECT Sub_category, SUM(profit) AS Total_profit FROM SALES group by Sub_category order by Total_profit desc;