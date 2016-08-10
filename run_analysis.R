# You should create one R script called run_analysis.R that does the following.
# Throughout the script, notes will indicate which number from numbers 1-5 below 
#       is being completed ****************************************************

#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each 
#       measurement.
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data set 
#       with the average of each variable for each activity and each subject.


## Reading informational files
features_info <- readLines("./UCI HAR Dataset/features_info.txt")
readMe <- readLines("./UCI HAR Dataset/README.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

features_info
readMe
features <- as.character(features[,2])
features

## Reading and summarizing data files
#### File locations
testlableloc <- "./UCI HAR Dataset/test/y_test.txt"
testdataloc <- "./UCI HAR Dataset/test/X_test.txt"
testsubjloc <- "./UCI HAR Dataset/test/subject_test.txt"

trainlableloc <- "./UCI HAR Dataset/train/y_train.txt"
traindataloc <- "./UCI HAR Dataset/train/X_train.txt"
trainsubjloc <- "./UCI HAR Dataset/train/subject_train.txt"

activitylabelloc <- "./UCI HAR Dataset/activity_labels.txt"

#### test group files
test_subj <- read.table(testsubjloc)
test_labels <- read.table(testlableloc)
test_data <- read.table(testdataloc)
str(test_subj)
str(test_labels)
str(test_data)
test_subj
test_labels
test_data
testdata <- cbind(test_subj, test_labels, test_data)
colnames(testdata) <- c('subject', 'ActivityID', features) # 4. ***************
testdata


#### training group files
train_subj <- read.table(trainsubjloc)
train_labels <- read.table(trainlableloc)
train_data <- read.table(traindataloc)
str(train_subj)
str(train_labels)
str(train_data)
train_subj
train_labels
train_data
traindata <- cbind(train_subj, train_labels, train_data) 
colnames(traindata) <- c('subject', 'ActivityID', features) # 4. **************


## 1. Merges the training and the test sets to create one data set. ***********
#### combine test and train data
testtrain <- rbind(testdata, traindata)
testtrain
str(testtrain)

#### Activity Label files
activity_labels <- read.table(activitylabelloc)
activity_labels

###### Name the columns of the activity_labels data.frame
actidname <- c('ActivityID', 'Activity')
names(activity_labels) <- actidname
activity_labels

# 3. Uses descriptive activity names to name the activities in the data set ***
#### To join the testtrain data and the activity labels
library(plyr)
testtraindataset <- join(testtrain, activity_labels, by = 'ActivityID')
str(testtraindataset)

ttdata <- testtraindataset[,c(1,564,3:563)]
ttdata
str(ttdata)

# 2. Extracts only the measurements on the mean and standard deviation for each 
#       measurement.***********************************************************
toextract <- grep("mean|std|subject|Activity",names(ttdata))
ttdata.meanstd <- ttdata[,toextract]

# 5. From the data set in step 4, creates a second, independent tidy data set **
#       with the average of each variable for each activity and each subject.***
#### Summarize data by subject and activity and calculate the mean
detach(package:plyr) #### to prevent interactions between plyr and dplyr
library(dplyr)

ttdatatbl <- tbl_df(ttdata.meanstd)
ttdatatbl
ttdatagrouped <- group_by(ttdata.meanstd, subject, Activity)
ttdatagrouped
summarize_each(ttdatagrouped, funs(mean))
ttgroupmeans <- data.frame(summarize_each(ttdatagrouped, funs(mean)))
ttgroupmeans
str(ttgroupmeans)

## Write ttgroupmeans to a CSV file
write.table(ttgroupmeans, './ttgroupmeans.txt', row.names = FALSE)



#### https://github.com/bent3well/CourseraGCdataproject/blob/master/CodeBook.md
#### https://github.com/bent3well/CourseraGCdataproject/blob/master/README.md
#### https://github.com/bent3well/CourseraGCdataproject/blob/master/run_analysis.R
#### https://github.com/bent3well/CourseraGCdataproject/blob/master/ttgroupmeans.txt

