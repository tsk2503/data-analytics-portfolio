-- ===============================
-- data cleaning
-- ===============================

-- replace null values in country with 'unknown'
update netflix 
set country = 'unknown' 
where country is null;

-- replace null values in cast with 'unknown'
update netflix 
set cast = 'unknown' 
where cast is null;

-- replace null values in director with 'unknown'
update netflix 
set director = 'unknown' 
where director is null;

-- trim leading and trailing spaces in country
update netflix 
set country = ltrim(rtrim(country));

-- remove leading comma from country values
update netflix 
set country = ltrim(substring(country, 2, len(country))) 
where left(ltrim(country), 1) = ',';

-- check distinct country values after cleaning
select distinct country from netflix;

-- replace double spaces with single space in country
update netflix 
set country = replace(country, '  ', ' ');

-- trim spaces in multiple text columns
update netflix
set 
title = ltrim(rtrim(title)),
director = ltrim(rtrim(director)),
cast = ltrim(rtrim(cast)),
listed_in = ltrim(rtrim(listed_in));