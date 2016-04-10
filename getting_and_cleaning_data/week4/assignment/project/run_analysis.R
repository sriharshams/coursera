## Author: Sriharsha M S
## Project : Coursera Getting and Cleaning Data project

#Loading libraries
library(data.table)
library(dplyr)

#Get data
getwd()
#Note: This directory needs to be changed based on the required directory for data location
setwd("C:/learning/coursera/coursera-data_science-data/getting_and_cleaning_data/week4/assignment/project/data")
filename <- "getdata_dataset.zip"

## Download and unzip the dataset:
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, mode='wb', cacheOK=FALSE)
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}


# Load activity labels + features
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
extractFeatures <- grep(".*mean.*|.*std.*", features[,2])
extractFeatures.names <- features[extractFeatures,2]

#4. Appropriately labels the data set with descriptive variable names. 
#Acc can be replaced with Accelerometer
#Gyro can be replaced with Gyroscope
#BodyBody can be replaced with Body
#Mag can be replaced with Magnitude
#Character 'f' can be replaced with Frequency
#Character 't' can be replaced with Time

extractFeatures.names = gsub("Acc", "Accelerometer", extractFeatures.names)
extractFeatures.names = gsub("Gyro", "Gyroscope", extractFeatures.names)
extractFeatures.names = gsub("BodyBody", "Body", extractFeatures.names)
extractFeatures.names = gsub("Mag", "Magnitude", extractFeatures.names)
extractFeatures.names = gsub("freq", "Frequency", extractFeatures.names)
extractFeatures.names = gsub("^t", "Time", extractFeatures.names)
extractFeatures.names = gsub("^f", "Frequency", extractFeatures.names)
extractFeatures.names = gsub("tBody", "TimeBody", extractFeatures.names)
extractFeatures.names = gsub('-mean', 'Mean', extractFeatures.names)
extractFeatures.names = gsub("-std", "Std", extractFeatures.names)
extractFeatures.names <- gsub("[-()]", "", extractFeatures.names)
extractFeatures.names = gsub("angle", "Angle", extractFeatures.names)
extractFeatures.names = gsub("gravity", "Gravity", extractFeatures.names)


# Load the datasets
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")[extractFeatures]
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(subject_train, y_train, x_train)

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")[extractFeatures]
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(subject_test, y_test, x_test)

##1. Merge training and test sets to create one data set
# merge datasets and add labels
mergedDataset <- rbind(train, test)
colnames(mergedDataset) <- c("subject", "activity", extractFeatures.names)

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# turn activities & subjects into factors
mergedDataset$activity <- factor(mergedDataset$activity, levels = activity_labels[,1], labels = activity_labels[,2])
mergedDataset$subject <- as.factor(mergedDataset$subject)

mergedDataset.melted <- melt(mergedDataset, id = c("subject", "activity"))
mergedDataset.mean <- dcast(mergedDataset.melted, subject + activity ~ variable, mean)
View(mergedDataset.mean)
names(mergedDataset.mean)
write.table(mergedDataset.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
