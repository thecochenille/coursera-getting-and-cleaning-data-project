CodeBook coursera-getting-and-cleaning-data-project
==========================================
This CodeBook is to help you understand the data used in the script run_analysis.R

#Aim of the project
As part of the evaluation for [Getting and Cleaning Data in Coursera] (https://class.coursera.org/getdata-002), we had to write a script in R to put in practice how to read data, transform it to be further analysed.

Here, we used datasets of measurements obtained from the Human Activity Recognition Using Smartphones project (www.smartlab.ws) to create: (i) a merge dataset including all means and standard deviations of each measurement, (ii) from this dataset, obtain a tidy dataset that is exported as a text file, where the means for each type of Activity and each tested subject are summarized. 

#Dataset

The original dataset is to be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The reference for this dataset is (more information found in README.txt of the original dataset): 
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

After you have unzipped it, it is a folder called "UCI HAR Dataset" with a few files.

In this script, the files you will use are:
-"./features.txt"
-"./train/X_train.txt"
-"./test/X_test.txt"
-"./test/subject_test.txt"
-"./train/subject_train.txt"
-"./test/y_test.txt"
-"./train/y_train.txt"
-"./activity_labels.txt"

#Variables
The variables present in the datasets:
- "Activity": this includes 6 types of activities, which are number coded in "./activity_labels.txt"  
			1 WALKING
			2 WALKING_UPSTAIRS
			3 WALKING_DOWNSTAIRS
			4 SITTING
			5 STANDING
			6 LAYING

- "Subject": this variable provide the number given to each subject that was tested. There are 30 subjects in total

- "Features": These are all the measurements of features and is listed in "./features.txt"

#Transformations from original dataset
Although there are some quick explanations in the run.analysis.R file for command lines, here are the main transformations made from the original datasets before obtaining the tidy dataset:

- Measurements for X_train and X_test were combined in a dataframe
- Columns of Activity and Subject were added to this dataframe
- As the "./y_test" and "./y_train" files were only the number codes of activities, they were replaces by the names of the activity
-In all the 561 features, only the means (mean()) and standard deviations (std()) were kept in the dataframe, for a total of 79 features.

From this dataframe (called: combined_final in R), for each activity and each subject, we calculate the mean of each measurement and this second dataframe is exported as "./tidy_data.txt" with tab separations.

The final output has 180 rows and 81 columns





