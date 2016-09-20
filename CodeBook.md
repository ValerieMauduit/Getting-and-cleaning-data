# List of variables and descriptions

## tidydata.csv

Contains 10299 observations of 50 variables
Observations come from test/ (2947 observations) and train/ (7352 observations) directories. They were binded by rows.

List of variables are:

* Subject: a number between 1 and 30, which identifies the owner of the 
connected strap. Comes from subject_test.txt and subject_train.txt
* Activity: name of the recorded activity. 6 modalities: WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. Comes from 
y_train.txt and y_test.txt. Names were matched using activity_labels.txt
* 48 features which are all the mean and std features in original data 
X_test.txt and X_train.txt. Names of feautres were provided by features.txt. We 
keep only features which names contain "std" or "mean" but not "meanF" (in this 
last case, it's a mean frequency, not the mean of a measure.) We tidied names of features, removing all parenthesis, dashes and comas. All features are numbers, normalized between -1 and 1. More info, from features_info.txt (extract copy):

###Feature Selection 

The features selected for this database come from the accelerometer and 
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals 
(prefix 't' to denote time) were captured at a constant rate of 50 Hz. T
hen they were filtered using a median filter and a 3rd order low pass B
utterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity 
acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass 
Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in 
time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the 
magnitude of these three-dimensional signals were calculated using the Euclidean 
norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, 
tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain 
signals). 

These signals were used to estimate variables of the feature vector for each 
pattern:  

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are (keeped here): 
* mean: Mean value
* std: Standard deviation

List of patterns:

* tBodyAcc-mean/std-X/Y/Z
* tGravityAcc-mean/std-X/Y/Z
* tBodyAccJerk-mean/std-X/Y/Z
* tBodyGyro-mean/std-X/Y/Z
* tBodyGyroJerk-mean/std-X/Y/Z
* tBodyAcc-mean/std-X/Y/Z
* fBodyAccJerk-mean/std-X/Y/Z
* fBodyGyro-mean/std-X/Y/Z

## summarisedData.csv

Contains the mean of each feature of tidydata.csv, for each subject and each 
activity.

So there are 180 observations (30 subjects x 6 activities) and 50 variables. Each observation is a subject plus an activity. Except Subject and Activity, all the variables contain the mean of the values observed in tidydata.csv.

The run_analysis.R script provides also (but not saved) a 3D table, more readable in R but not in a csv format. Its name is DatasetSummarisedSquared. 

* 30 lines represent the 30 subjects
* 6 columns represent the 6 activities
* each square matrix represent one of the 48 variables, from tBodyAccmeanX to 
fBodyGyrostdZ


