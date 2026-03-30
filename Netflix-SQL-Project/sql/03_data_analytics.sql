-- 1. total records
select count(*) as Total_Rows from netflix;

-- 2. movies vs tv shows 
select type , count(*) as total_records
from netflix 
group by type;

-- 3. top 10 countries producing content 
select 
    country,
    count(*) AS total,
    rank() over (order by count(*) desc) as rank
FROM netflix
GROUP BY country;


--4. content added per year 
select year(date_added_clean) as year, count(*) as total
from netflix
where date_added_clean is not null -- there are few null values for this attribute hence not null is used
group by year(date_added_clean)
order by total desc;

-- 5. top 10 genres 
select top 10 count(*) as total_records , listed_in 
from netflix 
group by listed_in order by total_records desc;
--or 
select listed_in,count(*) as total,dense_rank() over (order by count(*) desc) as genre_rank
from netflix
group by listed_in;


-- 6. avg movie duration 
select avg (duration_num) as average_duration
from netflix 
where duration_type ='min'


-- 7. movies released each year
select release_year, count(*) as total
from netflix
group by release_year
order by release_year desc;


-- 8. most common rating per year
select * from (select year(date_added_clean) as year, rating, count(*) as total, 
rank() over (partition by year(date_added_clean) 
order by count(*) desc) as rnk 
from netflix 
where date_added_clean is not null
group by year(date_added_clean), rating) t 
where rnk = 1;

-- 9. tv shows vs movies by year
select year(date_added_clean) as year, type, count(*) as total
from netflix where date_added_clean is not null
group by year(date_added_clean), type
order by year;

-- 10. top 5 longest movies
select * from 
(select title, duration_num , rank() over (order by duration_num desc) as rnk
from netflix 
where duration_type = 'min'
) t
where rnk <=5;

-- 11. growth per year 
select year, total , total - lag(total) 
over(order by year) as growth 
from (select year(date_added_clean) as year, count(*) as total 
from netflix where date_added_clean is not null
group by year(date_added_clean) ) t;

-- 12. running total of content
select year,sum(total) over (order by year) as cumulative_total
from (
select year(date_added_clean) as year,count(*) as total
from netflix
group by year(date_added_clean)
) t;

-- 13. top 3 longest movies per year
select *
from (
select release_year,title,rank() over (partition by release_year order by release_year desc) as rnk
from netflix
where duration_type='min'
) t
where rnk<=3;
