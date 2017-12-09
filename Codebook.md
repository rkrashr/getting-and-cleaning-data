Codebook
=========

This document describes the code and data related to the project

Code structure
--------------

The code is organized in a flat procedural manner. Execution is sequential, non-cyclic, non-recursive.

The algorithm is as follows:

1. read names of features
2. read activity labels 
3. read test dataset
4. read activity column for test dataset
5. read subjects column for test dataset
6. read train dataset
7. read activity column for train dataset
8. read subjects column for train dataset
9. merge train and test datasets
10. free up memory
11. merge actifity columns for train and test datasets
12. merge subjects columns for train and test datasets
13. select features that are either mean or std values
14. add subjects and activities columns
15. prettify feature names - all lower case, alphanumeric characters
16. apply new pretty column names
17. create an independent tidy data set with the average of each variable for each activity and each subject

Original dataset features
-------------------------
 1. activity index
 2. subject 
3 - 564. numeric data (see original dataset for details)

Tidy dataset
------------
1. activity label
2. subject
3 - 69. mean and standard deviation values (see original dataset for details)

Resultant dataset 
-----------------
Cross-tabulated dataset grouped by activity and subject, other columns are averaged.
