#Download and unzip the raw data
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="dataset.zip")
unzip("dataset.zip")


#----------------------------------------------------------
#Each data set is read first, and later they are merged 
#The test set is added at the end of the training set for 
#each feature using rbind
#The features measuring mean values and stardard deviations
#are subsetted
#The name of the subsetted features is also stored for 
#subsequent use

#Read data and store it in data tables
testdata <- read.table("UCI HAR Dataset/test/X_test.txt")
traindata <- read.table("UCI HAR Dataset/train/X_train.txt")

#Merge the training and test data sets
fulldata <- rbind(traindata, testdata)

#Read the features
features <- read.table("UCI HAR Dataset/features.txt")

#Select the features giving mean values and standard deviations
columnselect <- grepl("-(mean|std)\\(",features$V2)
featuresselect <- features[columnselect,2]

#Subset the data table
selected <- fulldata[,columnselect]


#----------------------------------------------------------
#The activity type for each data set is read first, and later 
#they are merged 
#The activity label for thetest set is added at the end of 
#that of the training set 
#The name of the activities is also read and the activity label
#is replaced by the corresponding activity name

#Read activity types and store them in data tables
testactivity <- read.table("UCI HAR Dataset/test/y_test.txt")
trainactivity <- read.table("UCI HAR Dataset/train/y_train.txt")

#Merge the activity types
fullactivity <- rbind(trainactivity,testactivity)

#Read the name of each activity and store it in a data table
#The labels are formatted according to the tidy data set 
#indications
activitylabel <- read.table("UCI HAR Dataset/activity_labels.txt")
activitylabel <- tolower(activitylabel[,2])
activitylabel <- gsub("_","", activitylabel)

#The default column name of the data set is replace by the 
#corresponding descriptive feature name
#Remove capital letters
#featuresselect <- tolower(featuresselect)
#Remove dashes and parenthesis marks
featuresselect <- gsub("-|\\(|\\)","",featuresselect)
#Remove single t and b letters at the beginning of the name
featuresselect <- gsub("^t|^f","",featuresselect)
#
featuresselect <- gsub("Acc","Acceleration",featuresselect)
featuresselect <- gsub("acc","acceleration",featuresselect)
featuresselect <- gsub("Gyro","Gyroscope",featuresselect)
featuresselect <- gsub("gyro","gyroscope",featuresselect)
featuresselect <- gsub("Mag","Magnetic",featuresselect)
featuresselect <- gsub("(Body){2,}","Body",featuresselect)
featuresselect <- gsub("mean","Mean",featuresselect)
featuresselect <- gsub("std","Std",featuresselect)
#Use the tidy feature names as column names
colnames(selected) <- featuresselect

#A column with the activity name is added to the data frame
selected$activityname <- activitylabel[fullactivity[,1]]


#----------------------------------------------------------
#Average of each magnitude grouped by activity type
selectedmeans <- aggregate(. ~ activityname, selected, mean)

#Add descriptive rownames
rownames(selectedmeans) <- selectedmeans$activityname
selectedmeans <- selectedmeans[,-which(names(selectedmeans) 
		%in% c("activityname"))]

