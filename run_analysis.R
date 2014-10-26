unzip("getdata-projectfiles-UCI HAR Dataset.zip")
testFeatures <-read.table("UCI HAR Dataset/test/X_test.txt")
testActivity <-read.table("UCI HAR Dataset/test/y_test.txt")
testSubject <-read.table("UCI HAR Dataset/test/subject_test.txt")

trainFeatures <-read.table("UCI HAR Dataset/train/X_train.txt")
trainActivity <-read.table("UCI HAR Dataset/train/y_train.txt")
trainSubject <-read.table("UCI HAR Dataset/train/subject_train.txt")

features<-rbind(testFeatures,trainFeatures)
activity<-rbind(testActivity,trainActivity)
activity<-factor(activity$V1,labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
subject<-rbind(testSubject,trainSubject)
subject<-factor(subject$V1)

labels<-read.table("UCI HAR Dataset/features.txt")
s<-labels[grep("mean",ignore.case = T, labels$V2),]
t<-labels[grep("std",ignore.case = T, labels$V2),]
l<-rbind(s,t)
data<-features[,l$V1]
dataframe<-cbind(subject,activity,data)

colnames(dataframe) <- c("subject", "activity", as.character(l$V2))

write.table(dataframe, file="UCI_HAR_Dataset.txt", row.name=FALSE)
