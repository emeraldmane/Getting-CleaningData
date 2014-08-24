# Codebook for Getting and Cleaning Data

## Test and Train Data
Test and train data were loaded separately. The **subject, X, and y files** were loaded for both test and train datasets. 

The headers for the **X values** were extracted from the *features.txt* file and applied to both the datasets and were used to filter out only **means** and **standard deviations**.

This extraction was done using a regular expression on the header names, making sure not to include *meanFreq()*.

Then the test and train data sets were merged into one. Column names of **SubjectID** for the subject and **Activity** for the y values were added for easy readability.

All columns of the data frame were aggregated grouping by SubjectID and Activity which yielded 180 observations (30 subjects * 6 activities) of the 68 variables.

Finally, an activity name was assigned to each of the levels in the Activity column.

Executing the script will output tab separated values to a text file, *tidy.txt*,  in the users current working directory.