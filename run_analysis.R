library(dplyr)

setwd("C:/Users/simon/Coursera/getting_and_cleaning_data/Project/")

features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
V1 <- c(0, 0)
V2 <- c("Subject", "Activity")
features <- rbind(data.frame(V1, V2), features)
activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Read in & combine train files
x.train <- read.table("UCI HAR Dataset/train/X_train.txt")
y.train <- read.table("UCI HAR Dataset/train/y_train.txt")
subj.train <- read.table("UCI HAR Dataset/train/subject_train.txt")
train.data <- cbind(subj.train, y.train, x.train)
rm(x.train)
rm(y.train)
rm(subj.train)

# Read in & combine test files
x.test <- read.table("UCI HAR Dataset/test/X_test.txt")
y.test <- read.table("UCI HAR Dataset/test/y_test.txt")
subj.test <- read.table("UCI HAR Dataset/test/subject_test.txt")
test.data <- cbind(subj.test, y.test, x.test)
rm(x.test)
rm(y.test)
rm(subj.test)


all.data<-rbind(train.data, test.data)
rm(test.data)
rm(train.data)
names(all.data) <- features[, 2]

#Remove irrelevant variables and give descriptive names to activities
all.data <- all.data[, names(all.data) == "Activity" | names(all.data) == "Subject" | grepl("std", names(all.data), ignore.case = TRUE)|grepl("mean", names(all.data), ignore.case = TRUE)]
all.data <- inner_join(all.data, activity.labels, by = c("Activity" = "V1"))
all.data <- mutate(all.data, Activity = V2)
all.data <- select(all.data, -V2)


step.5.data <- group_by(all.data, Subject, Activity)
step.5.data <- summarize_each(step.5.data, funs(mean))

write.table(step.5.data, "step-5-data.txt", row.names = FALSE)
