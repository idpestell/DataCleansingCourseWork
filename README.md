# Getting and Cleaning Data Course Project

## run_analysis.R contains all code for processing the Samsung Galaxy data into the summarized data set avgData

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
