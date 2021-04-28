-- count num of activities done by each user
select count(exercise_id) as num_activity into #temp
from exercises
group by user_id;

-- count num of each num_activity
select count(num_activity), num_activity
from #temp
group by num_activity;

drop table #temp;
