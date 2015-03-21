## Introduction
This document describes the process of creating the files `tidy_data_set.txt` and `tidy_data_set_mean.txt` using the data files downloaded from "Human Activity Recognition Using Smartphones" project."

#### File: `tidy_data_set.txt`
This file was created by following the 4 broad steps below:

1. Merges the training and the test sets to create one data set.
  1. To achieve this, we would first need to merge the following two files into one data frame:
    * `./train/X_train.txt` - contains data of training sets
    * `./test/X_test.txt` - contains data of test sets
  2. Next, we need to merge the following two files into a second data frame:
    * `./train/subject_train.txt` - contains the human subject for whom the data in `./train/X_train.txt` relates to
    * `./test/subject_test.txt` - contains the human subject for whom the data in `./test/X_test.txt` relates to
  3. Then, we need to merge the following two files into a third data frame:
    * `./train/Y_train.txt` - contains the activity number performed by the human subject for which the data in `./train/X_train.txt` relates to
    * `./test/Y_test.txt` - contains the activity number performed by the human subject for which the data in `./test/X_test.txt` relates to
  4. Finally, we will merge all three data frames to create one data set
    
2. Extracts only the measurements on the mean and standard deviation for each 
measurement.
  1. To achieve this, we will first have to read the following file
    * `features.txt` - contains the descriptive names for all measurements
  2. As we are only concern with mean (i.e., names with __mean()__) and standard deviation (i.e., names with __std()__) measurements, we can proceed to subset a numeric vector specifying the column numbers relating to mean and standard deviation measurements. Bear in mind that we need to +2 to each element in the numeric vector as the first two columns of our data set relate to the subject and activity, not measurements.
  3. Finally, we can proceed to subset the relevant columns from our overall data set
          
3. Uses descriptive activity names to name the activities in the data set.
  1. To achieve this, we will first have to read the following file
    * `activity_labels.txt` - contains the descriptive names corresponding to the activities numbers found in `./train/Y_train.txt` and `./test/Y_test.text`
  2. Next, we can change all the activity numbers in our data set to the descriptive names
  3. Finally, edit the descriptive names to be of lower-case and separated by '.'

4. Appropriately labels the data set with descriptive variable names.
  1. Identify the relevant labels for our data set by subsetting from the features data frame
  2. Fix the names of the labels to naming conventions by substituting '-' with '.', removing '()', and transforming to lower case
  3. Before we can label our data set with descriptive variable names, we can first create a character vector containing all the variable names
  4. Finally, we can proceed to rename our column names by using `colnames()`
  5. After this stage, our first tidy data set will be created using `write.table()`

#### File: `tidy_data_set_mean.txt`
This file was created by using the data set we created above and passing it through this last step.

1. From the data set in step 4, creates a second, independent tidy data set with 
the average of each variable for each activity and each subject.
  1. We will achieve this by using the `dplyr` package
  2. First, we will group our data set by __subject__ and __activity__ by using `group_by()`
  3. Then, we will create a data set with the mean for each variable for each activity and each subject by using `summarise_each()`
  4. Lastly, the required tidy data set for this project will be created using `write.table()`
