# Load necessary libraries
install.packages("dplyr")
install.packages("factoextra")
library(ggplot2)
library(dplyr)

# Read the dataset
data <- read.csv("C://Users//Hashini//Downloads//customer_data_pca.csv")
print(data)

# Standardization
scaled_data <- scale(data)
head(scaled_data)

# Calculating PCA with eigenvalues and eigenvectors
pca_model <- prcomp(scaled_data, center = TRUE, scale. = TRUE)
print(pca_model)

# Transforming dataset into principal components
pca_transformed_data <- as.data.frame(pca_model$x)

# K-means clustering for PC1, PC2
set.seed(150)
cluster_results <- kmeans(pca_transformed_data[, 1:2], centers = 4)

pca_transformed_data$cluster <- as.factor(cluster_results$cluster)

print(pca_transformed_data)

# Draw clusters
ggplot(pca_transformed_data, aes(x = PC1, y = PC2, color = cluster)) +
  stat_ellipse(aes(fill = cluster), geom = "polygon", alpha = 0.4) +
  geom_point(size = 3, alpha = 0.8) +
  labs(title = "PC1 vs PC2 Clustering",
       x = "PC1",
       y = "PC2") +
  theme_minimal()

# Drawing clusters with convex hull for each cluster
compute_hull <- function(df) df[chull(df$PC1, df$PC2), ]

hull_data <- pca_transformed_data %>%
  group_by(cluster) %>%
  group_split() %>%
  lapply(compute_hull) %>%
  bind_rows()

print(hull_data)

