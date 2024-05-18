library(dplyr)
library(tidyverse)
library(stringr)
library(ggplot2)
file <- '/Users/matthewkshell/Documents/Info201Code/exploratory-analysis-shellmatthewk/scripts/MentalHealthResults.csv'
df <- read_csv(file, show_col_types = FALSE)

ggplot(df, aes(y=df$`Insomnia`, x = df$`Age`)) + 
  geom_point(color = "purple") +
  ggtitle("Scatterplot of Insomnia Score vs. Age") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Age") + 
  ylab("Insomnia Score")   

  
