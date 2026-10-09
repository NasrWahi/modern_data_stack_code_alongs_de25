with stg_job_ads as (select * from {{ source('job_ads', 'stg_ads') }})

select
    cast(experience_required as varchar(30))      as experience_required,
    cast(driving_license_required as varchar(30)) as driver_license,
    cast(access_to_own_car as varchar(30))        as access_to_own_car
from stg_job_ads
