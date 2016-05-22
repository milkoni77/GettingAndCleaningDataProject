## Loading needed libraries for the script
library(dplyr)
library(reshape2)

## Loading raw text files into R
wd <- getwd()
subtest <- read.table(file.path(wd,"test/subject_test.txt"), 
                      col.names = "SubjectID")
subtrain <- read.table(file.path(wd,"train/subject_train.txt"), 
                       col.names = "SubjectID")
acttest <- read.table(file.path(wd,"test/y_test.txt"), 
                      col.names = "ActivityID")
acttrain <- read.table(file.path(wd,"train/y_train.txt"), 
                       col.names = "ActivityID")
xtest <- read.table(file.path(wd,"test/x_test.txt"))
xtrain <- read.table(file.path(wd,"train/x_train.txt"))

## Loading labels and nomenclatures
actlabels <- read.table(file.path(wd,"activity_labels.txt"), 
                        col.names = c("ActivityID", "ActivityName"))
features <- read.table(file.path(wd,"features.txt"), 
                       col.names = c("FeatureID", "FeatureName"))

## Binding and merging data into a single dataset
## Always set "test" datasets as first element in binding, to keep the order unchanged.
subjects <- rbind(subtest, subtrain)
activities <- rbind(acttest, acttrain)
featurevalues <- rbind(xtest, xtrain)

## Cutting the features dataset to contain only mean and std data
featuresCut <- features %>% 
    filter(grepl("mean()", FeatureName, fixed = TRUE) | 
           grepl("std()", FeatureName, fixed = TRUE))
## tidying the feature names
## FeatureName column contains original string
## FeatureName2 column contains the string after tiding
featuresCut <- featuresCut %>% 
    mutate(FeatureName2 = sub("BodyBody","Body",FeatureName)) %>% 
    mutate(FeatureName2 = sub("-mean()","Mean",FeatureName2,fixed=TRUE)) %>% 
    mutate(FeatureName2 = sub("-std()","Std",FeatureName2,fixed=TRUE)) %>% 
    mutate(FeatureName2 = sub("Acc","Acceleration",FeatureName2,fixed=TRUE)) %>% 
    mutate(FeatureName2 = sub("Mag","Magnitude",FeatureName2,fixed=TRUE)) %>% 
    mutate(FeatureName2 = sub("Gyro","Gyroscope",FeatureName2,fixed=TRUE)) %>% 
    mutate(FeatureName2 = sub("fBody","freqBody",FeatureName2,fixed=TRUE)) %>% 
    mutate(FeatureName2 = sub("tBody","timeBody",FeatureName2,fixed=TRUE)) %>% 
    mutate(FeatureName2 = sub("tGravity","timeGravity",FeatureName2,fixed=TRUE))

## Selecting only columns for mean and std data, from the values dataset
featurevaluesCut<-select(featurevalues, featuresCut$FeatureID)
## Renaming columns of the values dataset
colnames(featurevaluesCut) <- featuresCut$FeatureName2

## Binding the datasets
binddataset <- cbind(subjects, activities, featurevaluesCut)
## Merging the unified dataset and the activity labels
finaldataset <- merge(binddataset, actlabels, 
                      by.x = "ActivityID", by.y = "ActivityID")

## Calculating the second dataset - average of each variable for each activity and each subject
finalAvg <- melt(finaldataset, 
                 id = c("SubjectID","ActivityName"), 
                 measure.vars = featuresCut$FeatureName2)  %>% 
    group_by(SubjectID, ActivityName, variable) %>% 
    summarise(mean(value))

## Creating the results file
write.table(finalAvg, file = "finalAvg.txt", row.names = FALSE)