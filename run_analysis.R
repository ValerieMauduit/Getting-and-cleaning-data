library(dplyr)
library(reshape2)

#------------------------------------------------------------------------------
# 1 - Merges the training and the test sets to create one data set.

# General data
ActivityLabels <- read.table(
    file = "activity_labels.txt", 
    sep = " ", 
    col.names = c('id', 'activity'))
Features <- read.table("features.txt")
colnames(Features) <- c("id", "feature")
# Warning repeated names of features !
# Remove special sign from features names
Features[, 2] <- gsub("[-\\(\\),]", "", Features[, 2])

# Train data
setwd("train")
SubjectsTrain <- read.table(file = "subject_train.txt", col.names = "id")
XTrain <- read.table("X_train.txt")
# Naming features instead of V1, V2...
colnames(XTrain) <- Features[, 2]
YTrain <- read.table("y_train.txt")
# Naming activities instead of id of each activity
YTrain <- YTrain %>% 
    mutate(ActivityName = ActivityLabels[YTrain[1:7352, ], 2])

CompleteTrain <- cbind(SubjectsTrain, YTrain[, 2], XTrain)
colnames(CompleteTrain)[1:2] <- c("Subject", "Activity")

# Test data
setwd("../test")
SubjectsTest <- read.table(file = "subject_test.txt", col.names = "id")
XTest <- read.table("X_test.txt")
# Naming features instead of V1, V2...
colnames(XTest) <- Features[, 2]
YTest <- read.table("y_test.txt")
# Naming activities instead of id of each activity
YTest <- YTest %>% 
    mutate(ActivityName = ActivityLabels[YTest[1:2947, ], 2])

CompleteTest <- cbind(SubjectsTest, YTest[, 2], XTest)
colnames(CompleteTest)[1:2] <- c("Subject", "Activity")

# Merging
CompleteDataSet <- rbind(CompleteTest, CompleteTrain)

#------------------------------------------------------------------------------
# 2 - Extracts only the measurements on the mean and standard deviation for 
# each measurement.

# [^F] is to avoid meanFreq values, which are not measurements means nor std.
MeanStdFactors <- grep("(mean|std)[^F]", Features[, 2])
# I add id of user and activity
InterestingFactors <- sort(c(1, 2, 2+MeanStdFactors))

# Subset of intersting factors only
DataMeanSD <- CompleteDataSet[, InterestingFactors]

#------------------------------------------------------------------------------
# 3 - Uses descriptive activity names to name the activities in the data set

# Done with the mutate function in YTest and YTrain (part 1)

#------------------------------------------------------------------------------
# 4 - Appropriately labels the data set with descriptive variable names.

# Done when reading XTest and XTrain (part 1)

#------------------------------------------------------------------------------
# 5 - From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

DatasetSummarisedLines <- DataMeanSD %>% 
    group_by(Subject, Activity) %>% 
    summarise_each(funs(mean))

temporary <- melt(DataMeanSD, id = c("Subject", "Activity"))
DatasetSummarisedSquared <- 
    acast(temporary, Subject ~ Activity ~ variable, mean)

#------------------------------------------------------------------------------
# Writing results into csv files

setwd("..")
write.csv(DataMeanSD, "TidyData.csv")
write.csv(DatasetSummarisedLines, "summarisedData.csv")

# File for the submission
write.table(DatasetSummarisedLines, file = "VMauduit.txt", row.name = FALSE)
