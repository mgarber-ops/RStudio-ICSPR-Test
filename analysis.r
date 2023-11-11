# Load The .RDA Data into your working environment
# Replace the Path with where your data-set is located.
load("C:\\Users\\MRAMERICA-PC\\Desktop\\36158-0001-Data.rda")

# Create Correlation between Job Satisfation and Psych Distress
cor_coef <- cor(data$SCWM_JSAT, data$SCEM_DIST, use = "complete.obs")

# Install GGplot2
install.packages("ggplot2")
library(ggplot2)

# Create the plot
ggplot(data, aes(x = SCWM_JSAT, y = SCEM_DIST)) +
  geom_point() + # Scatter plot
  geom_smooth(method = lm, color = "blue") + # Regression line
  ggtitle("Correlation between Job Satisfaction and Psychological Distress") +
  xlab("Job Satisfaction") +
  ylab("Psychological Distress") +
  annotate("text", x = min(data$SCWM_JSAT), y = max(data$SCEM_DIST), label = paste("r = ", round(cor_coef, 2)), hjust = 0, vjust = 1)
