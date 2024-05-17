library(dplyr)
library(tidyverse)
library(stringr)
library(ggplot2)
file <- 'Documents/Info201Code/final-project-proposal-shellmatthewk/MentalHealthResults.csv'
df <- read_csv(file)

df$`Average Mental Health Score` <- rowMeans(df[28:31], na.rm=TRUE)

ggplot(df, aes(x=`Average Mental Health Score`)) + 
  geom_histogram(binwidth=0.25, color="black", fill="blue") +
  ggtitle("Histogram of Average Mental Health Score") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("Count of Score") + 
  xlab("Average Score") 
