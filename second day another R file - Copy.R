library(ggplot2)

# Load the dataset
data <- read.csv("C://Users//Hashini//Downloads//origin.csv")

# Check the dataset structure
head(data)
str(data)
colnames(data)  # Ensure correct column names

# Check unique values in Country column
table(data$Country)

# Convert Country column to factor
data$Country <- as.factor(data$Country)

# Scatter plot to visualize height vs. weight
ggplot(data, aes(x = Height, y = Weight)) +
  geom_point(size = 3, alpha = 0.7) +
  labs(title = "Height vs. Weight Distribution",
       x = "Height",
       y = "Weight") +  
  theme_minimal()

# Remove 'Country' column and create a dataset for clustering
model_data <- data[, c("Height", "Weight")]

# Check the data
head(model_data)

# Run K-means clustering
set.seed(150)
results <- kmeans(model_data, centers = 3)

# Add cluster assignments to the original dataset
data$Cluster <- as.factor(results$cluster)  # Convert to factor for ggplot

# Draw clusters
ggplot(data, aes(x = Height, y = Weight, color = Cluster)) +
  stat_ellipse(aes(fill = Cluster), geom = "polygon", alpha = 0.4) +
  geom_point(size = 3, alpha = 0.8) +
  labs(title = "Height vs. Weight Clustering",
       x = "Height",
       y = "Weight") +
  theme_minimal()

# Check cluster counts by country
table(data$Country, data$Cluster)

