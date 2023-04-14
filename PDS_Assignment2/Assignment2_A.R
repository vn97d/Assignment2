library(tidyverse)

set.seed(101)  


diabetes <- read_csv("~/PDS_Assignment2/diabetes.csv")

data <- diabetes %>% 
  sample_n(size = 25)


mean_glucose <- mean(data$Glucose)
highest_glucose <- max(data$Glucose)


mean_population <- mean(diabetes$Glucose)
highest_population <- max(diabetes$Glucose)


ggplot() +
  geom_bar(data = tibble(
    `Mean Glucose` = c(mean_population, mean_glucose),
    Type = c("Population", "Sample")
  ), aes(x = Type, y = `Mean Glucose`), stat = "identity") +
  labs(title = "Comparison of Mean Glucose Values", y = "Mean Glucose")


ggplot() +
  geom_bar(data = tibble(
    `Highest Glucose` = c(highest_population, highest_glucose),
    Type = c("Population", "Sample")
  ), aes(x = Type, y = `Highest Glucose`), stat = "identity",fill="yellow") +
  labs(title = "Comparison of Highest Glucose Values", y = "Highest Glucose")
