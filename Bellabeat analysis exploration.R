library(tidyverse)
library(ggplot2)


# Daily activity

dailyActivity <- read.csv('Fitabase Data 3.12.16-4.11.16/dailyActivity_merged.csv')
dailyActivity2 <- read.csv('Fitabase Data 4.12.16-5.12.16/dailyActivity_merged.csv')

str(dailyActivity)
str(dailyActivity2)
  
#Combine both dailyActivity datasheets
combined_daily_data <- union(dailyActivity, dailyActivity2)

str(combined_daily_data)

#Graph: Calories & Total Steps 
ggplot(combined_daily_data, aes(x=Calories, y=TotalSteps)) + 
  geom_point() + 
  geom_smooth() + 
  theme(panel.background = element_blank()) +
  labs(title = "Relationship between Calories & Total Steps") +
  annotate("text", y = 21000, x = 4700, 
           label = as.character(round(cor(combined_daily_data$Calories, 
                                          combined_daily_data$TotalSteps), 3)), 
           color = "red")



#Graph: Calories & Total Distance traveled
ggplot(combined_daily_data, aes(x=Calories, y=TotalDistance)) + 
  geom_point() + 
  geom_smooth() + 
  theme(panel.background = element_blank()) +
  labs(title = "Relationship between Calories & Total Distance traveled") +
  annotate("text", y = 17, x = 4700, 
           label = as.character(round(cor(combined_daily_data$Calories, 
                                          combined_daily_data$TotalDistance), 3)), 
           color = "red")



#Graph: Calories & Very Active Minutes
ggplot(combined_daily_data, aes(x=Calories, y=VeryActiveMinutes)) + 
  geom_point() + 
  geom_smooth() + 
  theme(panel.background = element_blank()) +
  labs(title = "Relationship between Calories & Very Active Minutes") +
  annotate("text", y = 168, x = 4700, 
           label = as.character(round(cor(combined_daily_data$Calories, 
                                          combined_daily_data$VeryActiveMinutes), 3)), 
           color = "red")



#Graph: Calories & Very Active Distance traveled
ggplot(combined_daily_data, aes(x=Calories, y=VeryActiveDistance)) + 
  geom_point() + 
  geom_smooth() + 
  theme(panel.background = element_blank()) +
  labs(title = "Relationship between Calories & Very Active Distance traveled") +
  annotate("text", y = 10.5, x = 4700, 
           label = as.character(round(cor(combined_daily_data$Calories, 
                                          combined_daily_data$VeryActiveDistance), 3)), 
           color = "red")




#Graph: Calories & Lightly Active Minutes
ggplot(combined_daily_data, aes(x=Calories, y=LightlyActiveMinutes)) + 
  geom_point() + 
  geom_smooth() + 
  theme(panel.background = element_blank()) +
  labs(title = "Relationship between Calories & Lightly Active Minutes") +
  annotate("text", y = 285, x = 4700, 
           label = as.character(round(cor(combined_daily_data$Calories, 
                                          combined_daily_data$LightlyActiveMinutes), 3)), 
           color = "red")



#Graph: Calories & Light Active Distance traveled
ggplot(combined_daily_data, aes(x=Calories, y=LightActiveDistance)) + 
  geom_point() + 
  geom_smooth() + 
  theme(panel.background = element_blank()) +
  labs(title = "Relationship between Calories & Light Active Distance traveled") +
  annotate("text", y = 6, x = 4700, 
           label = as.character(round(cor(combined_daily_data$Calories, 
                                          combined_daily_data$LightActiveDistance), 3)), 
           color = "red")



# Sleep

minuteSleep <- read.csv('Fitabase Data 3.12.16-4.11.16/minuteSleep_merged.csv')
minuteSleep2 <- read.csv('Fitabase Data 4.12.16-5.12.16/minuteSleep_merged.csv')

str(minuteSleep)
str(minuteSleep2)

#Combine both minuteSleep datasheets
combined_sleep_data <- union(minuteSleep, minuteSleep2)

combined_sleep_data %>%
  group_by('Id') %>% 
  select(Id, logId) %>%
  summary(x = n_distinct(logId))


sleep_sessions <- combined_sleep_data %>%
  group_by(Id, logId) %>%
  summarise(
    session_minutes = n(),
    session_start = min(date),
    session_end = max(date),
    .groups = "drop"
  )

