# G-C-Project
Course Project for Getting &amp; Cleaning Data

## Recipe
- Using the Tidyverse suite of packages, this script first reads in all of the raw data files using read_table.
- It then uses bind_cols to combine the data sets containing the raw data, the activity labels, and the subject labels, for both the training and test datasets.
- The training and test datasets are then merged using bind_rows.
- Activity labels are added in as a new column using a join command.
- A subset of the data is created containing only the data columns containing mean and std, and the data is grouped by activity and subject.
- This subset is summarized into a new data set, which is then written to a .csv file.

## Code Book
tidy_means contains three columns that uniquely identify each record:
1. subject:        subject number 1-30               (numeric)
2. activity_code:  identifies the activity (1-6)     (numeric)
3. activity:       description of the 6 activites    (character)
* There are 6 activities x 30 subjects, for a total of 180 rows. 
* Each row contains the mean value of the mean and std vector measurements from the original dataset, grouped by subject and activity.
* There are 86 of these mean measurements, all numeric.
