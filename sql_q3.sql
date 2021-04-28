select top 5 providers.org_name
from phq9 left join providers
on phq9.provider_id = providers.provider_id
group by providers.org_id
order by avg(phq9.score) desc;
