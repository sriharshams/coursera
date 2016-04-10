Getting and Cleaning Data Course Project
---------------------------------------------------------------
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

##Goal

Companies like *FitBit, Nike,* and *Jawbone Up* are racing to develop the most advanced algorithms to attract new users. The data linked are collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:  

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The data is available at:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

R script called run_analysis.R that does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In this repository, you find:

- *run_analysis.R* : Source code written in R, to clean and prepare tidy data set

- *tidy.txt* : Tidy data, out put of *run_analysis.R*

- *CodeBook.md* : a code book that describes the variables, for data in *Tidy.txt*. 


Below steps describes all transformations performed to clean up source data <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> 


## Getting Started

###Libraries Used

The libraries used in this operation are `data.table` and `dplyr`. `data.table` is used because it is efficient in handling large data as tables. `dplyr` is used to aggregate variables to create the tidy data.

```{r, message=FALSE}
library(data.table)
library(dplyr)
```


###Read Supporting Metadata

The supporting metadata in this data are name of features and name of activities. They are loaded into variables `features` and `activity_labels`.
```{r}
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
```
##2. Extracts only measurements of mean and standard deviation for each measurement

Extract column indices that have either mean or std in them.
```{r}
extractFeatures <- grep(".*mean.*|.*std.*", features[,2])
extractFeatures.names <- features[extractFeatures,2]
```

#4. Appropriately labels the data set with descriptive variable names. 
Acc can be replaced with Accelerometer
Gyro can be replaced with Gyroscope
BodyBody can be replaced with Body
Mag can be replaced with Magnitude
Character 'f' can be replaced with Frequency
Character 't' can be replaced with Time

```{r}
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
```

###Read training data
```{r}
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")[extractFeatures]
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(subject_train, y_train, x_train)
```

###Read test data
```{r}
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")[extractFeatures]
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(subject_test, y_test, x_test)
```


##1. Merge training and test sets to create one data set
We can use rbind to combine respective data in training and test data sets corresponding to subject, activity and features. The results are stored in `subject`, `activity` and `features`.
```{r}
mergedDataset <- rbind(train, test)
colnames(mergedDataset) <- c("subject", "activity", extractFeatures.names
```


##3. Uses descriptive activity names to name the activities in the data set
Set `activity`, `Subject` as a factor variable. 
```{r}
mergedDataset$activity <- factor(mergedDataset$activity, levels = activity_labels[,1], labels = activity_labels[,2])
mergedDataset$subject <- as.factor(mergedDataset$subject)
```

##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

```{r}
mergedDataset.melted <- melt(mergedDataset, id = c("subject", "activity"))
mergedDataset.mean <- dcast(mergedDataset.melted, subject + activity ~ variable, mean)
write.table(mergedDataset.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
```
