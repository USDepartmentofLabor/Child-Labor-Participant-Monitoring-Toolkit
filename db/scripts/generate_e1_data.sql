with children as (
  select id
  from people
  where age between 5 and 17
), children_services as (
  select
    si.person_id,
    si.service_id,
    si.start_date,
    stg.id as service_type
  from service_instances si
  join services s on si.service_id = s.id
  join service_types st on s.service_type_id = st.id
  join service_type_categories stg on st.service_type_category_id = stg.id
), people_work_activities as (
  select
    p.id as person_id,
    count(*) as number_of_work_activities
    from people p
    join people_work_activities pwa on p.id = pwa.person_id
    where p.age between 5 and 17
    group by p.id
), people_occupations as (
  select
    p.id as person_id,
    count(*) as number_of_occupations
    from people p
    join people_occupations po on p.id = po.person_id
    where p.age between 5 and 17
    group by p.id
), people_intake_statuses as (
  select
    p.id as person_id,
    p.intake_date,
    case
      when pwa.number_of_work_activities > 0 or p.have_job_returning_to = 't'
      then
        case
          when po.number_of_occupations > 0 then 2
          when (p.age between 5 and 14) and p.hours_worked > 14 then 1
          when (p.age <= 17) and p.hours_worked > 40 then 1
          else 0
        end
      else 0
    end as intake_work_status,
    case
      when p.enrolled_in_school = 't'
      then 1
      else 0
    end as intake_education_status
    from people p
    left outer join people_work_activities pwa on p.id = pwa.person_id
    left outer join people_occupations po on p.id = po.person_id
    where p.age between 5 and 17
)
insert into e1_facts (reporting_period_id, person_id, work_status, education_status, received_education_service, received_livelihood_service, created_at, updated_at)
select
  rp.id as reporting_period_id,
  c.id as person_id,
  coalesce(pis.intake_work_status, 0) as work_status,
  coalesce(pis.intake_education_status, 0) as education_status,
  case when cs.service_type = 1 then TRUE else FALSE end as received_education_service,
  case when cs.service_type = 2 then TRUE else FALSE end as received_livelihood_service,
  now(),
  now()
from reporting_periods as rp
cross join children c
left outer join children_services cs on
  cs.person_id = c.id
  and cs.start_date between rp.start_date and rp.end_date
left outer join people_intake_statuses pis on
  c.id = pis.person_id
  and pis.intake_date between rp.start_date and rp.end_date
