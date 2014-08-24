# Codebook for Getting and Cleaning Data

The Original data is from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and the description of the data can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Dataset information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz was captured. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Each record in the dataset contains
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment

# Data Transformation

## Test and Train Data
Test and train data were loaded separately. The **subject, X, and y files** were loaded for both test and train datasets. 

The headers for the **X values** were extracted from the *features.txt* file and applied to both the datasets and were used to filter out only **means** and **standard deviations**.

This extraction was done using a regular expression on the header names, making sure not to include *meanFreq()*.

Then the test and train data sets were merged into one. Column names of **SubjectID** for the subject and **Activity** for the y values were added for easy readability.

All columns of the data frame were aggregated grouping by SubjectID and Activity which yielded 180 observations (30 subjects * 6 activities) of the 68 variables.

Finally, an activity name was assigned to each of the levels in the Activity column.

Executing the script will output tab separated values to a text file, *tidy.txt*,  in the users current working directory.