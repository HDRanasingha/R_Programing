library(ggplot2)
data <-read.csv("C://Users//Hashini//Downloads//Climate.csv")
head(data)
str(data)

#examine the dataset
tab1e(data$ClimateZone)

data$Country <- as.factor(data$ClimateZone)

#lets draw a plot to see the data points spread

ggplot(data,aes(x=Temperature,y=Rainfall))+
  geom_point(size=3,alpha=0.7)+
  labs(title="Height against weight distribution",
       xlab="Temperature",
       y="Rainfall")+
  theme_minimal()

#lets remove country column
model_data <- data[,c("Temperature","Rainfall")]
head(model_data)

#kmeans model
set.seed(150)
results <- kmeans(model_data,centers=3)  

# Draw clusters
ggplot(data, aes(x = Temperature, y = Rainfall, color = Cluster)) +
  stat_ellipse(aes(fill = Cluster), geom = "polygon", alpha = 0.4) +
  geom_point(size = 3, alpha = 0.8) +
  labs(title = "Temperature vs. Rainfall Clustering",
       x = "Temperature",
       y = "Weight") +
  theme_minimal() 


