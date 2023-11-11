# Load The .RDA Data into your working environment
# Replace the Path with where your data-set is located.
load("C:\\Users\\MRAMERICA-PC\\Desktop\\36158-0001-Data.rda")
load("C:\\Users\\MRAMERICA-PC\\Desktop\\36158-0002-Data.rda")

# Declare Data Objects
data1 <- da36158.0001
data2 <- da36158.0002

# Combine DataSet
# Select only relevant columns
# as the two data-sources aren't exactly 1:1
data1_selected <- data1[c("SCWM_JSAT", "SCEM_DIST")]
data2_selected <- data2[c("SCWM_JSAT", "SCEM_DIST")]

# Create an object that represents the combined data
combined_data <- rbind(data1_selected,data2_selected)

# Create Correlation between Job Satisfation and Psych Distress
cor_coef <- cor(combined_data$SCWM_JSAT, combined_data$SCEM_DIST, use = "complete.obs")

# Install and use ggplot 2 Library
install.packages("ggplot2")
library(ggplot2)

# Create the plot
ggplot(da36158.0001, aes(x = SCWM_JSAT, y = SCEM_DIST)) +
  geom_point() + # Scatter plot
  geom_smooth(method = lm, color = "blue") + # Regression line
  ggtitle("Correlation between Job Satisfaction and Psychological Distress") +
  xlab("Job Satisfaction") +
  ylab("Psychological Distress") +
  annotate("text", x = min(combined_data$SCWM_JSAT), y = max(combined_data$SCEM_DIST), label = paste("r = ", round(cor_coef, 2)), hjust = 0, vjust = 1)


