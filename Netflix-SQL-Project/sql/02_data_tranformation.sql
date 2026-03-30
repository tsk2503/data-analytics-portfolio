-- ===============================
-- data transformation
-- ===============================

-- add new column for cleaned date
alter table netflix
add date_added_clean date;

-- convert date_added (string) to proper date format
-- try_parse works with varchar input and handles 'month day, year' format
update netflix 
set date_added_clean = try_parse(cast(date_added as varchar(50)) as date using 'en-US');

-- check duration values (for understanding format like '90 min', '2 seasons')
select duration from netflix;

-- add columns to split duration
alter table netflix 
add duration_num int,
    duration_type varchar(20);

-- extract numeric value and type from duration
-- example: '90 min' → 90, 'min'
-- example: '2 seasons' → 2, 'seasons'
update netflix 
set 
duration_num = cast(left(duration, charindex(' ', duration) - 1) as int),
duration_type = right(duration, len(duration) - charindex(' ', duration));

-- add numeric version of show_id for proper sorting
alter table netflix
add show_id_num int;

-- convert show_id from 's1' → 1
update netflix
set show_id_num = cast(substring(show_id, 2, len(show_id)) as int);