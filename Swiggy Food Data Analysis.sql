use food_Delivery;

select *from swiggy;

/*Find total number of rows */
select count(ID)
from swiggy;

/* Find the total number of city  */
select count(distinct city)
from swiggy;

/* Find Total Resraurant in each city */
select city, count(distinct Restaurant) as Total_Restaurant
from swiggy
group by city
order by Total_Restaurant desc ;

/* Find total number of restaurant from  where order was made */
select count(distinct restaurant) as total_order
from swiggy;

/* find total number order made by each restaurant and display in descending order */
select restaurant, count(Id) as Total_Order
from swiggy
group by Restaurant
order by Total_Order desc;

/* find total number order made by each restaurant,city and display in descending order */
select restaurant, city,count(Id) as Total_Order
from swiggy
group by city,address, Restaurant
order by Total_Order desc;

/* find all restaurant who sale south indian or chienese or biryani */
select restaurant,Food_type
from swiggy
where  Food_type In ('Biryani','Chinese','South Indian');

select restaurant,Food_type
from swiggy
where  Food_type like '%Biryani%'or Food_type like '%Chinese%' or Food_type like'%South Indian%';

/* Find out top three restaurant with maximum order*/
select restaurant , count(Id) as total_order
from swiggy
group by restaurant
order by total_order  desc
limit 3;

/*Find average delivery time for each city */
select city,avg(delivery_time) as avg_delivery_time
from swiggy
group by city;

/* Find out top three restaurant with highest rating*/
select restaurant , avg(avg_ratings) as Highest_Rating
from swiggy
group by restaurant
order by Highest_Rating  desc
limit 3;


select * from swiggy;

# Find the costlly item from the dataset
select id, restaurant, price, food_type
from (select id, restaurant, price, food_type,
dense_rank() over (order by price desc) as cost from swiggy) as food_cost
where cost = 1;

# Find most expensive item from each restaurant
select restaurant, city, max(price) as costliest
from swiggy
group by city,Restaurant
order by costliest desc;

# find the area of banglore with max order 
select city,area ,count(id) as tot_order
from swiggy
where city = 'bangalore'
group by area
order by tot_order desc;

select city, area, tot_orders
from (
select city, area, count(id) as tot_orders,
dense_rank() over (order by count(id) desc) as ranks
from swiggy
where city = 'bangalore'
group by area
order by tot_orders desc) as new_tab
where ranks = 1;

use food_delivery;










