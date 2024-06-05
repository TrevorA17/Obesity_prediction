# Load dataset
obesity_data <- read.csv("data/obesity_data.csv", colClasses = c(
  Age = "integer",
  Gender = "factor",
  Height = "numeric",
  Weight = "numeric",
  BMI = "numeric",
  PhysicalActivityLevel = "factor",
  ObesityCategory = "factor"
))

# Display the structure of the dataset
str(obesity_data)

# View the first few rows of the dataset
head(obesity_data)

# View the dataset in a separate viewer window
View(obesity_data)

# Measures of Frequency
# Count of each category in Gender
gender_counts <- table(obesity_data$Gender)
print(gender_counts)

# Measures of Central Tendency
# Mean, Median, and Mode of Age
mean_age <- mean(obesity_data$Age)
median_age <- median(obesity_data$Age)
mode_age <- names(sort(-table(obesity_data$Age)))[1]
print(paste("Mean Age:", mean_age))
print(paste("Median Age:", median_age))
print(paste("Mode Age:", mode_age))

# Measures of Distribution
# Range of Height
height_range <- range(obesity_data$Height)
print(paste("Height Range:", height_range))

# Standard Deviation of Weight
weight_sd <- sd(obesity_data$Weight)
print(paste("Weight Standard Deviation:", weight_sd))

# Measures of Relationship
# Correlation between BMI and Weight
correlation_bmi_weight <- cor(obesity_data$BMI, obesity_data$Weight)
print(paste("Correlation between BMI and Weight:", correlation_bmi_weight))

# Relationship between Gender and ObesityCategory
gender_obesity_table <- table(obesity_data$Gender, obesity_data$ObesityCategory)
print(gender_obesity_table)

# Perform ANOVA
# Assuming you want to perform ANOVA to test the relationship between ObesityCategory and PhysicalActivityLevel
anova_result <- aov(BMI ~ PhysicalActivityLevel, data = obesity_data)

# Print ANOVA summary
print(summary(anova_result))

# Univariate Plots
library(ggplot2)
# Histogram of Age
age_hist <- ggplot(obesity_data, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  labs(title = "Histogram of Age", x = "Age", y = "Frequency")

# Boxplot of Weight
weight_boxplot <- ggplot(obesity_data, aes(x = "", y = Weight)) +
  geom_boxplot(fill = "orange", color = "black") +
  labs(title = "Boxplot of Weight", x = "", y = "Weight")

# Multivariate Plots
# Scatterplot of Height vs Weight colored by Gender
height_weight_scatter <- ggplot(obesity_data, aes(x = Height, y = Weight, color = Gender)) +
  geom_point() +
  labs(title = "Scatterplot of Height vs Weight by Gender", x = "Height", y = "Weight")

# Faceted histogram of BMI by ObesityCategory
bmi_hist_facet <- ggplot(obesity_data, aes(x = BMI, fill = ObesityCategory)) +
  geom_histogram(binwidth = 2, position = "dodge") +
  labs(title = "Faceted Histogram of BMI by Obesity Category", x = "BMI", y = "Frequency") +
  facet_wrap(~ObesityCategory)

# Display plots
print(age_hist)
print(weight_boxplot)
print(height_weight_scatter)
print(bmi_hist_facet)
