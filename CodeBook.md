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

Recipe
------

The script (run_analysis.R) uses the following recipe and variables to process the data 

### Step 0 - Required R Package

- Install and/or load package <em>"plyr"</em> used for split-apply-combine functions

### Step 1 - Load Training Set

- <em>"train.x"</em> reads observations with 561 measurements for each training experiment
- <em>"train.y"</em> reads the corresponding activity label for each training observation
- <em>"train.subject"</em> loads a vector with an identifier of the subject who carried out the experiment
- Variable <em>"train"</em> combines (by column) <em>train.x</em>, <em>train.y</em>, and <em>train.subject</em> to form the training set

### Step 2 - Load Test Set

- <em>"test.x"</em> reads observations with 561 measurements for each test experiment
- <em>"test.y"</em> reads the corresponding activity label for each test observation
- <em>"test.subject"</em> loads a vector with an identifier of the subject who carried out the experiment 
- Variable <em>"test"</em> combines (by column) <em>test.x</em>, <em>test.y</em>, and <em>test.subject</em> to form the test set


### Step 3 - Merge Training and Test Sets

- Variable <em>"train.test"</em> row combines the training and test sets


### Step 4 - Load Activity Names and List of Features

- <em>"activity.labels"</em> reads mappings of activity labels to activity names
- <em>"features"</em> reads list of all features measured in experiments
- Use <em>activity.labels</em> to append descriptive Activity Names to each record
- Use <em>features</em> to name columns with features (measurements) of experiment

### Step 5 - Extract Measurements of Mean and Standard Deviation

- Using function <em>grep</em> find features with measurements of mean and standard deviation
- Create a vector <em>"col.names"</em> with identified features in addition to subject and activity name columns
- Reduce <em>train.test</em> dataset with <em>col.names</em> fields to variable <em>train.test.rd</em>

### Step 6 - Create Tidy Dataset with Average of Selected Features for Each Activity and Subject

- Using function <em>ddply</em> split the processed dataset by "Activity.Name" and "Subject" to compute the mean of each feature column representing measurements of mean and standard deviation
- Store the combined result of <em>ddply</em> into variable <em>tidy.set</em>
- Write results to working directory to file <em>"tidy.txt" for project submission

#### Note: throughout the script, objects/variables no longer needed are removed from memory

Objects
-------

### Project outcome (objects)
- <em>train.test</em>
- <em>train.test.rd</em>
- <em>tidy.set</em>


