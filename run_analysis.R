library(plyr)
#Set working directory
# setwd('/Users/zourloubidou/Dropbox/Coursera/Datascience/UCI HAR Dataset')

#Read needed text files and assign to dataframes
featureslabels<-read.table("./features.txt")
traindata <- read.table("./train/X_train.txt")
testdata<- read.table("./test/X_test.txt")

subject_test<-read.table("./test/subject_test.txt")
rename(subject_test,c("V1"="Subject"))->subject_test

subject_train<-read.table("./train/subject_train.txt")
rename(subject_train,c("V1"="Subject"))->subject_train


#Read activity files and activity label file

activity_test<-read.table("./test/y_test.txt")

activity_train<-read.table("./train/y_train.txt")

activity_labels<-read.table("./activity_labels.txt")


#combine Datatype, Subject and Activity dataframes for train and test separately, then add test dataframe to train (train data will be beofre test data)
info_test<-cbind(subject_test,activity_test)
info_train<-cbind(subject_train,activity_train)

info_combined<-rbind(info_train,info_test)


#Combined datasets with traindata above testdata
combined_data<-rbind(traindata,testdata)


#Put features names in a list and use it to add hears of each feature colunm

features<-featureslabels$V2

names(combined_data) <- features

#Now, I need to keep only the mean and std values in all features
features2<-grep("(mean|std)",features)
combined_data<-combined_data[,features2]

#Now, I can add the 3 columns of info_combined to the reduced combined_data
combined_final<-cbind(info_combined,combined_data)
rename(combined_final, c("V1"="Activity"))->combined_final

#Replace the code number of activity by their names
combined_final<-merge(activity_labels,combined_final,by.x="V1",by.y="Activity",sort=FALSE)
combined_final<-rename(combined_final, c("V2"="Activity"))->combined_final
combined_final$V1<-NULL

#Create second file with means of each activity and each subject
means_summary<-ddply(combined_final,.(Activity,Subject),numcolwise(mean))

#Export means_summary as a text file with tab separations
write.table(means_summary,"./tidy_data.txt",sep="\t")








