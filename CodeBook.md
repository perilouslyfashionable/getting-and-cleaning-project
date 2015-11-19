# Getting and Cleaning Data course project - code book

This document describes the variables and data in the tidy data set "step-5-data.txt". The data set can be opened in R with the command read.table("step-5-data.txt", header = TRUE).

##Subject

The reference number of the subject of the remaining variables in the observation: i.e. the person to whom the observation applies.

## Activity

A factor describing the activity being carried out. Possible values are:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

##Data variables

There are 86 data variables. Each of them is a mean of the various
means and standard deviations of the observations of the subject doing the given activity. 