set.seed(101) # set seed for reproducibility
num_of_samples <- 500
size_of_samples <- 150


res_bp <- data.frame(mean = numeric(num_of_samples),
                         sd = numeric(num_of_samples),
                         percentile = numeric(num_of_samples))

for (i in 1:num_of_samples) {
  
  indices <- sample(1:nrow(diabetes), size = size_of_samples, replace = TRUE)
  data <- diabetes[indices, ]
  
  
  mean_bp <- mean(data$BloodPressure)
  sd_bp <- sd(data$BloodPressure)
  percentile_bp <- quantile(data$BloodPressure,probs = 0.95)
  
  
  res_bp[i, "mean"] <- mean_bp
  res_bp[i, "sd"] <- sd_bp
  res_bp[i, "percentile"] <- percentile_bp
}



mean_bp_population <- mean(diabetes$BloodPressure)
sd_bp_population <- sd(diabetes$BloodPressure)
percentile_bp_population <- quantile(diabetes$BloodPressure)


ggplot() +
  geom_density(data = res_bp, aes(x = mean), fill = "red", alpha = 0.5) +
  geom_vline(xintercept = mean_bp_population, linetype = "dashed", color = "blue") +
  labs(title = "Comparison of Mean BloodPressure", x = "BloodPressure", y = "Density", color = "Type") +
  scale_color_manual(values = c("red", "blue"), labels = c("Sample", "Population"))


ggplot() +
  geom_density(data = res_bp, aes(x = sd), fill = "red", alpha = 0.5) +
  geom_vline(xintercept = sd_bp_population, linetype = "dashed", color = "blue") +
  labs(title = "Comparison of Standard Deviation of BloodPressure", x = "BloodPressure", y = "Density", color = "Type") +
  scale_color_manual(values = c("red", "blue"), labels = c("Sample", "Population"))


ggplot() +
  geom_density(data = res_bp, aes(x = percentile), fill = "red", alpha = 0.5) +
  geom_vline(xintercept = percentile_bp_population, linetype = "dashed", color = "blue") +
  labs(title = "Comparison of percentile of BloodPressure", x = "BloodPressure", y = "Density", color = "Type") +
  scale_color_manual(values = c("red", "blue"), labels = c("Sample", "Population"))
       