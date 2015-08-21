#CodeBook

This code book describes the variables, data, and data transformations in activitylog.txt.

##Raw Data Source

The raw data was from "Human Activity Recognition Using Smartphones Dataset" (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 
The data was obtained from a group of volunteers within an age of 19-48 years. Each person
performed six different activities (i.e., walking, walking_upstairs, walking_downstairs, sitting,
standing, and laying) while wearing a Samsung Galaxy SII on the waist. Using the smartphone's 
embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at
a constant rate of 50HZ was captured. The data then was randomly splited into training (70%) and
testing (30%) data set. 

1. subject_test.txt: participant number (1-30) for the testing data set
2. y_test.txt: activity number (1-6) for the testing data set
3. x_test.txt: measurement information (1-531) for the testing data set 
4. subject_training.txt: participant number (1-30) for the training data set
5. y_trainingt.txt: activity number (1-6) for the training data set
6. x_traning.txt: measurement information (1-531) for the training data set 
7. features.txt: descriptive names of the activities
8. activity_labels.txt: describes the activities performed


##Data transformation

After loading the raw data into R, column names were changed to a more descriptive names (i.e.,
ParticipantID, ActivityType, etc). Columns associated with measurements were also renames using
information from the features.txt. Extra brackets were removed from column names.

Next, the training and test data sets were combined into one data set called combined. A summary
was created by selecting the colunm names including "std" and "mean". 

The value of activities were transformed from numbers to string with 1 = walking, 2 = walking_upstairs,
3 = walking_downstairs, 4 = sitting, 5 = standing, and 6 = laying.

Lastly, a second, independent data set was created from the combined data set by computing the mean of
each variable for each activity per participants. These new mean variables replaced the old mean variables.

The resulting tidy data was written to a text file called "activitylog.txt"


#Data Fields

##Identifiers

*'participantID' - The ID of the test participants (1-30)
*'activityType' -  The type of activity performed by the test subjects during the measurment periods

##Types of Measurements

*The column names associated with measurment consisted of multiple measurment parameters as indicated 
in its names. for example, "tBodyAcc-mean-X" means that the mean of acceleration along the x-axis as 
cacluated using time. The lists below are the measurment parameters and its descriptions you will find
in the column names.

1. x,y,z - the direction of individual movement (i.e., x-axis, y-axis, z-axis)
2. t prefix - measurements based on time information
3. f prefix - measurment based on frequency information
4. Body - individual movement
5: Gravity - individual movement due to gravity
6: Acc - acceleration
7: Jerk - jerk signal
8: Gyro - angular velocity
9: Mag - magnitude
10: std - standard deviation
11: mean - average

