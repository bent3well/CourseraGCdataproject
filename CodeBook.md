#CodeBook
##Codebook for Getting and Cleaning Data Assignment on Cousera

The dataset includes the subject, the Activity, and means of all measurement mean/standard deviation recorded by the smartphone. There are 81 columns (variables) in total. The raw dataset did not include variable names, so the names "subject", "ActivityID", and the list in the "features.txt" file were used to label the 561 measurements. Find the features.txt file here: https://github.com/bent3well/CourseraGCdataproject/blob/master/features.txt

##Variables:
### subject (Column 1)
The subject is a number 1 through 30. It identifies the individual/volunteer was was completing the activity.

### Activity (Column 2)
The exercise/activity being tracked include the following names: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING. The ActivityID variable in the original dataset was removed after this variable was added.

### Means of Means and Standard Deviations of Measurements (Columns 3 - 563)
The mean of each measurement's mean or standard deviation for each subject by each exercise. The original 561 measurements can be found in the features.txt file here: https://github.com/bent3well/CourseraGCdataproject/blob/master/features.txt. Those including the letters "mean" and "std" were kept in the tidy data set.



    
