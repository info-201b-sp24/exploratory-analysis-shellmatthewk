library(dplyr)
library(tidyverse)
library(stringr)
library(ggplot2)
file <- '/Users/matthewkshell/Documents/Info201Code/exploratory-analysis-shellmatthewk/scripts/MentalHealthResults.csv'
df <- read_csv(file, show_col_types = FALSE)

df$`Average Mental Health Score` <- rowMeans(df[28:31], na.rm=TRUE)

ggplot(df, aes(x=df$`Average Mental Health Score`, y = df$`Hours per day`)) + 
  geom_point(color = "blue") +
  ggtitle("Scatterplot of Hours Per Day vs. Mental Health Score") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("Hours Per Day") + 
  xlab("Average Score")   
  



  
