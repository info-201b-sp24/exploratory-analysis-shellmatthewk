library(dplyr)
library(tidyverse)
library(stringr)
file <- '/Users/matthewkshell/Documents/Info201Code/exploratory-analysis-shellmatthewk/scripts/MentalHealthResults.csv'
df_mental <- read_csv(file)

summary_info <- list()
summary_info$num_observations = nrow(df_mental)

average_age <- df_mental %>%
  select(Age) %>%
  summarise(average_age = mean(Age, na.rm = TRUE)) %>%
  pull(average_age)
  
summary_info$average_age <- round(average_age, digits = 2)

average_hours_listened <- df_mental %>%
  select(`Hours per day`) %>%
  summarise(average_hours_listened = mean(`Hours per day`, na.rm = TRUE)) %>%
  pull(average_hours_listened)

summary_info$average_hours_listened <- round(average_hours_listened, digits = 2)

most_common_streaming <- df_mental %>%
  select(`Primary streaming service`) %>%
  group_by(`Primary streaming service`) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) %>%
  slice(1)

name_streaming <- most_common_streaming %>%
  pull(`Primary streaming service`)

num_streaming <- most_common_streaming %>%
  pull()

result_string <- paste(name_streaming, ": ", num_streaming)
summary_info$most_common_streaming <- result_string   

average_anxiety <- df_mental %>%
  select(`Anxiety`) %>%
  summarise(average_anxiety = mean(`Anxiety`, na.rm = TRUE)) %>%
  pull(average_anxiety)

summary_info$average_anxiety <- round(average_anxiety, digits = 2)

average_depression <- df_mental %>%
  select(`Depression`) %>%
  summarise(average_depression = mean(`Depression`, na.rm = TRUE)) %>%
  pull(average_depression)

summary_info$average_depression <- round(average_depression, digits = 2)

average_insomnia <- df_mental %>%
  select(`Insomnia`) %>%
  summarise(average_insomnia = mean(`Insomnia`, na.rm = TRUE)) %>%
  pull(average_insomnia)

summary_info$average_insomnia <- round(average_insomnia, digits = 2)

average_OCD <- df_mental %>%
  select(`OCD`) %>%
  summarise(average_OCD = mean(`OCD`, na.rm = TRUE)) %>%
  pull(average_OCD)

summary_info$average_OCD <- round(average_OCD, digits = 2)

