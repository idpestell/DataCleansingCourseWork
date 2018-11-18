#
# Script to create Tidy data set of montion data
#
# Load required libraries
library(dplyr)

##################### Commom Setup #################################################################
#
# Get the feature names from the features.txt file and convert to a vector
#
numOfSubjects <- 30

feat <- read.csv("UCI HAR Dataset/features.txt", header = FALSE, sep = " ")
featureNames <- feat[[2]]

# Get only the std amd mean attributes
stdMeanNames <- grep("std|mean", featureNames)

#
# Get the activity names by ID
#
actNames <- read.table("UCI HAR Dataset/activity_labels.txt", sep = "", col.names = c("ID", "name"))


#################### Train #########################################################################

# Read in X data use read.table with sep as "" as multiple spaces in file 
# Set the column names from the featureNames
trainX <- read.table("UCI HAR Dataset/train/X_train.txt", sep="", header = FALSE, col.names = featureNames)
#Select only the std amd mean attributes
trainX <- trainX[, stdMeanNames]

#
# Read in train_y as activities
#
activities <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = c("ID"))
# Join activities with names to replace IDs with activity names
a <- inner_join(activities, actNames, copy = TRUE)
# replace activities with names
activities <- a[[2]]

#
# Read in subjects
subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c("subject"))

# Combine the train datasets
train <- cbind(subjects, activities, trainX)

#################### Test #########################################################################

# Read in X data use read.table with sep as "" as multiple spaces in file 
# Set the column names from the featureNames
testX <- read.table("UCI HAR Dataset/test/X_test.txt", sep="", header = FALSE, col.names = featureNames)
#Select only the std amd mean attributes
testX <- testX[, stdMeanNames]

#
# Read in test_y as activities
#
activities <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = c("ID"))
# Join activities with names to replace IDs with activity names
a <- inner_join(activities, actNames, copy = TRUE)
# replace activities with names
activities <- a[[2]]

#
# Read in subjects
subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c("subject"))

# Combine the test datasets
test <- cbind(subjects, activities, testX)

########## Combine to single data set
alldata <- rbind(train, test)

########### Create average data set
# Create data frame with same columns as alldata and row for each activity with same column names
avgdata <- data.frame(matrix(NA, nrow = (nrow(actNames) * numOfSubjects), ncol = ncol(alldata)))
# Set columns to same names
colnames(avgdata) <- c("activity", "subject", as.vector(featureNames[stdMeanNames] ))

# For each activity
for( i in 1:nrow(actNames)) {
    # get activity name and set first column in result set
    act <- as.character(actNames[i,2])
    
    
    for(j in 1:numOfSubjects ) {
        avgdata[i+(j-1),1] <- act
        avgdata[i+(j-1),2] <- j
        # subset the data for activity value
        s <- subset(alldata, activities == act & subject == j, -c(subject,activities))
    
        # average all the columns
        avg <- colMeans(s)
    
        # save results in the current row of result set
        for( k in 1:length(avg)) {
            avgdata[i+(j-1),k+2] <- as.numeric(avg[k])
        }
    }
    
    ########## Write the data set ################
    write.table(avgdata, "avgdata.txt", row.name = FALSE)
}