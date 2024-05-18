library(dplyr)
library(tidyverse)
library(ggplot2)
file <- '/Users/matthewkshell/Documents/Info201Code/exploratory-analysis-shellmatthewk/scripts/MentalHealthResults.csv'
df <- read_csv(file, show_col_types = FALSE)

df$`Average Mental Health Score` <- rowMeans(df[28:31], na.rm=TRUE)

ggplot(df, aes(x=`Average Mental Health Score`)) + 
  geom_histogram(binwidth=0.25, color="black", fill="blue") +
  ggtitle("Histogram of Average Mental Health Score") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("Count of Score") + 
  xlab("Average Score") 

