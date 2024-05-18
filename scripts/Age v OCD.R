library(dplyr)
library(tidyverse)
library(stringr)
library(ggplot2)
file <- '/Users/matthewkshell/Documents/Info201Code/exploratory-analysis-shellmatthewk/scripts/MentalHealthResults.csv'
df <- read_csv(file, show_col_types = FALSE)

ggplot(df, aes(y=df$`OCD`, x = df$`Age`)) + 
  geom_point(color = "brown") +
  ggtitle("Scatterplot of OCD Score vs. Age") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Age") + 
  ylab("OCD Score")   
  



  
