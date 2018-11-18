Run_analaysis

## Processing performed

1. Load required libraries "dplyr"
2. Get the feature names from the features.txt file and convert to a vector featureNames
3. Get only the std and mean attributes from featureNames into stdMeanNames
4. Get the activity names by ID from file activity_labels.txt into actNames
5. For the Train data
* Read in X data into trainX use read.table with sep as "" as multiple spaces in file Set the column names from the featureNames
* Select only the std amd mean attributes by subsetting using stdMeanNames
* Read in train_y into activities
* Read in subjects from subject_train.txt
* Combine data frames subjects, activities, trainX into train
6. For the Train data
* Read in X data into testX use read.table with sep as "" as multiple spaces in file Set the column names from the featureNames
* Select only the std amd mean attributes by subsetting using stdMeanNames
* Read in test_y into activities
* Join activities with acNames to replace IDs with activity names
* Read in subjects from subject_train.txt
* Combine data frames subjects, activities, testX into test
7. Combine train and test into single data.frame alldata
alldata <- rbind(train, test)
8. Create average data set avgdata. 
* Create data frame with same columns as alldata and row for each activity with same column names
*  get subset of allData by activity and subject average and set row in avdata
* Write out avg.data using write.table

## Avgdata is tidy data set with one row per subject and activity
## Columns are

* "activity" - Activity name of type character
* "subject" - ID of the subject 1 to 30 of type integer
remaining columns are from original data but are averager of mesurement by subject and activity and all of type numeric
* "tBodyAcc-mean()-X"
* "tBodyAcc-mean()-Y"
* "tBodyAcc-mean()-Z"
* "tBodyAcc-std()-X"
* "tBodyAcc-std()-Y"
* "tBodyAcc-std()-Z"
* "tGravityAcc-mean()-X"
* "tGravityAcc-mean()-Y"
* "tGravityAcc-mean()-Z"
* "tGravityAcc-std()-X"
* "tGravityAcc-std()-Y"
* "tGravityAcc-std()-Z"
* "tBodyAccJerk-mean()-X"
* "tBodyAccJerk-mean()-Y"
* "tBodyAccJerk-mean()-Z"
* "tBodyAccJerk-std()-X"
* "tBodyAccJerk-std()-Y"
* "tBodyAccJerk-std()-Z"
* "tBodyGyro-mean()-X"
* "tBodyGyro-mean()-Y"
* "tBodyGyro-mean()-Z"
* "tBodyGyro-std()-X"
* "tBodyGyro-std()-Y"
* "tBodyGyro-std()-Z"
* "tBodyGyroJerk-mean()-X"
* "tBodyGyroJerk-mean()-Y" 
* "tBodyGyroJerk-mean()-Z"
* "tBodyGyroJerk-std()-X"
* "tBodyGyroJerk-std()-Y"
* "tBodyGyroJerk-std()-Z"
* "tBodyAccMag-mean()"
* "tBodyAccMag-std()"
* "tGravityAccMag-mean()"
* "tGravityAccMag-std()"
* "tBodyAccJerkMag-mean()"
* "tBodyAccJerkMag-std()"
* "tBodyGyroMag-mean()"
* "tBodyGyroMag-std()"
* "tBodyGyroJerkMag-mean()"
* "tBodyGyroJerkMag-std()"
* "fBodyAcc-mean()-X"
* "fBodyAcc-mean()-Y"
* "fBodyAcc-mean()-Z"
* "fBodyAcc-std()-X"
* "fBodyAcc-std()-Y" 
* "fBodyAcc-std()-Z" 
* "fBodyAcc-meanFreq()-X" 
* "fBodyAcc-meanFreq()-Y" 
* "fBodyAcc-meanFreq()-Z" 
* "fBodyAccJerk-mean()-X" 
* "fBodyAccJerk-mean()-Y" 
* "fBodyAccJerk-mean()-Z" 
* "fBodyAccJerk-std()-X" 
* "fBodyAccJerk-std()-Y" 
* "fBodyAccJerk-std()-Z" 
* "fBodyAccJerk-meanFreq()-X" 
* "fBodyAccJerk-meanFreq()-Y" 
* "fBodyAccJerk-meanFreq()-Z" 
* "fBodyGyro-mean()-X" 
* "fBodyGyro-mean()-Y" 
* "fBodyGyro-mean()-Z" 
* "fBodyGyro-std()-X" 
* "fBodyGyro-std()-Y" 
* "fBodyGyro-std()-Z" 
* "fBodyGyro-meanFreq()-X" 
* "fBodyGyro-meanFreq()-Y" 
* "fBodyGyro-meanFreq()-Z" 
* "fBodyAccMag-mean()" 
* "fBodyAccMag-std()" 
* "fBodyAccMag-meanFreq()" 
* "fBodyBodyAccJerkMag-mean()" 
* "fBodyBodyAccJerkMag-std()" 
* "fBodyBodyAccJerkMag-meanFreq()" 
* "fBodyBodyGyroMag-mean()" 
* "fBodyBodyGyroMag-std()" 
* "fBodyBodyGyroMag-meanFreq()" 
* "fBodyBodyGyroJerkMag-mean()" 
* "fBodyBodyGyroJerkMag-std()" 
* "fBodyBodyGyroJerkMag-meanFreq()"