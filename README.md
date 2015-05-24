First of all, we set the working directory to be the directory that has the data we are going to analyze. 

In this directory, we find two files to be read (features.txt and activity_labels.txt) and two folders (train and test)
to be looked at later.

Firstly, we read the file "features.txt" into R and call the resulting data frame FEATURES. It lists all features. For the purpose of this analysis, we are interested in the second column as it contains the variable names we will use later. We check if there are duplicated elements in the second column and make unique names where necessary.

Secondly, we read the file "activity_labels.txt" into R and call the resulting data frame ACTIVITY_LABELS. It links the class labels with their activity name. The column names are V1 and V2. We keep the name of the first column as it is but we change the name of the second column to "activity_name" to be more descriptive.

Now, we move to the folder "train". Firstly, we read the file "subject_train.txt" into R and call the resulting data frame SUBJECT_TRAIN. Each row identifies the subject in the train group who performed the activity for each window sample. Again to be more descriptive we rename the name of its column. Now, it is called "subject_no".

Secondly, we read the file "X_train.txt" into R and call the resulting data frame X_TRAIN. It is the training set. It gives the values of the measurements for each activity performed by the volunteers in the train group. The names of the measurements are listed by the FEATURES. At this moment,we change the names of the columns from V1, V2, V3,... to their respective names givem by the second column of the FEATURES.

Thirdly, we read the file "y_train.txt" into R and call the resulting data frame y_TRAIN. It lists the training labels. Now, we would like to use descriptive activity names to name the activities in the data frame y_TRAIN. For this purpose, we are going to merge y_TRAIN and ACTIVITY_LABELS. To achieve it, we need plyr and dplyr packages. After we have joined these two data frames by the first column that V1, we drop V1 as we do not need it in the future. The resulting data frame is called joinedtrain.

The three data frames that are SUBJECT_TEST, joinedtrain and X_TEST are ready be bound column-wise. This newly produced data frame is called TRAIN. It lists the subjects with their respective numbers in train group, the activities they performed, the values 

The steps carried out for the train data set are executed the test data set set as well. Then we end up with the data frame called TEST. 












