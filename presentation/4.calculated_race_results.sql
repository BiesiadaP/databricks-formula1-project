-- Databricks notebook source
USE catalog formula1;

-- COMMAND ----------

use schema f1_processed;

-- COMMAND ----------

create table formula1.f1_presentation.calculated_race_results
as
select races.race_year, constructors.name as team_name, drivers.name as driver_name, results.position, results.points, 
11 - results.position AS calculated_points
from results
join drivers on results.driver_id = drivers.driver_id
join races on results.race_id = races.race_id
join constructors on results.constructor_id = constructors.constructor_id
where results.position <= 10