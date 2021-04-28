-- group users by their start month
-- create a temp table called #montly_total (count of users, month of start date, year of start date)
select count(user_id) as total_count, month(created_at) as month, year(created_at) as year
into #monthly_total
from users
group by month(created_at), year(created_at);


-- find exercise record with month-year = user's start date month-year
-- select distinct users from such exercise records
-- insert into a new temp table callsed #matching_records
select distinct users.user_id as user_id, month(users.created_at) as month, year(users.created_at) as year
into #matching_records
from users left join exercises
on month(exercises.exercise_completion_date) = month(users.created_at)
and year(exercises.exercise_completion_date) = year(users.created_at)
and exercises.user_id = users.user_id;


-- group #matching_records table by month and year
-- and count the number of users for each month-year
-- and insert into a new temp table called #monthly_exercise
select count(user_id) as first_month_count, month, year
into #first_month
from #matching_records
group by month, year;


-- calculate the percentage based on temp tables created
-- use isnull to display month with 0% result
select 100*isnull(firstmonth_count, 0)/total_count, total.month, total.year
from #monthly_total total left join #first_month first
on first.month = total.month
and first.year = total.year;

drop table #matching_records;
drop table #monthly_total;
drop table #first_month;
