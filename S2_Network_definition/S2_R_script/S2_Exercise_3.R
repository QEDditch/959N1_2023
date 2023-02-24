#' EXERCISE 3  --- --- --- --- --- --- --- --- --- --- --- ---
#' Write a script that
#' 1. creates a csv files that includes a dataset of at 
#'    least 5 variables and 5 observations
#' 2. imports the dataset in R
#' 3. adds a variable
#' 4. exports the data as a csv file
#' --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---



#' SOLUTION  --- --- --- --- --- --- --- --- --- --- --- ---
rm(list=ls())


#' 1. creates a dataset in csv with at least 5 variables and 5 observations
#' See file S2_Exercise_3_data.csv

#' 2. imports the dataset in R
library(readr)
setwd("<--DEFINE YOUR WORKING DIRECTORY-->")
data <- read_csv("S2_Exercise_3_data.csv")

#' 3. adds a variable
library(tidyverse)
data <- data %>%
  mutate(Var6 = (Var1*Var2) - data$Var4)  %>% # creating a new variable
  rename(Var1_new = Var1)                     # renaming a variable

#' 4. exports the data as a csv file
write_csv(data, "S2_Exercise_3_data_new.csv")     
