#installing required libraries
install.packages("ggplot2")#for graphs
install.packages ("forecast")

#loading to project
library(ggplot2)
library(forecast)



# Checking the structure of the data
str(data)

# Data pre-processing: month variable to date format
data$Month <- as.Date(data$Month)

# Creating a histogram of coconut prices
ggplot(data, aes(x = Coconut_Price)) +
  geom_histogram(binwidth = 8, fill = "red", color = "black") +
  labs(title = "Coconut Price Distribution",
       x = "Rs", y = "Frequency") +
  theme_minimal()

# Creating the time series
coco_t_s <- ts(data$Coconut_Price, start = c(2005, 1), frequency = 12)

# Plotting the time series
plot(coco_t_s, main = "Coconut Price Time Series",
     ylab = "Price", xlab = "Year", col = "darkblue")

# Future Predictions using ARIMA
Model <- auto.arima(coco_t_s)  # Ensure model is created successfully
predict <- forecast(Model, h = 24)


