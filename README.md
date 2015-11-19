# Getting and Cleaning Data course project

The document explains the run_analysis.R script

##Assumptions

The script assumes that it is in a directory containing a sub-directory called "UCI HAR Dataset/" which contains the project data.

##Preliminary 

The script begins by reading the features and activity labels 
data into two data frames - features and activity.labels. These 
data frames are used to label the data later. A header is created
for the features data frame for ease of combining with the activity data.

##Test & train data

The following steps are carried out for each of the test and train
data sets (the procedure is set out for the train data; it is the 
same for the test data but with different names):

* Read the X\_train.txt file into a data frame called x.train
* Read the y\_train.txt file into a data frame called y.train
* Read the subject\_train file into a data frame called subj.train
* Use colbind to combine the three data frames into a single data frame called train.data
* Delete the intermediate dataframes from memory using rm()

When this has been done, train.data and test.data are combined
using rbind into a single data frame, all.data, and train.data
and test.data are deleted.

The names of all.data are set to the values of the second column of 
the features data frame, which means that the data set is appropriately
labelled with descriptive variable names

##Removing irrelevant variables and giving descriptive names to activities

Next, irrelevant variables are removed. Variables containing information
on means and standard deviations are taken to be those containing the
string "std" or the string "mean" (in any case). grepl() is used to filter 
variables containing these names. The Subject and Activity variables are
also preserved.

Next, activities are given descriptive labels. dplyr is used. inner_join is used to tack the activities.labels data frame onto all.data as an additional column. Mutate is used to replace the existing activity column with 
the descriptive names, and then select is used to remove the surplus column.

##Independent tidy data set

The tidy data set is contained in step.5.data. The dplyr group\_by and summarize\_each functions are used to first group the data by subject 
and activity, and then to produce a mean of each data column.
