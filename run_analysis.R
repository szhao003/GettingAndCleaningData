##########################################################################################################
## John Hopkin Data Science MOOC: Getting and Cleaning Data Course Project
## Sue Zhao
## 08/21/2015

#The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
#The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on 
#a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as 
#described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a 
#code book that describes the variables, the data, and any transformations or work that you performed to 
#clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. 
#This repo explains how all of the scripts work and how they are connected.  

#One of the most exciting areas in all of data science right now is wearable computing - see for example 
#this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms 
#to attract new users. The data linked to from the course website represent data collected from the accelerometers
#from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
#http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
#Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#You should create one R script called run_analysis.R that does the following. 
#1.Merges the training and the test sets to create one data set.
#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names. 
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable
#for each activity and each subject.

##########################################################################################################
library(plyr)

# Read and load test and training data sets, data labels, and features into R
test <- read.table("F:/Data Science/Data Science/CourseraClasses/Data Scientist Specialization MOOC/GettingandCleanningData/Project 1/Data/UCI HAR Dataset/test/X_test.txt")
testLabel <- read.table("F:/Data Science/Data Science/CourseraClasses/Data Scientist Specialization MOOC/GettingandCleanningData/Project 1/Data/UCI HAR Dataset/test/Y_test.txt")
testSubject <- read.table("F:/Data Science/Data Science/CourseraClasses/Data Scientist Specialization MOOC/GettingandCleanningData/Project 1/Data/UCI HAR Dataset/test/subject_test.txt")

training <- read.table("F:/Data Science/Data Science/CourseraClasses/Data Scientist Specialization MOOC/GettingandCleanningData/Project 1/Data/UCI HAR Dataset/train/X_train.txt")
trainingLabel <- read.table("F:/Data Science/Data Science/CourseraClasses/Data Scientist Specialization MOOC/GettingandCleanningData/Project 1/Data/UCI HAR Dataset/train/Y_train.txt")
trainingSubject <- read.table("F:/Data Science/Data Science/CourseraClasses/Data Scientist Specialization MOOC/GettingandCleanningData/Project 1/Data/UCI HAR Dataset/train/subject_train.txt")

activityLabel <- read.table("F:/Data Science/Data Science/CourseraClasses/Data Scientist Specialization MOOC/GettingandCleanningData/Project 1/Data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("F:/Data Science/Data Science/CourseraClasses/Data Scientist Specialization MOOC/GettingandCleanningData/Project 1/Data/UCI HAR Dataset/features.txt")

head(test)
head(testLabel)
head(testSubject)
head(activityLabel)
head(features)

#Eliminate extra () from the features file.
features <- gsub("\\()", "", features$V2)

#Extract activityLabel and transform all labels to lower cases
activityLabel <- tolower(activityLabel$V2)

#Label the columns using feature information
names(test) <- features
names(training) <- features
names(testLabel) <- "activityType"
names(trainingLabel) <- "activityType"
names(testSubject) <- "participantID"
names(trainingSubject) <- "participantID"

#Combine training data set
training_full <- cbind(trainingSubject,trainingLabel, training)
dim(training_full)
head(training_full)

#Combine testing data set
test_full <- cbind(testSubject, testLabel, test)
dim(test_full)
head(test_full)

#Add testing data to the bottom of training data
Combined <- rbind (training_full, test_full)

#Extract columns consisting of mean and standard deviation
MeanSD <- grep ("participantID|activityType|mean|std", names(Combined))
Combined_MeanSD <- Combined[, MeanSD]
names(Combined_MeanSD)

#Replace the activity number value with the corresponding labels
Combined_MeanSD$activityType <- mapvalues (Combined_MeanSD$activityType,
                                           from = levels(factor(Combined_MeanSD$activityType)),
                                           to = activityLabel)
View(Combined_MeanSD$activityType)

#Creating a second, independent tidy data.
tidyData <- aggregate(Combined_MeanSD, list(Combined_MeanSD$participantID,
                                            Combined_MeanSD$activityType), mean)
head(tidyData)

#Clean and manage the tidydata.
tidyData$participantID <- NULL
tidyData$activityType <- NULL
names(tidyData)[1] <- "participantID"
names(tidyData)[2] <- "activityType"

head(tidyData)[1:6]

#Write the tidyData to local computer
write.table(file = "F:/Data Science/Data Science/CourseraClasses/Data Scientist Specialization MOOC/GettingandCleanningData/Project 1/activityLog.txt", x = tidyData)

