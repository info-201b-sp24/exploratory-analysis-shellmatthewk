library(dplyr)
library(tidyverse)
library(stringr)
library(ggplot2)
file <- '/Users/matthewkshell/Documents/Info201Code/exploratory-analysis-shellmatthewk/scripts/MentalHealthResults.csv'
df <- read_csv(file, show_col_types = FALSE)

ggplot(df, aes(x=df$`Age`, y = df$`Anxiety`)) + 
  geom_point(color = "red") +
  ggtitle("Scatterplot of Anxiety Score vs. Age") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Age") + 
  ylab("Anxiety Score")   


  
