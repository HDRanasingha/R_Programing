# Install necessary packages (Run this once)
install.packages("ggplot2")
install.packages("tseries")
install.packages("forecast")

# Load libraries
library(ggplot2)
library(tseries)
library(forecast)

# Load the dataset
rice_prices <- read.csv("C://Users//Hashini//Downloads//Rice_Prices_Dataset.csv")

# Convert Date column to Date format
rice_prices$Date <- as.Date(rice_prices$Date, format="%Y-%m-%d")

# Create a time series object (assuming monthly data)
rice_prices_ts <- ts(rice_prices$Rice_Prices, start=c(2000,1), frequency=12)

# Plot the time series data
ggplot(rice_prices, aes(x=Date, y=Rice_Prices)) +
  geom_line(color="red") +
  ggtitle("Rice Prices Over Time") +
  xlab("Date") + ylab("Rice Prices") +
  theme_minimal()

# Decompose the time series into Trend, Seasonality, Residuals
decomposed <- decompose(rice_prices_ts)

# Plot decomposition
plot(decomposed)

# Frequency Spectrum Analysis
spectrum(rice_prices_ts, main="Rice Prices Frequency Spectrum", col="red")

# Perform Augmented Dickey-Fuller Test for stationarity
adf.test(rice_prices_ts)

# Fit an ARIMA model for forecasting
arima_model <- auto.arima(rice_prices_ts)
summary(arima_model)

# Forecast next 12 months
forecasted <- forecast(arima_model, h=12)

# Plot the forecasted values
plot(forecasted, main="Rice Prices Forecast", col="blue", xlab="Time", ylab="Price")
