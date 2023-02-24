library(readr)
library(dplyr)
rm(list=ls())
students <- read_csv("student_list.csv")

groups <- sample(students$Student)

n <- 4


nr <- length(groups)
set.seed(1234)
split(groups, rep(1:ceiling(nr/n), each = n, length.out = nr))
