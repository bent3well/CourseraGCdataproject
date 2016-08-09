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
colnames(testdata) <- c('subject', 'ActivityID', features)
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
colnames(traindata) <- c('subject', 'ActivityID', features)


## Combining files
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

#### To join the testtrain data and the activity labels
library(plyr)
testtraindataset <- join(testtrain, activity_labels, by = 'ActivityID')
str(testtraindataset)

ttdata <- testtraindataset[,c(1,564,3:563)]
ttdata
str(ttdata)

#### calculate the means of all comlumns in ttdata
colMeans(ttdata[3:563])
ttmeans <- colMeans(ttdata[3:563])

#### calculate the standard deviation of all comlumns in ttdata
apply(ttdata[3:563], 2, sd)
ttsd <- apply(ttdata[3:563], 2, sd)

#### Summarize data by subject and activity and calculate the mean
detach(package:plyr) #### to prevent interactions between plyr and dplyr
library(dplyr)

ttdatatbl <- tbl_df(ttdata)
ttdatatbl
ttdatagrouped <- group_by(ttdata, subject, Activity)
ttdatagrouped
summarize_each(ttdatagrouped, funs(mean))
ttgroupmeans <- data.frame(summarize_each(ttdatagrouped, funs(mean)))
ttgroupmeans

## Write ttgroupmeans to a CSV file
write.csv(ttgroupmeans, './ttgroupmeans.csv', row.names = FALSE)
