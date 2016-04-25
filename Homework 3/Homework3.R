library(party)

mydata <- read.csv('D:/My work/M.Eng 1st sem/IDA/Assignment/Homework 3/breast-cancer-wisconsin.csv')
#head(mydata, n=30)

for(i in 1:length(mydata)) {
  mydata[which(mydata[,i] == '?'),i] <- NA
  mydata[,i] <- as.numeric(as.character(mydata[,i]))
  mean_mydata <- mean(mydata[,i], na.rm = TRUE)
  mydata[which(is.na(mydata[,i])),i] <- mean_mydata
}

serial_values <- c(1:699)
random_values <- sample(serial_values)

training_data <- mydata[random_values[1:500],]
test_data <- mydata[random_values[501:699],]

mydata_ctree <- ctree(training_data[,11]~training_data[,2]+training_data[,3]+training_data[,4]+training_data[,5]+training_data[,6]+training_data[,7]+training_data[,8]+training_data[,9]+training_data[,10],data=training_data[,2:11],controls = ctree_control(minsplit = 25))
plot(mydata_ctree)
#nodes(mydata_ctree,12)

is.atomic(training_data[,11])
predict_from <- mydata[,0:4]
predict <- mydata[,11]
predict_new <- data.frame(predict)
names(predict)mydata_rpart <- rpart(mydata[,11]~mydata[,10],data=mydata,method="class",control=rpart.control(minsplit=30))
plot(mydata_rpart)
mydata$BareNuclei[mydata$BareNuclei == ?]
typeof(predict_new)