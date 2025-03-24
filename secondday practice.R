# Load necessary library
library(ggplot2)

# Read the CSV file
data <- read.csv("C://Users//Hashini//Downloads//Customer_Data.csv")

# Preview data structure
head(data)
str(data)

# Scatter plot to visualize Membership Years vs Visit Frequency
ggplot(data, aes(x = MembershipYears, y = VisitFrequency)) +
  geom_point(size = 3, alpha = 0.7) +
  labs(title = "Membership Years vs Visit Frequency Distribution",
       x = "Membership Years",
       y = "Visit Frequency") +
  theme_minimal()

# Select relevant columns for clustering
model_data <- data[, c("MembershipYears", "VisitFrequency")]
head(model_data)

# K-means clustering with 3 clusters
set.seed(150)
results <- kmeans(model_data, centers = 3)

# Assign clusters to the original dataset
data$Cluster <- as.factor(results$cluster)

# Plot clusters
ggplot(data, aes(x = MembershipYears, y = VisitFrequency, color = Cluster)) +
  stat_ellipse(aes(fill = Cluster), geom = "polygon", alpha = 0.4) +
  geom_point(size = 3, alpha = 0.8) +
  labs(title = "Membership Years vs Visit Frequency Clustering",
       x = "Membership Years",
       y = "Visit Frequency") +
  theme_minimal()

# Determine optimal number of clusters using the Elbow Method
optimal_number <- sapply(1:10, function(k) kmeans(model_data, centers = k)$tot.withinss)

# Plot the Elbow Curve
plot(1:10, optimal_number, type = "b", pch = 19, col = 'red',
     xlab = "Number of Clusters", ylab = "Total Within-Cluster Sum of Squares",
     main = "Elbow Method for Optimal Clusters")

