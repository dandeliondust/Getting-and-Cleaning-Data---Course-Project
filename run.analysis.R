## You should create one R script called run.analysis.R that does the following:

## 1. Merges the training and the test sets to create one data set.
## Read training sets
training.sets <- read.table("./train/X_train.txt")
## Read test sets
test.sets <- read.table("./test/X_test.txt")
## Merge both x data sets
x.data <- rbind(training.sets, test.sets)

## Read train subject data
subject.train <- read.table("./train/subject_train.txt")
## Read test subject data
subject.test <- read.table("./test/subject_test.txt")
## Merge both subject data sets
subject.data <- rbind(subject.train, subject.test)

## Read train label data
activity.train <- read.table("./train/Y_train.txt")
## Read test label data
activity.test <- read.table("./test/Y_test.txt")
## Merge both activity labels data sets
activity.data <- rbind(activity.train, activity.test)

## Merge all three data sets to create one data set
overall.data <- cbind(subject.data, activity.data, x.data)

## 2. Extracts only the measurements on the mean (i.e, mean()) and standard 
## deviation (i.e, std()) for each measurement.
## Read features data
features <- read.table("./features.txt")
## Find relevant rows relating to mean and std
relevant.features <- grep("mean\\(\\)|std\\(\\)", features[,2])+2
## Subset relevant columns in data set
relevant.data <- overall.data[,c(1:2, relevant.features)]

## 3. Uses descriptive activity names to name the activities in the data set
## Read activity labels data
activity.label <- read.table("activity_labels.txt")
## Change all values in data set for activity to descriptive names
relevant.data[,2] <- activity.label[relevant.data[,2],2]
## Make activity labels to be all lower-cased
relevant.data[,2] <- tolower(relevant.data[,2])
## Fixing '_' in activity labels to '.'
relevant.data[,2] <- sub("_", ".", relevant.data[,2])

## 4. Appropriately labels the data set with descriptive variable names.
## Subset relevant features labels
relevant.features.label <- features[relevant.features-2,]
## Fixing relevant features labels to naming convention
relevant.features.label[,2] <- gsub("-",".", tolower(relevant.features.label[,2]))
relevant.features.label[,2] <- gsub("\\(\\)","", relevant.features.label[,2])
## Create character vector containing column names for data set
variable.names <- c("subject","activity",relevant.features.label[,2])
## Label data set with variable names
colnames(relevant.data) <- variable.names

## First data set
tidy1 <- relevant.data

## 5. From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
## Load dplyr package
library("dplyr")
## Group data according to subject and activity
grouped.data <- group_by(tidy1, subject, activity)
## Get data set with mean for each variable for each activity and each subject
tidy2 <- summarise_each(grouped.data, funs(mean))
## Create text file for data set
write.table(tidy2, "tidy_data_set_mean.txt", row.names = FALSE)
