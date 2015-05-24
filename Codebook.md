#Codebook.md

Codebook for the Tidy.Txt Data Set

## Data Source

The Tidt.Txt dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made available here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The object of this assignment was to complete the following tasks

Create one R script called run_analysis.R that does the following. 
1.Merges the training and the test sets to create one data set (From the Source Data Set referenced above)
2.Extract only the measurements on the mean and standard deviation for each measurement. 
3.Use descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Data Sets used
These are from the source location above
* X_test.txt
* y_test.txt
* subject_test.txt
* X_train.txt
* y_train.txt
* subject_train.txt
* features.txt
* activity_labeles.txt

###Variables
* `testX`, `testY`, `testSubjects`, `trainX`, `trainY` and `trainSubjects` contain the data from the downloaded data sets
* `Test_Data`, `Train_Data` merge the data sets in the first step
* `All_Data` merges all the data sets together
* `features` and `activity` lables contain the data in the last 2 files listed above
* `df_temp` is a temporary data frame to add labels for the Subject and Activity variables in the merged data set
* `labels` is the complete list of labels
* `All_Data_mean_std` contains the data subset created for step 2
* `tidyData` contains the final tidy data set created for step 5

###Labels
The following label changes have been made in the Tidy.txt Data Set from the original data labels provided
* 'Acc' replaced by 'Acceleration'
* 'Gyro' replaced by 'Gyroscope'
* 'Jerk' replaced by 'AngularAcceleration'
* 'BodyBody' replaced by 'Body'
* '^t' replaced by 'Time'
* '^f' replaced by 'Frequency'
* 'tBody' replaced by 'TimeBody'
* '-mean()' replaced by 'Mean'
* '-std()' replaced by 'STD'
* '-freq()' replaced by 'Frequency'
* 'angle' replaced by 'Angle'
* 'gravity' replaced by 'Gravity'
* 'Mag' replaced by 'Magnitude'
