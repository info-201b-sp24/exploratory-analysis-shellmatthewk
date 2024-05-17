library(dplyr)
library(tidyverse)
library(stringr)
library(ggplot2)
file <- 'Documents/Info201Code/final-project-proposal-shellmatthewk/MentalHealthResults.csv'
df <- read_csv(file)

ggplot(df, aes(y=df$`Insomnia`, x = df$`Age`)) + 
  geom_point(color = "purple") +
  ggtitle("Scatterplot of Insomnia Score vs. Age") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Age") + 
  ylab("Insomnia Score")   

  
