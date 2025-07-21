INSERT INTO `sql-practice-460602.BellaBeat.dailyActivity_March_April`
SELECT * FROM `sql-practice-460602.BellaBeat.dailyActivity_April_May`
;


select
  Id,
  count(ActivityDate) as DaysTracked,
  sum(TotalSteps) as TotalSteps,
  cast(avg(TotalSteps)as int64) as AverageStepsDay,
  cast(sum(round(TotalDistance,2))as int64) as TotalDistance_km,
  round(avg(TotalDistance),2) as AverageDistanceDay_km,
  cast(avg(VeryActiveMinutes)as int64) as AverageVeryActive_minutes,
  sum(calories) as TotalCalories,
  cast(avg(calories)as int64) as AverageCalories,
  sum(cast(round(((VeryActiveMinutes + FairlyActiveMinutes + LightlyActiveMinutes + SedentaryMinutes)/60)) as int64)) as HoursTracked
from `sql-practice-460602.BellaBeat.dailyActivity_March_April`
group by Id
