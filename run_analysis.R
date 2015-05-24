## load required packages
library("plyr")
library("dplyr")

## read in Test and Training data
testX <- read.table("UCI HAR Dataset/test/X_test.txt")
testY <- read.table("UCI HAR Dataset/test/y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
trainX <- read.table("UCI HAR Dataset/train/X_train.txt")
trainY <- read.table("UCI HAR Dataset/train/y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")  

## read in activity labels and feature names
features <- read.table("UCI HAR Dataset/features.txt")
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("ActivityId", "Activity"))
                           
## Question 1) merge the Test and Training Data into single Dataset
Test_Data <- cbind(cbind(testX,testSubjects), testY)
Train_Data <- cbind(cbind(trainX, trainSubjects), trainY)
All_Data <- rbind(Test_Data, Train_Data)

## Add column Labels
V1 <- as.integer(c(562,563))
V2 <- c("Subject", "ActivityId")                 
df_temp = data.frame(V1, V2)
labels <- rbind(features, df_temp)
colnames(All_Data) <- labels$V2

## Question 2) Extracts only the measurements on the mean and standard deviation for each measurement
## Includes Subject and ActivityId for reference
All_Data_mean_std <- All_Data[,grepl("mean|std|Subject|ActivityId", names(All_Data))]

## Question 3) Use descriptive activity names to name the activities in the data set
All_Data_mean_std <- join(All_Data_mean_std, activityLabels, by = "ActivityId", match="first")

## Question 4) Appropriately label the data set with descriptive variable names.
names(All_Data_mean_std) <- gsub('Acc','Acceleration',names(All_Data_mean_std))
names(All_Data_mean_std) <- gsub('Gyro','Gyroscope',names(All_Data_mean_std))
names(All_Data_mean_std) <- gsub('Jerk','AngularAcceleration',names(All_Data_mean_std))
names(All_Data_mean_std) <- gsub('BodyBody','Body',names(All_Data_mean_std))
names(All_Data_mean_std) <- gsub('^t','Time',names(All_Data_mean_std))
names(All_Data_mean_std) <- gsub('^f','Frequency',names(All_Data_mean_std))
names(All_Data_mean_std) <- gsub('tBody','TimeBody',names(All_Data_mean_std))
names(All_Data_mean_std) <- gsub('-mean()','Mean',names(All_Data_mean_std))
names(All_Data_mean_std) <- gsub('-std()','STD',names(All_Data_mean_std))
names(All_Data_mean_std) <- gsub('-freq()','Frequency',names(All_Data_mean_std))
names(All_Data_mean_std) <- gsub('angle','Angle',names(All_Data_mean_std))
names(All_Data_mean_std) <- gsub('gravity','Gravity',names(All_Data_mean_std))
names(All_Data_mean_std) <- gsub('Mag','Magnitude',names(All_Data_mean_std))

## Question 5) From the data set in step 4, creates a second, independent tidy data set with the 
## average of each variable for each activity and each subject
tidyData <- aggregate(. ~Subject + Activity, All_Data_mean_std, mean)
tidyData <- tidyData[order(tidyData$Subject, tidyData$Activity),]
write.table(tidyData, file = "Tidy.txt", row.names=FALSE)
