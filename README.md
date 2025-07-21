## Project Background

Bellabeat, founded in 2013, is a high-tech company that manufactures health-focused smart products. By collecting data on activity, sleep, stress, and reproductive health, Bellabeat empowers women with
knowledge about their health and habits. 

## Business Task

This project analyzes smart device usage data to gain insight into how consumers use non-Bellabeat smart devices. The aim is to provide key actionable recommendations to improve the marketing strategy and become a larger player in the global smart device market. The focus will be on the Bellabeat watch “Time”. 

Insights and recommendations are provided on the following key areas:

- **Smart device features usage**: An overview of the different features offered by smart devices and how likely consumers are to use them.
- **Participant segmentation**: An assessment of the participants of the study. Their health statistics and overall routine.
- **Relationship analysis**: An analysis of the relationship between the measured variables to determine the impact they have on overall health.

The entire 17-page report is available [here](Bellabeat-project---Google-Cert/Bellabeat_Report.pdf). This includes the multiple Excel and R visualizations not added to this Readme file.

The Excel report can be found [here]().

The SQL query used to aggregate data for further analysis is available [here]().

The R code used to create the relationship visualizations and data aggregation can be found [here](https://github.com/Memesls/Bellabeat-project---Google-Cert/blob/9e32d03950003a726170d4b83157546546cd283d/Bellabeat%20analysis%20exploration.R).

## Data Structure

Bellabeat’s data collection consists of a total of 29 CSV files collected across 2 months. The files considered for this analysis were the following: dailyActivity, weightLogInfo, minuteSleep, and SleepDay.

<br/>
<p align="center">
<img width="956" height="369" alt="Screenshot 2025-07-13 190949" src="https://github.com/user-attachments/assets/6462a13b-d4e1-4015-a5cc-8d6285680c20" />
</p>
<br/>

Before the start of the analysis, a variety of checks were conducted for data familiarization. Each CSV file was evaluated in terms of data structure, data types, and possible connections to other data. Data aggregation was used in both SQL and R to merge datasets as they existed in 2 separate files due to the time constraint.

## Executive Summary

Analysis of smart device usage patterns reveals that users consistently engage with features that track daily routines like step count, calories burned, active minutes, or distance traveled. In contrast, features like weight logging and sleep tracking are underutilized and lagging behind, respectively. These findings suggest an opportunity for smart health products to focus on seamless, all-day tracking of activity and sleep, the two most consistently used features. Enhancing usability and integration of these features could better align with user behavior, increase adoption, and long-term engagement. 

<br/>
<p align="center">
<img width="768" height="533" alt="image" src="https://github.com/user-attachments/assets/c388b5ad-44f2-495a-9f80-dc2d7c9c6980" />
</p>

## Findings

### Daily Activity:

- A total of 35 participants agreed to this 2-month study. 
- On average, participants tracked 40 days of data and walked an average distance of 5 km per day.
- The first 80% of the participants walked an average of 5,607 steps per day. While the remaining 20% were slightly higher on the steps scale.
- Furthermore, 62% of the total distance traveled was covered walking, 27% running, and 11% jogging.
- It is important to note that participants burned on average 2,249 calories per day.

### Weight Log:

- Out of the 35 total participants, only 13 used the weight log feature.
- Only 2 participants consistently tracked their weight on the app for more than 7 days. This means that less than 6% of participants tracked their weight for more than 1 week.
- 77% of the participants who used the weight log feature weigh less than 92 kg.
- BMI Categories by the National Heart, Lung, and Blood Institute (NHLBI) also indicate that only 31% of the 13 participants are considered healthy, with the remaining 69% being overweight or obese.

### Sleep Tracker:

- 25 participants tracked their sleep data during the study.
- 20 participants consistently tracked their sleep on the app for more than 7 days. This means that more than half (57%) of the participants tracked their sleep data for over a week.
- On average, participants slept more during the weekends, though surprisingly, Tuesday and Wednesday were not so far off.
- The average sleep per session was 366 minutes or 6.1 hours of sleep a day. According to the NHLBI, adults who sleep less than 7 hours a night may have more health issues than those who sleep 7 or more hours a night.

## Recommendations

1. The analysis showed that participants are more likely to utilize smart device features that provide insight into their day-to-day lives. This means customers value statistics like daily steps, distance traveled, activity time, calories burned, sleep time, and sleep quality, among many others. It is then recommended to market the “Time” product as an everyday companion that will always be there with your daily stats, recommendations, and reminders.

2. The study showed the underutilization of the weight log feature. Whether this was due to a lack of knowledge of its existence among the participants or an ease-of-use situation, it stands that a very small percentage of subjects used this feature. A 2017 study found that the initial motivation to download and use digital weight management interventions came from the perceptions of one’s physical attractiveness and wanting to improve overall health. Retention, on the other hand, came from: personalization, social support, feedback, ease of set-up and use, etc. The recommendation would then be to market the “Time” as a goal-achieving facilitator. With features like being fully customizable, seamless tracking, auto-logging, a community through the Bellabeat app, feedback, and much more.

3. The last recommendation is to market the “Time” as a “habit optimizer”. Sleep is extremely important for overall health, and the participants of the study slept on average 6.1 hours per day, when the recommended sleep from experts at the National Institute of Health and the American Academy of Sleep Medicine is from 7-9 hours per day. Building a habit can be challenging without the right tools and discipline, but with the “Time” always on your wrist, providing reminders and suggestions throughout the day, it becomes a much simpler task.











