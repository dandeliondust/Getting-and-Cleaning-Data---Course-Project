## Getting and Cleaning Data - Course Project
This repository hosts the R script and documentation files for project in the Course - "Getting and Cleaning Data".

This project makes use of data from "Human Activity Recognition Using Smartphones" project. More details of the project can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data used in this project can be downloaded here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## How to Use
Unzip the data that is downloaded from location mentioned previously. Ensure that your working directory is set to the same location as the unzipped file.

Run the "run.analysis.R" script. This will combine the necessary files from the 
downloaded data.

Essentially, what the R script does is to perform analyses described in the 5 steps 
below.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each 
measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with 
the average of each variable for each activity and each subject.

Two text files will be created during Step 4 and Step 5 respectively:
* `tidy_data_set.txt`
* `tidy_data_set_mean.txt`

## Files
* `CodeBook.md` - describes the variables, the data, and any transformations or 
work performed to clean up the data
* `run.analysis.R` - script for performing the analysis