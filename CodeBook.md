Codebook
Codebook for Getting and Cleaning Data Assignment on Cousera

See the Readme.md file for a description of the requirements for this project and for the location of the original raw data used.

The data was collected from a Samsung Galaxy smartphone using its accelerometer and gyroscope. Thirty (30) volunteers (subjects) were measured completing six activities while the smartphone wearing the smartphone on their waist.

The raw data was not in a tidy format, so some combinations and transformations were completed. These are discussed here.

The raw data included two sets of data: a test group and a training group. These two datasets were combined using the cbind function. Both datasets include the subject, the activityID, and all 561 measurements recorded by the smartphone. There were 563 columns in total.

The raw dataset did not include variable names, so the names "subject", "ActivityID", and the list in the "features.txt" file were used to label the 561 measurements. These names were assigned using the colnames function. 

The activityID indicates what activity is being tracked. The activityIDs include the numbers 1 through 6 and the activity names, which were provided in a separate file, are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING. This variable was added to the dataset and named "Activity". The Activity variable was created using the join function within the plyr package. The ActivityID variable was then removed.

The mean of each measurement was calculated using the colMeans function. A similar function does not exist to calculate the standard deviation of columns, so the apply function was used to apply the sd function to all columns that include measurements.

The final step was to calculate the mean for each measurement for each subject by each exercise. The dplyr package was installed to calculated this step. In order to prevent any adverse interactions between the plyr and dplyr packages, the plyr package was removed. The compiled data was grouped by subject and Activity. Then, the summarize_each function was used to calculate the mean of each grouping. 



    