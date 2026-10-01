with stg_job_ads as (select * from {{ source('job_ads', 'stg_ads') }})

select
    id,
    occupation__label,
    employer__organization_number as employer_organization_number,
    employer__name               as employer_name,
    employer__workplace          as employer_workplace,
    headline,
    description__text           as description,
    employment_type__label      as employment_type,
    duration__label             as duration,
    salary_type__label          as salary_type,
    scope_of_work__min          as scope_of_work_min,
    scope_of_work__max          as scope_of_work_max,
    cast(experience_required as varchar(30))      as experience_required,
    cast(driving_license_required as varchar(30)) as driver_license,
    cast(access_to_own_car as varchar(30))        as access_to_own_car,
    number_of_vacancies as vacancies,
    relevance,
    application_deadline
from stg_job_ads
