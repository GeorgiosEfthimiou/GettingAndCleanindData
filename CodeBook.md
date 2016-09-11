# Getting and Cleaning Data Assignment CodeBook
This file contains information about the original data set, the cleaning method and the tidy data set.
* The data set was obtained from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
A full description of the data set is available there.
* The data set can be downloaded using the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
* The cleaning method (see README.md for full instructions) contains the following steps:
  1. Read data from the "./data/train" folder. In more detail, read X_train.txt, y_train.txt and subject_train.txt and store them in trainSet, trainLabel and trainSubject variables respectively.
  2. Read data from the "./data/test" folder. In more detail, read X_test.txt, y_test.txt and subject_test.txt and store them in testSet, testLabel and testSubject variables respectively.
  3. Bind (by rows) trainSet and testSet to create dataSet, trainLabel and testLabel to create dataLabel and finally trainSubject and testSubject to create dataSubject.
  4. Read "./data/features.txt" and store it in the allFeatures variable.
  5. Isolate the measurements on the mean and the standard deviation and store them in the features variable. Subset dataSet by using features to get the corresponding data.
  6. Clean the column names of the previous subset. In more detail, remove "()" and "-" and replace "mean" with "Mean" and "std" with "Std".
  7. Read "./data/activity_labels.txt" and store it in the activity variable.
  8. Clean the activity names by making them to lower cases.
  9. Transform dataLabel according to the activity variable and add a title to the second column of activity data set.
  10. Add a title to the dataSubject data set.
  11. Replace the dataSet variable names with more descriptive ones. In more detail, replace "t" with "time", "f" with "frequency", "Acc" with "Accelometer", "Gyro" with "Gyroscope" and "Mag" with "Magnitude".
  12. Bind (by columns) all three dataSubject, dataLabel and dataSet to create tidyData.
  13. Isolate all 30 unique subjects and 6 unique activities and use them to create a new tidy data set containing the average of each variable for each activity and each subject. To 
  14. Save the tidyDataMean to "tidy_data.txt"
