# Installing required libraries
install.packages("ggplot2")
install.packages("forecast")

# Loading the libraries into the project
library(ggplot2)
library(forecast)

# Loading the dataset
data <- read.csv("C://Users//Hashini//Downloads//Population_Dataset.csv")

# Checking the structure of the data
str(data)

# Data preprocessing: Check if the 'Date' column exists and convert it to Date format
if ("Date" %in% colnames(data)) {
  data$Date <- as.Date(data$Date, format = "%Y-%m-%d")  # Adjust the format as needed
  cat("The 'Date' column has been successfully converted to Date format.\n")
} else {
  warning("The 'Date' column does not exist in the dataset. Please check the column names.")
}
# Plot a histogram for the population data (adjust column name based on your dataset)
if ("Population" %in% colnames(data)) {
  ggplot(data, aes(x = Population)) +
    geom_histogram(binwidth = 10, fill = "blue", color = "black") +
    labs(title = "Population Distribution", x = "Population", y = "Frequency") +
    theme_minimal()
} else {
  warning("The 'Population' column does not exist in the dataset. Please check the column names.")
}



