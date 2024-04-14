#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: Titanic
#and give the dataframe a new name of your choice
#(hint: you will want your data to be a dataframe. Use the function: as.data.frame(Titanic))

#-------------------------------------------------#
data(Titanic)
TitanicData = as.data.frame(Titanic)
#-------------------------------------------------#

#See the top rows of the data
#TASK: Write the function to see the top rows of the data

#-------------------------------------------------#
head(TitanicData)
#-------------------------------------------------#

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr

#-------------------------------------------------#
install.packages("dplyr")
library(dplyr)
#-------------------------------------------------#


#Let's just see the Survived and Sex columns
#Task: Write the function to 'select' the Survived and Sex columns 
#(hint: use the 'select' function)

#-------------------------------------------------#
Survived_Sex_Col = select(TitanicData, Survived, Sex)
#head(Survived_Sex_Col)
#-------------------------------------------------#


#Let's name the dataset with just the two columns, Survived and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name

#-------------------------------------------------#
LeiDataset = "LeiDataset"
assign(LeiDataset, Survived_Sex_Col)
#-------------------------------------------------#


#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)

#-------------------------------------------------#

NewLeiDataset = select(LeiDataset, -Sex)
#head(NewLeiDataset)
#-------------------------------------------------#

#Let's rename a column name
#TASK: Write the function that renames 'Sex' to 'Gender'
#-------------------------------------------------#
LeiDataset = rename(LeiDataset, Gender = Sex)
TitanicData = rename(TitanicData, Gender = Sex)
head(LeiDataset)
#-------------------------------------------------#

#Let's make a new dataframe with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column

#-------------------------------------------------#
AnotherNewLeiDataset = select(LeiDataset, Gender)
#head(AnotherNewLeiDataset)
#-------------------------------------------------#

#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'

#-------------------------------------------------#
male_df = TitanicData %>% filter(Gender == "Male")
#head(male_df)
#-------------------------------------------------#

#Let's 'arrange' our data by gender (not the data you just filtered)
#TASK: Write the function to group the data by gender (hint: arrange())

#-------------------------------------------------#
arranged_df = arrange(TitanicData, Gender)
#head(arranged_df)
#-------------------------------------------------#

#Let's see how many people were examined in the dataset (total the frequency in the original dataframe)
#TASK: Sum the Freq column
#TASK: After you run it, write the total here:2021

#-------------------------------------------------#
total = sum(TitanicData$Freq)
print(total)
#-------------------------------------------------#

#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'

#-------------------------------------------------#
female_df = TitanicData %>% filter(Gender == "Female")
#head(female_df)
#-------------------------------------------------#

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')

#-------------------------------------------------#
join_df = bind_rows(male_df, female_df)
#print(join_df)
#-------------------------------------------------#

#Optional Task: add any of the other functions 
#you learned about from the dplyr package
distinct_values = distinct(TitanicData, Age )
#head(distinct_values)