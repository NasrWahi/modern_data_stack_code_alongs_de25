with src_job_details as (select * from {{ ref('src_job_details') }})

select
    {{ dbt_utils.generate_surrogate_key([
        'headline', 'description', 'employment_type', 'duration',
        'salary_type', 'scope_of_work_min', 'scope_of_work_max'
    ]) }} as job_details_id,
    headline,
    description,
    employment_type,
    duration,
    salary_type,
    scope_of_work_min,
    scope_of_work_max,
    max(description_html_formatted) as description_html_formatted
from src_job_details
group by
    headline, description, employment_type, duration,
    salary_type, scope_of_work_min, scope_of_work_max
