##Getting and Cleaning Data Project

##Overview

The goal of this project is to demonstrate how to collect, clean, manage, and analyze a messy data. The resulting data set can be used for further analysis if needed. A full description of the data used in this project can be found at The UCI Machine Leanring Repository.

The source data for this project can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

This repo included four files: README.md, CodeBook.md, run_Analysis.R, and tidydata.txt. Each file will be described in successions. 

##README.md

README.md describes how the run_analysis works and the code book.

##CodeBook.md

CodeBook.md describes the variables, the data set, and any transformations that I performed on the raw data.

##Run_Analysis.R

Run_Analysis.R is the R script that process the raw data based on the following requirements:
1. Loads the data from the data source above.
2. Merges the training and test data sets to create a combined data set.
3. Extracts only the measurments on the mean and standard deviation for each measurement from the combined data set.
4. Uses Descriptive activity names to name the activities in the combined data set.
5. Appropriately labels the data set with descriptive activity names.
6. Creates a second, independent tidy data set with the average of each vriable for each activity and each subject, using the combined data set.

##activityLog.txt

activityLog.txt is the resulting tidy data that can be used for sequently data analysis (i.e. linear regressions)