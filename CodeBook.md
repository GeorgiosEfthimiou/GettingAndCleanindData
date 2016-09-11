# Getting and Cleaning Data Assignment
This file contains information about the original data set, the cleaning method and the tidy data set.
* The data set was obtained from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
A full description of the data set is available there.
* The data set can be downloaded using the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
* The cleaning method (see README.md for full instructions) contains the following steps:
  1. Read data from the "./data/train" folder. In more detail, read X_train.txt, y_train.txt and subject_train.txt and store them in trainSet, trainLabel and trainSubject variables respectively.
  2. Read data from the "./data/test" folder. In more detail, read X_test.txt, y_test.txt and subject_test.txt and store them in testSet, testLabel and testSubject variables respectively.
  3. Bind trainSet and testSet to create dataSet, bind trainLabel and testLabel to create dataLabel and finally bind trainSubject and testSubject to create dataSubject.
  4. Read "./data/features.txt" and store it in the allFeatures variable.
  5. Isolate the measurements on the mean and the standard deviation and store them in the features variable
