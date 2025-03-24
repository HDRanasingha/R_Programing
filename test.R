#installing required libraries
install.packages("ggplot")#for graphs
install.packages("forecast")#model to predict future

#loading to project
library(ggplot2)
library(ggplot2)

#loading the dataset
data <- read.csv("C://Users//Hashini//Downloads//Coconut_Price_SriLanka_2005_2025.csv")

str(data)

#data pre processing month variable to data
data$Month <-as.Date(data$Month)

#creating the Time series
coco_t_s <- ts(data$Coconut_Price,start=c(2005,1),frequency = 12)

#plot the time series
plot(coco_t_s,main="Coconut Price Time Series",
     ylab="Price",xlab="Year",col="darkblue")






