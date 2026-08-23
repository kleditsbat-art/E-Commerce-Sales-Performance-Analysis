CREATE DATABASE e_commerce;

USE e_commerce;



CREATE TABLE blinkit_sales (
	item_fat_content              VARCHAR(20)     NOT NULL,
	item_identifier              VARCHAR(10)     NOT NULL,        
    item_type                     VARCHAR(50)     NOT NULL, 
	outlet_establishment_year      INT        NOT NULL,
    outlet_identifier              VARCHAR(10)     NOT NULL,
    outlet_location_type           VARCHAR(10)     NOT NULL,
	outlet_size                   VARCHAR(10),      
    outlet_type                    VARCHAR(30)     NOT NULL,
	item_visibility                DECIMAL(8,6)    NOT NULL,
    item_weight                   DECIMAL(6,2),
    sales                          DECIMAL(10,4)   NOT NULL,        
    rating                         DECIMAL(3,1)    NOT NULL
);
select * from blinkit_sales;

#Sum of Sales
select sum(sales) as Total_Sales from blinkit_sales;

#Average sales per item
select avg(sales) from blinkit_sales;

#item sold
select count(item_identifier) from blinkit_sales;

#Avg Rating 
select avg(rating) from blinkit_sales;

#Avg visibility 
select avg(item_visibility) from blinkit_sales;


#Item Count by Item Type
select item_type as item_type,
	count(item_type) as count
    from blinkit_sales
    group by item_type;
    
    
#Sales Analysis by Outlet Attributes
select 
	outlet_type as outlet_type,
    avg(sales) as AVG,
    sum(sales) as SUM,
    count(sales) as COUNT
    from blinkit_sales
    group by outlet_type;

#outlet location by sales  
select 
	outlet_location_type as OUTLET_TYPE,
    avg(sales) as AVG_SALES,
    sum(sales) as SUM_SALES
    from blinkit_sales
    group by outlet_location_type;


#outlet type by items and sales    
select
	outlet_type as OUTLET_TYPE,
    count(item_type) as ITEMS,
    avg(sales)as AVG_SALES,
    sum(sales) as TOTAL_SALES
    from blinkit_sales
    group by outlet_type;


#outlet size by AVG Sales     
select 
	outlet_size as OUTLET_SIZE,
    avg(sales) as AVG_SALES
    from blinkit_sales
    group by outlet_size;
    
#item type by Sales    
select
	item_type as item_type,
    avg(sales) as AVG_SALES,
    sum(sales) as SUM_SALES
    from blinkit_sales
    group by item_type
    order by AVG_SALES desc;

#outlet_establishment_year by Total Sales
select 
	outlet_establishment_year as outlet_establishment_year,
    sum(sales) as Total_Sales
    from blinkit_sales
    group by outlet_establishment_year;


#rating by Count    
select
	rating as RATING,
    count(rating) as Count
    from blinkit_sales
    group by rating;


#Rating by Sales    
select 
	rating as RATING,
    avg(sales) as AVG_SALES
    from blinkit_sales
    group by rating
    order by AVG_SALES desc;
    
select
	item_type as ITEMS,
    avg(item_weight) as AVG_Weight
    from blinkit_sales
    group by item_type;
    
    