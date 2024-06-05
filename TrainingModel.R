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

# Train CART Model
rpart_model <- train(ObesityCategory ~ ., data = obesity_data, method = "rpart", trControl = ctrl)

# Evaluate Model
print(rpart_model)

# Load necessary library
library(randomForest)

# Train Random Forest Model
rf_model <- train(ObesityCategory ~ ., data = obesity_data, method = "rf", trControl = ctrl)

# Print model
print(rf_model)

# Load necessary libraries
library(caret)
library(e1071)

# Train SVM with Radial Kernel
svm_model <- train(ObesityCategory ~ ., data = obesity_data, method = "svmRadial", trControl = ctrl)

# Print model
print(svm_model)

# Compare model performance using resamples
resamples_list <- resamples(list(rpart = rpart_model, svm = svm_model, rf = rf_model))

# Summarize performance
summary_results <- summary(resamples_list)
print(summary_results)