sleep_sessions

total_sleep_per_person <- sleep_sessions %>%
  group_by(Id) %>%
  summarise(
    total_sleep_minutes = sum(session_minutes),
    total_sleep_hours = total_sleep_minutes / 60
  )

total_sleep_per_person


write.csv(sleep_sessions,file='sleep_sessions.csv', row.names = FALSE)
write.csv(total_sleep_per_person,file='total_sleep_per_person.csv', row.names = FALSE)



# Sleep day and daily activity

sleepDay <- read.csv("Fitabase Data 4.12.16-5.12.16/sleepDay_merged.csv")

str(sleepDay)

#Combine combined_daily_data and sleepDay datasheets

sleepDay$Date <- as.Date(sleepDay$SleepDay, format = "%m/%d/%Y %H:%M")
colnames(combined_daily_data)[colnames(combined_daily_data) == "ActivityDate"] <- "Date"
combined_daily_data$Date <- as.Date(combined_daily_data$Date, format = "%m/%d/%Y")


combined_daily_sleep_data <- merge(sleepDay, combined_daily_data, by = c("Id", "Date"), all.x = TRUE)



#Graph: Total Steps & Total Minutes Asleep
ggplot(combined_daily_sleep_data, aes(x=TotalSteps, y=TotalMinutesAsleep)) + 
  geom_point() + 
  geom_smooth() + 
  theme(panel.background = element_blank()) +
  labs(title = "Relationship between Total Steps taken & Total Minutes Asleep") +
  annotate("text", y = 470, x = 19500, 
           label = as.character(round(cor(combined_daily_sleep_data$TotalSteps, 
                                          combined_daily_sleep_data$TotalMinutesAsleep), 3)), 
           color = "red")



#Graph: Sedentary Minutes & Total Minutes Asleep
ggplot(combined_daily_sleep_data, aes(x=SedentaryMinutes, y=TotalMinutesAsleep)) + 
  geom_point() + 
  geom_smooth() + 
  theme(panel.background = element_blank()) +
  labs(title = "Relationship between Sedentary Minutes & Total Minutes Asleep") +
  annotate("text", y = 350, x = 1200, 
           label = as.character(round(cor(combined_daily_sleep_data$SedentaryMinutes, 
                                          combined_daily_sleep_data$TotalMinutesAsleep), 3)), 
           color = "red")



# Daily activity & Weight Log

weightLog <- read.csv("Fitabase Data 3.12.16-4.11.16/weightLogInfo_merged.csv")
weightLog2 <- read.csv("Fitabase Data 4.12.16-5.12.16/weightLogInfo_merged.csv")

str(weightLog)
str(weightLog2)

rm(combined_daily_weightLog_data)

#Combine both Weight Log datasheets
combined_weightLog_data <- union_all(weightLog, weightLog2)
str(combined_weightLog_data)

combined_weightLog_data$Date <- as.Date(combined_weightLog_data$Date, format = "%m/%d/%Y %H:%M:%S")

#Combine both Weight Log datasheets and daily Activity

combined_daily_weightLog_data <- merge(combined_weightLog_data, combined_daily_data, by = c("Id", "Date"))


#Graph: Weight & Total Steps 
ggplot(combined_daily_weightLog_data, aes(x=WeightKg, y=TotalSteps)) + 
  geom_point() + 
  geom_smooth() + 
  theme(panel.background = element_blank()) +
  labs(title = "Relationship between Weight & Total Steps") +
  annotate("text", y = 15000, x = 120, 
           label = as.character(round(cor(combined_daily_weightLog_data$WeightKg, 
                                          combined_daily_weightLog_data$TotalSteps), 3)), 
           color = "red")



#Graph: Weight & Sedentary Minutes
ggplot(combined_daily_weightLog_data, aes(x=WeightKg, y=SedentaryMinutes)) + 
  geom_point() + 
  geom_smooth() + 
  theme(panel.background = element_blank()) +
  labs(title = "Relationship between Weight & Sedentary Minutes") +
  annotate("text", y = 1100, x = 120, 
           label = as.character(round(cor(combined_daily_weightLog_data$WeightKg, 
                                          combined_daily_weightLog_data$SedentaryMinutes), 3)), 
           color = "red")



