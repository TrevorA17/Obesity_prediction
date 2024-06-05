# Saving the Random Forest model
saveRDS(rf_model, "./models/saved_rf_model.rds")

# Load the saved model
loaded_rf_model <- readRDS("./models/saved_rf_model.rds")

# Prepare new data for prediction
new_data <- data.frame(
  Gender = "Male",
  Height = 175,
  Weight = 80,
  BMI = 26,
  PhysicalActivityLevel = "3"
)

# Use the loaded model to make predictions
predictions_loaded_model <- predict(loaded_rf_model, newdata = new_data)

# Print predictions
print(predictions_loaded_model)
