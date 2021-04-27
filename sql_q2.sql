select count(exercise_id) as num_activity into #temp
from exercises
group by user_id;

select count(num_activity)
from #temp
group by num_activity;

drop table #temp;
