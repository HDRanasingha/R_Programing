# Load required library
library(ggplot2)

# Read the data
data <- read.csv("C://Users//Hashini//Downloads//Customer_Data.csv")

# Examine the dataset structure
head(data)
str(data)

# Create a scatter plot using VisitFrequency and MembershipYears for clustering
ggplot(data, aes(x=VisitFrequency, y=MembershipYears)) +
  geom_point(size=3, alpha=0.7) +
  labs(title="Visit Frequency vs Membership Years Distribution",
       x="Visit Frequency",
       y="Membership Years") +
  theme_minimal()

# Prepare data for clustering
model_data <- data[, c("VisitFrequency", "MembershipYears")]
head(model_data)

# Perform k-means clustering with 3 centers
set.seed(150)
results <- kmeans(model_data, centers=3)

# Add cluster assignments to the original data
data$Cluster <- as.factor(results$cluster)

# Draw clusters
ggplot(data, aes(x=VisitFrequency, y=MembershipYears, color=Cluster)) +
  stat_ellipse(aes(fill=Cluster), geom="polygon", alpha=0.4) +
  geom_point(size=3, alpha=0.8) +
  labs(title="Visit Frequency vs Membership Years Clustering",
       x="Visit Frequency",
       y="Membership Years") +
  theme_minimal()

# Find optimal number of clusters
optimal_number <- sapply(1:10, function(k) {
  kmeans(model_data, centers=k)$tot.withinss
})

# Plot elbow curve
plot(1:10, optimal_number, type="b", pch=19, col='red',
     xlab="Number of Clusters (k)",
     ylab="Total Within-Cluster Sum of Squares",
     main="Elbow Method for Optimal k")
