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
