## Introduction
This document describes the process of creating the files `tidy_data_set.txt` and `tidy_data_set_mean.txt` using the data files downloaded from "Human Activity Recognition Using Smartphones" project."

### File: `tidy_data_set.txt`
This file was created by following the 5 broad steps below:
1. Merges the training and the test sets to create one data set.
    i. To achieve this, we would first need to merge the following two files into 
       one data frame:
        * `./train/X_train.txt` - contains data of training sets
        * `./test/X_test.txt` - contains data of test sets
    ii. Next, we need to merge the following two files into a second data frame:
        * `./train/subject_train.txt` - contains the human subject for whom the data in
          `./train/X_train.txt` relates to
        * `./test/subject_test.txt` - contains the human subject for whom the data in
          `./test/X_test.txt` relates to
    iii. Then, we need to merge the following two files into a third data frame:
        * `./train/Y_train.txt` - contains the activity number performed by the human
          subject for which the data in `./train/X_train.txt` relates to
        * `./test/Y_test.txt` - contains the activity number performed by the human
          subject for which the data in `./test/X_test.txt` relates to
    iv. Finally, we will merge all three data frames to create one data set
    
2. Extracts only the measurements on the mean and standard deviation for each 
measurement.
    i. To achieve this, we will first have to read the following file
        * `features.txt` - contains the descriptive names for all measurements
    ii. As we are only concern with mean (i.e., names with *mean()*) and standard
        deviation (i.e., names with *std()*) measurements, we can proceed to subset a
        numeric vector specifying the column numbers relating to mean and standard
        deviation measurements. Bear in mind that we need to +2 to each element in the
        numeric vector as the first two columns of our data set relate to the subject 
        and activity, not measurements.
    iii. Finally, we can proceed to subset the relevant columns from our overall data set
          
3. Uses descriptive activity names to name the activities in the data set.
    i. To achieve this, we will first have to read the following file
        * `activity_labels.txt` - contains the descriptive names corresponding to the
          activities numbers found in `./train/Y_train.txt` and `./test/Y_test.text`
    ii. Next, we can change all the activity numbers in our data set to the
        descriptive names
    iii. Finally, edit the descriptive names to be of lower-case and separated by '.'

4. Appropriately labels the data set with descriptive variable names.
    i. Identify the relevant labels for our data set by subsetting from the features
       data frame
    ii. Fix the names of the labels to naming conventions by substituting '-' with '.',
        removing '()', and transforming to lower case
    iii. Before we can label our data set with descriptive variable names, we can first
         create a character vector containing all the variable names
    iv. Finally, we can proceed to rename our column names by using `colnames()`
    v. After this stage, our first tidy data set will be created using `write.table()`

5. From the data set in step 4, creates a second, independent tidy data set with 
the average of each variable for each activity and each subject.
    i. We will achieve this by using the `dplyr` package
    ii. First, we will group our data set by *subject* and *activity* by using 
        `group_by()`
    iii. Then, we will create a data set with the mean for each variable for
         each activity and each subject by using `summarise_each()`
    iv. Lastly, the required tidy data set for this project will be created using
        `write.table()`