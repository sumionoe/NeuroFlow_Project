-- group users by their start month
-- create a temp table called #montly_total (count of users, month of start date, year of start date)
select count(user_id) as total_users, month(users.created_at) as month, year(users.created_at) as year
into #monthly_total
from users
group by month(users.created_at), year(users.created_at);


-- find distinct users, month of start date, year of start date into a new temp table
--
select distinct users.user_id as user_id, month(users.created_at) as month, year(users.created_at) as year
into #exercise_first_month
from users left join exercises
on month(exercises.exercise_completion_date) = month(users.created_at)
and year(exercises.exercise_completion_date) = year(users.created_at)
and exercises.user_id = users.user_id;

select count(user_id) as exercise_users, month, year
into #total_exercise
from #exercise_first_month
group by month, year;

select exercise_users/total_users
from #total_exercise ex left join #monthly_total tot
on ex.month = tot.month
and ex.year = tot.year;

drop table #temp;
drop table #total_exercise;
drop table #exercise_first_month;
