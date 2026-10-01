with job_ads as (select * from {{ ref('src_job_ads') }})

select
    {{ dbt_utils.generate_surrogate_key(['id']) }} as job_id,

    {{ dbt_utils.generate_surrogate_key([
        'headline', 'description', 'employment_type', 'duration',
        'salary_type', 'scope_of_work_min', 'scope_of_work_max'
    ]) }} as job_details_id,

    {{ dbt_utils.generate_surrogate_key([
        'employer_organization_number', 'employer_name', 'employer_workplace'
    ]) }} as employer_id,

    {{ dbt_utils.generate_surrogate_key([
        'experience_required', 'driver_license', 'access_to_own_car'
    ]) }} as auxilliary_attributes_id,

    {{ dbt_utils.generate_surrogate_key(['occupation__label']) }} as occupation_id,

    vacancies,
    relevance,
    application_deadline
from job_ads
