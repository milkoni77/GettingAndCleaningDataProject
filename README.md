# GettingAndCleaningDataProject
Coursera Getting and Cleaning Data Course Project

The summary of the task was set as:

You should create one R script called run_analysis.R that does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


The result script suggests that the working directory is set to the main folder of the archive provided. So, there are two subfolders - "train" and "test" in it, and some raw files - "activity_labels.txt", "features.txt" and "features_info.txt".

At the first step the script loads "dplyr" and "reshape2" libraries, needed respectively for the manipulating and for the melting of the datasets.

Then, the raw data is loaded as datasets in R, using read.table command and changing column names when it is nessessary for the following analyses and merging.

By row binding, "test" and "train" datasets are joined. Always the "test" datasets are used as a first element in the row binding, to keep the order of rows unchanged.

Using twice the grepl function, features dataset is cut, keeping only elements (rows) for mean and standard deviation features - marked by "mean()" and "std()" respectively in their name, according to the original code book.

The names of the features are tided, by using sub function several times. At this moment we have featuresCut dataset, containing only needed features, with their FeatureID (original order in the raw dataset), orininal name and tided name.

Using the featuresCut$FeatureID vector, the featuresvalues dataset is cut to contain only columns for mean and std data. After that, its columns are renamed according to tided featuresCut$FeatureName2 values.

After that, the result is column binded with datasets, containing info about the subjects and activities for each row of the observations. This step is correct, only if test and train datasets are row binded in the same way for subjects, activities and featurevalues datasets.

The factor, meaningful names of the activities are merged to the dataset, creating finaldataset - the needed result of the step 4.

Using the melt function, the columns, describing each variable are transferred to rows. After that, by group_by and summarise functions, the average of each variable for each activity and each subject is calculated. Result is a finalAvg dataset, which is written to the provided finalAvg.txt file.
