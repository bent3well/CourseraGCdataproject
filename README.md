#CourseraGCdataproject ReadMe
###Project for Getting and Cleaning Data Course on Coursera

Four things were required as a part of the submission of this assignment--1) a tidy data set, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 4) You should also include a README.md in the repo with your scripts. 

The data being manipulated in this project are related to wearable computing and were collected using a Samsung Galaxy smartphone. The original files can be found at the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The necessary items associated with this project include:

1. ttgroupmeans.txt - a tidy data set that includes the calculated mean of each measurement/feature for each subject across on each activity
2. run_analysis.R - the R script used to do these conversions
3. CodeBook.md - a description of what is accomplished by the run_analysis.R script
4. README.md - an overview of this submission for the Coursera Getting and Cleaning Data Assignment

The raw data was not in a tidy format, so some combinations and transformations were completed. These are discussed here.

The raw data included two sets of data: a test group and a training group. These two datasets were combined using the cbind function. Both datasets include the subject, the activityID, and all 561 measurements recorded by the smartphone. There were 563 columns in total.

The raw dataset did not include variable names, so the names "subject", "ActivityID", and the list in the "features.txt" file were used to label the 561 measurements. These names were assigned using the colnames function.

The activityID indicates what activity is being tracked. The activityIDs include the numbers 1 through 6 and the activity names, which were provided in a separate file, are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING. This variable was added to the dataset and named "Activity". The Activity variable was created using the join function within the plyr package. The ActivityID variable was then removed.

The mean of each measurement was calculated using the colMeans function. A similar function does not exist to calculate the standard deviation of columns, so the apply function was used to apply the sd function to all columns that include measurements.

The final step was to calculate the mean for each measurement for each subject by each exercise. The dplyr package was installed to calculated this step. In order to prevent any adverse interactions between the plyr and dplyr packages, the plyr package was removed. The compiled data was grouped by subject and Activity. Then, the summarize_each function was used to calculate the mean of each grouping.
