# Getting and Cleaning Data Project

# required packages
library(plyr)

# load the training set
train.x <- read.table("train/X_train.txt",header=F)
# load training labels
train.y <- read.table("train/y_train.txt",header=F)
names(train.y)<-"Class.Label"
# load training subjects
train.subject <- read.table("train/subject_train.txt",header=F)
names(train.subject) <- "Subject"
# prep train dataset
train<-cbind(train.subject,train.x,train.y)
# remove objects no longer needed
rm(list=c("train.x","train.y","train.subject"))

# load test set
test.x <- read.table("test/X_test.txt",header=F)
# load test labels
test.y <- read.table("test/y_test.txt",header=F)
names(test.y) <- "Class.Label"
# load test subjects
test.subject <- read.table("test/subject_test.txt",header=F)
names(test.subject) <- "Subject"
# prep test dataset
test<-cbind(test.subject,test.x,test.y)
# remove objects no longer needed
rm(list=c("test.x","test.y","test.subject"))

# merge training and test sets
train.test <- rbind(train,test)
rm(list=c("train","test"))

# load table map of class labels to activity names 
activity.labels <- read.table("activity_labels.txt",header=F)
names(activity.labels) <- c("Class.Label","Activity.Name")

# assign descriptive activity names to merged dataset
train.test <- merge(train.test,activity.labels,by="Class.Label",all.x=T,all.y=F)
train.test$Class.Label <- NULL

# load list of all features
features <- read.table("features.txt",header=F)
names(features) <- c("Feature.Id","Feature.Name")

# assign features to column names
names(train.test) <- c("Subject",as.character(features$Feature.Name),"Activity.Name")

# identify all column names with mean and standard deviation for all measurement, in addition to subject and activity names
col.names <- c("Subject","Activity.Name",names(train.test)[grep("mean|std",tolower(names(train.test)))])

# column reduce dataset
train.test.cd <- train.test[,col.names]
train.test.cd$Subject <- factor(train.test.cd$Subject)

# create second tidy data set with the average of each variable for each activity and subject
tidy.set <- ddply(train.test.cd,.(Activity.Name,Subject),function(df) colMeans(df[,3:ncol(df)]))

# write tidy dataset to working directory for submission
write.table(tidy.set,"tidy.txt",sep="\t",row.names=FALSE)

# remove objects no longer needed
rm(list=c("activity.labels","features","col.names"))
