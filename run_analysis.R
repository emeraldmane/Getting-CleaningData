library(reshape2)

#load test data
subject_test <- read.table("./test/subject_test.txt")
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")

#load train data
subject_train <- read.table("./train/subject_train.txt")
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")

#load activity names
activity_labels <- read.table("./activity_labels.txt")

#load feature names
features <- read.table("./features.txt")
headers <- features[,2]

#name columns of test and train features
names(X_test) <- headers
names(X_train) <- headers

#select only mean and standard deviation headers
MS <- grepl("mean\\(\\)|std\\(\\)", headers)

#filter mean and standard deviation columns on test and train
X_test_MS <- X_test[,MS]
X_train_MS <- X_train[,MS]

#merge both test and train rows
subject_all <- rbind(subject_test, subject_train)
X_all <- rbind(X_test_MS, X_train_MS)
y_all <- rbind(y_test, y_train)

#combine all data.frames and vectors into one data.frame
mergedata <- cbind(subject_all, y_all, X_all)
names(mergedata)[1] <- "SubjectID"
names(mergedata)[2] <- "Activity"

#aggregate by subjectid and activity
aggregated <- aggregate(. ~ SubjectID + Activity, data=mergedata, FUN = mean)

#descriptive activity names
aggregated$Activity <- factor(aggregated$Activity, labels=activity_labels[,2])

#Creates independent tidy data set with the average of each variable for each activity and each subject
write.table(aggregated, file="./tidy.txt", sep="\t", row.names=FALSE)