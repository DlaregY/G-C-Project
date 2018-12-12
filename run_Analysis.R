library(tidyr)
library(readr)
library(dplyr)

homedir <- getwd()
setwd('UCI HAR Dataset')

features <- read_delim("features.txt", delim=" ", col_names = FALSE)
activity_labels <- read_delim("activity_labels.txt", delim=" ", col_names = c('activity_code','activity'))

X_test <- read_table("test/X_test.txt", col_names = features$X2)
Y_test <- read_table("test/y_test.txt", col_names = 'activity_code')
X_train <- read_table("train/X_train.txt", col_names = features$X2)
Y_train <- read_table("train/y_train.txt", col_names = 'activity_code')
S_train <- read_table("train/subject_train.txt", col_names = 'subject')
S_test <- read_table("test/subject_test.txt", col_names = 'subject')

Z_test <- bind_cols(S_test, Y_test, X_test)
Z_train <- bind_cols(S_train, Y_train, X_train)

Z_all <- bind_rows(Z_test, Z_train) %>%
     left_join(activity_labels, by = 'activity_code') %>%
     select('subject', 'activity_code', 'activity', everything())

Z_stats <- select(Z_all, 'subject', 'activity_code', 'activity', contains('mean'), contains('std')) %>%
     group_by(subject, activity_code, activity)

tidy_means <- summarise_all(Z_stats, mean)

setwd(homedir)

write.table(tidy_means, 'tidy_means.csv', row.names = FALSE)
