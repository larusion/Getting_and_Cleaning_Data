setwd("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

FEATURES <- read.table("features.txt")
anyDuplicated(FEATURES[,2])
FEATURES[,2] <- make.names(FEATURES[,2], unique = TRUE)
anyDuplicated(FEATURES[,2])

ACTIVITY_LABELS <- read.table("activity_labels.txt")
names(ACTIVITY_LABELS)[2] <- "activity_name"

setwd("./train/")

SUBJECT_TRAIN <- read.table("subject_train.txt")
View(SUBJECT_TRAIN)
names(SUBJECT_TRAIN) <- "subject_no"

X_TRAIN <- read.table("X_train.txt")
dim(X_TRAIN)
View(X_TRAIN)
names(X_TRAIN) <- FEATURES[,2]

y_TRAIN <- read.table("y_train.txt")

library(plyr)
library(dplyr)

joinedtrain <- join(y_TRAIN,ACTIVITY_LABELS)
### Joining by: V1
joinedtrain <- select(joinedtrain,-V1)

TRAIN <- cbind(SUBJECT_TRAIN,joinedtrain,X_TRAIN)

setwd("../test/")

SUBJECT_TEST <- read.table("subject_test.txt")
names(SUBJECT_TEST) <- "subject_no"

X_TEST <- read.table("X_test.txt")
names(X_TEST) <- FEATURES[,2]

y_TEST <- read.table("y_test.txt")
joinedtest <- join(y_TEST,ACTIVITY_LABELS)
joinedtest <- select(joinedtest,-V1)

TEST <- cbind(SUBJECT_TEST,joinedtest,X_TEST)


DATA <- rbind(TEST,TRAIN)

DATAselected <- select(DATA, subject_no, activity_name, contains("mean"), contains("std"))

res <- group_by(DATAselected, subject_no, activity_name)

FINAL_DATA <- summarise_each(res, funs(mean), contains("mean"), contains("std"))

write.table(FINAL_DATA, file = "FINAL_DATA.txt", row.names = FALSE)



