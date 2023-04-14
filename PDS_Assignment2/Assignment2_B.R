

percentile <- quantile(data$BMI, probs = 0.98)
population_percentile <- quantile(diabetes$BMI, probs = 0.98)


percentile_df <- data.frame(
  variable = c("Sample 98th Percentile", "Population 98th Percentile"),
  value = c(percentile, population_percentile)
)
ggplot(percentile_df, aes(x = variable, y = value)) + 
  geom_bar(stat = "identity", fill = "pink") + 
  ggtitle("Comparison of Sample and Population 98th Percentile of BMI") + 
  ylab("BMI")