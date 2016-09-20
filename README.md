==================================================================

# Peer Graded Assignment: Getting and Cleaning Data Course Project
## Val�rie Mauduit

==================================================================

We use the data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Once unzipped in your working directory, input data are:
========================================================

* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'test/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 2 to 24. 

Provided files are:
===================

* run_analysis.R: script in R that perform analyses to merge, tidy and 
summarise input data
* CodeBook.md: describe the variables and dataframes
* TidyData.csv: train and test data, merged and tidied
* summarisedData.csv: summarised data: mean of each variable, for each group of
Subject-Activity
    * columns 1 and 2 provide Subject and Activity, each other column provide 
    the means of each feature, for each group Subject-Activity



