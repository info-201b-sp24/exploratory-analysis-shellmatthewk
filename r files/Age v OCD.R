library(dplyr)
library(tidyverse)
library(stringr)
library(ggplot2)
file <- 'Documents/Info201Code/final-project-proposal-shellmatthewk/MentalHealthResults.csv'
df <- read_csv(file)

ggplot(df, aes(y=df$`OCD`, x = df$`Age`)) + 
  geom_point(color = "brown") +
  ggtitle("Scatterplot of OCD Score vs. Age") + 
  theme(plot.title = element_text(hjust = 0.1)) +
  xlab("Age") + 
  ylab("OCD Score")   
  



  
