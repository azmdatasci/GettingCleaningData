Getting and Cleaning Data: Peer Reviewed Assignment 
===================================================

Peer Reviewed Assignment
------------------------

The assignment consists in tidying a dataset. The provided data are collected 
from the accelerometers from the Samsung Galaxy S smartphone. A full description 
is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The scripts does the following tasks:

1) The data sets are separated in a training and a test set. They have to be merged
and analyzed together. 

2) The measurements of the mean and the standard deviation (std) has to be selected.

3) The activities have to be given a descriptive name. The activity_labels.txt file 
gives the correspondece.

4) The variable names are given in features.txt. The variables have to be given a 
descriptive name.

5) A tidy data set with the average of each variable for each activity and each 
subject.


---------------------------
Description of the script
---------------------------

A zip file with the data is downloaded from 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="dataset.zip

1) After unzipping the test and training data sets are read. The data is merged 
concatenating the test data at the end of the training data, using rbind.

2) To subset the mean and standard deviation the list of features is read into a 
table. The command grepl is used to create a logical vector that will select the 
magnitudes that represent mean values or standard deviation:
columnselect <- grepl("-(mean|std)\\(",features$V2)
selected <- fulldata[,columnselect]

3) The activity type for each measurement is read and later merged the same way 
that the variables were merged. The names of the feature are read from features.txt 
and they are replaced by the activity type number. Before the substitution the 
capital letters are substituted in the activity names. The list of activity types 
is added to the merged data set.

4) The names of the variables have been formatted following the guidelines for 
descriptive names in tidy data sets.

5) The data has to be grouped according to the activity type and subject number. 
First the data detailing the subject involved in the experiment is imported in the 
same way as done with the activity type. After adding it to the subsetted data set, it 
is possible to use the function aggregate to separate the data according to the 
activity and subject and to calculate the mean for each variable. The result is written 
in a new data frame (selectedmeans), showing the mean values of all values for each case. 

The aggregated data is written to a CSV file "tidydataset.csv".


