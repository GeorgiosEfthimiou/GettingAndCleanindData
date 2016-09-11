#downloads the zipped file
if(!file.exists("./Course3Data")){dir.create("./Course3Data")}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./Course3Data/data.zip")

#extracts all files
unzip("./Course3Data/data.zip", exdir = "./Course3Data/data")

#re-sets the working directory
setwd("./Course3Data/data/UCI HAR Dataset")

#Reads the train and test data sets and merges them into one
trainSet <- read.table("./train/X_train.txt")
trainLabel <- read.table("./train/y_train.txt")
trainSubject <- read.table("./train/subject_train.txt")
testSet <- read.table("./test/X_test.txt")
testLabel <- read.table("./test/y_test.txt") 
testSubject <- read.table("./test/subject_test.txt")
dataSet <- rbind(trainSet, testSet)
dataLabel <- rbind(trainLabel, testLabel)
dataSubject <- rbind(trainSubject, testSubject)

#Extracts only the mean and std measurements
allFeatures <- read.table("./features.txt")
features <- grep("mean\\(\\)|std\\(\\)", allFeatures[, 2])
dataSet <- dataSet[, features]
names(dataSet) <- gsub("\\(\\)", "", allFeatures[features, 2])
names(dataSet) <- gsub("mean", "Mean", names(dataSet))
names(dataSet) <- gsub("std", "Std", names(dataSet))
names(dataSet) <- gsub("-", "", names(dataSet))

#Gives descriptive names to the activities in the data set
activity <- read.table("./activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
activityLabel <- activity[dataLabel[, 1], 2]
dataLabel[, 1] <- activityLabel
names(dataLabel) <- "activity"

#Labels the data set with descriptive variable names
names(dataSubject) <- "subject"
names(dataSet) <- gsub("^t", "time", names(dataSet))
names(dataSet) <- gsub("f", "frequency", names(dataSet))
names(dataSet) <- gsub("Acc", "Accelometer", names(dataSet))
names(dataSet) <- gsub("Gyro", "Gyroscope", names(dataSet))
names(dataSet) <- gsub("Mag", "Magnitude", names(dataSet))
tidyData <- cbind(dataSubject, dataLabel, dataSet)

#Creates a tidy data set with the average of each variable for each activity and each subject
subjectLen <- length(table(dataSubject))
activityLen <- dim(activity)[1]
columnLen <- dim(tidyData)[2]
tidyDataMean <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) #
tidyDataMean <- as.data.frame(tidyDataMean)
colnames(tidyDataMean) <- colnames(tidyData)
row <- 1
for(i in 1:subjectLen) {
        for(j in 1:activityLen) {
                tidyDataMean[row, 1] <- sort(unique(dataSubject)[, 1])[i]
                tidyDataMean[row, 2] <- activity[j, 2]
                index1 <- i == tidyData$subject
                index2 <- activity[j, 2] == tidyData$activity
                tidyDataMean[row, 3:columnLen] <- colMeans(tidyData[index1&index2, 3:columnLen])
                row <- row + 1
        }
}
write.table(tidyDataMean, "tidy_data.txt")