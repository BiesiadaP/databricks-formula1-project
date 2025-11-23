-- Databricks notebook source
select driver_name, sum(calculated_points) as total_points
from formula1.f1_presentation.calculated_race_results
group by driver_name
order by total_points desc;

-- COMMAND ----------

with dane as (
  select driver_name, race_year, sum(calculated_points) as total_points
  from formula1.f1_presentation.calculated_race_results
  group by driver_name, race_year
)
select driver_name, race_year, total_points, rank() over(order by total_points desc) as all_time_rank
from (
  select
    driver_name,
    race_year,
    total_points,
    rank() over (partition by race_year order by total_points desc) as rnk
  from dane
)
where rnk = 1
order by race_year desc;

-- COMMAND ----------



with dane as (
  select team_name, race_year, sum(calculated_points) as total_points
  from formula1.f1_presentation.calculated_race_results
  group by team_name, race_year
)
select team_name, race_year, total_points, rank() over(order by total_points desc) as all_time_rank
from (
  select
    team_name,
    race_year,
    total_points,
    rank() over (partition by race_year order by total_points desc) as rnk
  from dane
)
where rnk = 1
order by race_year desc;

-- COMMAND ----------

