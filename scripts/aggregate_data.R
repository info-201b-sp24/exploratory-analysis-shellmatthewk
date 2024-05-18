library(dplyr)
library(tidyverse)
library(stringr)
#Load data
file <- '/Users/matthewkshell/Documents/Info201Code/exploratory-analysis-shellmatthewk/scripts/MentalHealthResults.csv'
df_mentalhealth <- read_csv(file)

#Selecting only useful columns
df <- df_mentalhealth %>% 
  select(-(Timestamp)) %>%
  select(-(`Primary streaming service`)) %>%
  select(-(`BPM`)) %>%
  select(-(`While working`:`Foreign languages`)) %>%
  select(-(`Frequency [EDM]`:`Frequency [Metal]`)) %>%
  select(-(`Music effects`:`Permissions`))


#Change column names to be more readable
colnames(df) <- c("Age",
                  "Hours per day",
                  "Classical Frequency",
                  "Country Frequency",
                  "Pop Frequency",
                  "R&B Frequency",
                  "Rap Frequency",
                  "Rock Frequency",
                  "Video Game Music Frequency",
                  "Anxiety Score",
                  "Depression Score",
                  "Insomnia Score",
                  "OCD Score"
                  )
df <- df[-1, ]

#Function to turn strings into numeric
convert_column_to_numeric <- function(column) {
  column <- as.character(column)
  column[column == "Never"] <- 0
  column[column == "Rarely"] <- 1
  column[column == "Sometimes"] <- 2
  column[column == "Very frequently"] <- 3
  return(as.numeric(column))
}

#converting strings to numeric
columns_to_convert <- c("Classical Frequency", "Country Frequency", "Pop Frequency",
                        "R&B Frequency", "Rap Frequency", "Rock Frequency",
                        "Video Game Music Frequency")

#loop through all columns
for (col in columns_to_convert) {
  df[[col]] <- convert_column_to_numeric(df[[col]])
}

#send into a table and sort meaningfully, rounding to nice values
summary_stats <- df %>%
  group_by(`Hours per day`) %>%
  summarise(
    Num_Entries = n(),
    Avg_Age = round(mean(Age, na.rm = TRUE), digits = 2),
    Avg_Hours_Per_Day = round(mean(`Hours per day`, na.rm = TRUE), digits = 2),
    Avg_Classical_Frequency = round(mean(`Classical Frequency`, na.rm = TRUE), digits = 2),
    Avg_Country_Frequency = round(mean(`Country Frequency`, na.rm = TRUE), digits = 2),
    Avg_Pop_Frequency = round(mean(`Pop Frequency`, na.rm = TRUE), digits = 2),
    Avg_R_B_Frequency = round(mean(`R&B Frequency`, na.rm = TRUE), digits = 2),
    Avg_Rap_Frequency = round(mean(`Rap Frequency`, na.rm = TRUE), digits = 2),
    Avg_Rock_Frequency = round(mean(`Rock Frequency`, na.rm = TRUE), digits = 2),
    Avg_Video_Game_Music_Frequency = round(mean(`Video Game Music Frequency`, na.rm = TRUE), digits = 2),
    Avg_Anxiety_Score = round(mean(`Anxiety Score`, na.rm = TRUE), digits = 2),
    Avg_Depression_Score = round(mean(`Depression Score`, na.rm = TRUE), digits = 2),
    Avg_Insomnia_Score = round(mean(`Insomnia Score`, na.rm = TRUE), digits = 2),
    Avg_OCD_Score = round(mean(`OCD Score`, na.rm = TRUE), digits = 2)
  ) 

#fit to HTML
music_table <- summary_stats %>%
  kable(format = "html", table_class = "table table-striped") %>%
  kable_styling(full_width = FALSE) %>%
  row_spec(0, bold = TRUE) %>%
  row_spec(row = 1:nrow(summary_stats), extra_css = "border-bottom: solid 1px #dddddd;") %>%
  kable_styling(font_size = 12, position = "left", html_font = "Arial")
print(music_table)