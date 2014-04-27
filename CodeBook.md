Code Book
=========

Data
----
Data for the project can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data will be extracted to a folder called "UCI HAR Dataset"

Script
------

Save the project's R script (run_analysis.R) to the "UCI HAR Dataset" directory

Make "UCI HAR Dataset" the working directory in R

The following files will be read during the analysis (see Recipe below):

- UCI HAR Dataset/activity_labels.txt
- UCI HAR Dataset/features.txt
- UCI HAR Dataset/train/X_train.txt
- UCI HAR Dataset/train/y_train.txt
- UCI HAR Dataset/train/subject_train.txt
- UCI HAR Dataset/test/X_test.txt
- UCI HAR Dataset/test/y_test.txt
- UCI HAR Dataset/test/subject_test.txt

Recipe and Variables
--------------------

The script (run_analysis.R) uses the following recipe and variables to process the data 

### Step 0 - Required Package

- Install and/or load package <em>plyr</em> used for split-apply-combine functions

### Step 1 - Load Training Set

- <em>"train.x"</em> reads observations with 561 measurements for each training experiment
- <em>"train.y"</em> reads the corresponding activity label for each training observation
- <em>"train.subject"</em> loads a vector with an identifier of the subject who carried out the experiment
- Variable <em>"train"</em> combines (by column) train.x, train.y, and train.subject to form the training set

### Step 2 - Load Test Set

- <em>"test.x"</em> reads observations with 561 measurements for each test experiment
- <em>"test.y"</em> reads the corresponding activity label for each test observation
- <em>"test.subject"</em> loads a vector with an identifier of the subject who carried out the experiment 
- Variable <em>"test"</em> combines (by column) test.x, test.y, and test.subject to form the test set


### Step 3 - Load 
