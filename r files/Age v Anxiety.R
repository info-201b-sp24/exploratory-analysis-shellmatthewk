library(dplyr)
library(tidyverse)
library(stringr)
library(ggplot2)
file <- 'Documents/Info201Code/final-project-proposal-shellmatthewk/MentalHealthResults.csv'
df <- read_csv(file)

ggplot(df, aes(x=df$`Age`, y = df$`Anxiety`)) + 
  geom_point(color = "red") +
  ggtitle("Scatterplot of Anxiety Score vs. Age") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Age") + 
  ylab("Anxiety Score")   


  
