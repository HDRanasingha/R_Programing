library(ggplot2)
data <-read.csv("C://Users//Hashini//Downloads//origin.csv")
head(data)
str(data)

#examine the dataset
tab1e(data$Country)

data$Country <- as.factor(data$Country)

#lets draw a plot to see the data points spread

ggplot(data,aes(x=Height,y=Weight))+
  geom_point(size=3,alpha=0.7)+
  labs(title="Height against weight distribution",
       xlab="Height",
       y="Weight")+
  theme_minimal()

#lets remove country column
model_data <- data[,c("Height","Weight")]
head(model_data)

#kmeans model
set.seed(150)
results <- kmeans(model_data,centers=3)

# Draw clusters
ggplot(data, aes(x = Height, y = Weight, color = Cluster)) +
  stat_ellipse(aes(fill = Cluster), geom = "polygon", alpha = 0.4) +
  geom_point(size = 3, alpha = 0.8) +
  labs(title = "Height vs. Weight Clustering",
       x = "Height",
       y = "Weight") +
  theme_minimal() 


table(data$Country,data$Cluster)
#lets run for 10 clusters starting flom 1

optimal_number <- sapply(1:10,function(k)kmeans(model_data,centers = k)$tot.withinss)

plot(1:10,optimal_number,type = "b" ,pch=19,col ='red')

