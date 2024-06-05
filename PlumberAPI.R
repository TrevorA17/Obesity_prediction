# Load the saved Random Forest model
loaded_rf_model <- readRDS("./models/saved_rf_model.rds")

#* @apiTitle Obesity Prediction Model API
#* @apiDescription Used to predict obesity.

#* @param Gender Gender of the individual (Male/Female)
#* @param Height Height of the individual (in cm)
#* @param Weight Weight of the individual (in kg)
#* @param BMI Body Mass Index (BMI) of the individual
#* @param PhysicalActivityLevel Level of physical activity (1 to 5)

#* @get /predict_obesity
predict_obesity <- function(Gender, Height, Weight, BMI, PhysicalActivityLevel) {
  
  # Create a data frame using the arguments
  new_data <- data.frame(
    Gender = as.factor(Gender),
    Height = as.numeric(Height),
    Weight = as.numeric(Weight),
    BMI = as.numeric(BMI),
    PhysicalActivityLevel = as.factor(PhysicalActivityLevel)
  )
  
  # Use the loaded model to make predictions
  prediction <- predict(loaded_rf_model, newdata = new_data)
  
  # Return the prediction
  return(prediction)
}
