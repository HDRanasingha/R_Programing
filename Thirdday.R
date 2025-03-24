data  <- read.csv("C://Users//Hashini//Downloads//customer_data_pca.csv")
data
install.packages("dplyr")
install.packages("factoextra")
library(ggplot2)
library(dplyr)
library(factoextra)

#standardization
scaled_data <- scale(data)
head(scaled_data)

#calculating PCA with eingvalues and eignvectors

pca_model <- prcomp(scaled_data, center=TRUE, scale=TRUE)
pca_model
summary(pca-model)

#scree plot
fviz_eig(pca_model, addlables = TRUE, ylim = c(0,100))



#transforming dataset intro principle components
pca_transformed_data <- as.data.frame(pca_model$x)
head(pca_transformed_data)

# Visualizing PC1 & PC2 using ggplot2
ggplot(pca_transformed_data, aes(x = PC1, y = PC2)) +
  geom_point(color = "red", alpha = 0.6) +
  ggtitle("Customer Segmentation Based on PC1 and PC2") +
  theme_minimal()


