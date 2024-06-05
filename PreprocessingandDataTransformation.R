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

# Check for missing values
missing_values <- sum(is.na(obesity_data))

if (missing_values > 0) {
  print("There are missing values in the dataset.")
} else {
  print("There are no missing values in the dataset.")
}

# Round off numeric columns to 2 decimal places
numeric_cols <- sapply(obesity_data, is.numeric)
obesity_data[numeric_cols] <- lapply(obesity_data[numeric_cols], round, 2)

# Print first few rows of the updated dataset
head(obesity_data)
