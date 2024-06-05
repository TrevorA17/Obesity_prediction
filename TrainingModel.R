# Load dataset
obesity_data <- read.csv("your_dataset.csv", colClasses = c(
  Age = "integer",
  Gender = "factor",
  Height = "numeric",
  Weight = "numeric",
  BMI = "numeric",
  PhysicalActivityLevel = "factor",
  ObesityCategory = "factor"
))

# Set seed for reproducibility
set.seed(123)

# Split data into training and testing sets
train_index <- sample(1:nrow(obesity_data), 0.7 * nrow(obesity_data))
train_data <- obesity_data[train_index, ]
test_data <- obesity_data[-train_index, ]

# Print dimensions of training and testing sets
print(paste("Training data dimensions:", dim(train_data)))
print(paste("Testing data dimensions:", dim(test_data)))

# Set seed for reproducibility
set.seed(123)

# Perform bootstrapping
bootstrapped_data <- replicate(100, sample(obesity_data, replace = TRUE))

# Print dimensions of bootstrapped data
print(paste("Dimensions of bootstrapped data:", dim(bootstrapped_data)))

# Remove Age column
obesity_data <- obesity_data[, -which(names(obesity_data) == "Age")]

# Set seed for reproducibility
set.seed(123)

# Define cross-validation control
ctrl <- trainControl(method = "cv", number = 5)

# Fit model using cross-validation
cv_model <- train(ObesityCategory ~ ., data = obesity_data, method = "rpart", trControl = ctrl)

# Print cross-validation results
print(cv_model)
