#'=================================================================================
#'9595N1: Network Analysis and Infographics
#'Dr. Daniele Rotolo (www.danielerotolo.com)
#'SPRU Science Policy Research Unit, University of Sussex
#'=================================================================================
#'S2: Network definition -- Introduction to R
#'=================================================================================


#1.Remove objects  ---------- 
rm(list=ls())
    


#2.Vectors (1-dimension)  ----------
x <- 4

y <- 5

z <- x + y
z

w <- x * y
w

k <- x - y
k

p <- x^y
p

x > 3
x < 3

t <- "hello world"



#3.Vectors (2-dimension)  ----------
v <- c(-1.0, 2.6, 3.5, 4.1, 5.0)
v


v1 <- c("hello", "world")
v1


v2 <- c(TRUE, FALSE, TRUE, FALSE, FALSE, TRUE, TRUE)
v2

v3 <- c(T,F,T)
v3

v*2
1/v
sum(v)
mean(v)
var(v)
max(v)
min(v)
length(v)


sort(v)
sort(v, decreasing = FALSE)
sort(v, decreasing = TRUE)


y <- v[1]
y

x <- v[c(2,4,5)]
x


length(x)


x[x<3]
x[x>3]
x[x==0]




#' EXERCISE 1  --- --- --- --- --- --- --- --- --- --- --- ---
#' Write a script that
#' 1. creates a vector with some of your friend's names;
#' 2. calculates the length of this vector;
#' 3. returns the first two friends from this vector;
#' 4. returns the 2nd and 3rd friend names;
#' 5. sorts your friends by names;
#' 6. reverses direction of the above sort.
#' --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---




#4.Matrices  ----------
A <- matrix(c(2, 4, 3, 1, 5, 7, 1, 2, 4), nrow = 3, ncol = 3) 
A


A[,1]
A[1,]
A[3,3]


t(A)
diag(A)


B <- matrix(1:9, nrow = 3)
B


A+B
A*B     #Element by element
A%*%B   #Matrix product


x <- c(1, 2, 3)
y <- c(3, 4, 5)
cbind(x, y)
rbind(x, y)


#' EXERCISE 2  --- --- --- --- --- --- --- --- --- --- --- ---
#' Write a script that
#' 1. creates a matrix 5x5 from 5 numerical vectors;
#' 2. returns the diagonal of the matrix;
#' 3. transposes the matrix;
#' 4. multiplies the new matrix with the original matrix;
#' 5. extracts the last row of the resulting matrix;
#' 6. extracts the third column of the resulting matrix.
# --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---



#5.Lists  ----------
d <- list(name = "Pippo", values = c(20,125,40), date = Sys.Date())
d


d[[3]]
mydate <- d[[3]] 

d$date
d$values


#6.Factors  ----------
v <- c("John", "Sara", "Anthony", "Frank", "Sara", "Stephanie", "Anthony", "Anthony")
factor(v)
table(v)



#7.Data frames  ----------
mtcars                                                      #Example of a dataframe preloaded in R

head(mtcars, n=5) 
tail(mtcars, n=5)
summary(mtcars)

mtcars$mpg
mtcars$new_var <- mtcars$mpg * mtcars$gear
mtcars$new_var
summary(mtcars$new_var)
hist(mtcars$new_var)



#8.Importing/Exporting data  ----------
setwd("C:/Users/yasem/Dropbox/959N1_2020_22_teaching_material/S2_Network_definition/S2_R_script")

#Reading data (explore the commands in the help guides)
library(readr)
data_from_csv <- read_csv("data.csv")
data_from_txt <- read_delim("data.txt", delim = "\t")


library(readxl)
data_from_excel <- read_xlsx("data.xlsx", sheet = "data")


library(haven)
data_from_stata <- read_dta("data.dta")


#Writing data (explore the commands in the help guides)
write_csv(data_from_csv, "data2.csv")
write_dta(data_from_csv, "data2.dta")



#' EXERCISE 3  --- --- --- --- --- --- --- --- --- --- --- ---
#' Write a script that
#' 1. creates a csv files that includes a dataset of at 
#'    least 5 variables and 5 observations
#' 2. imports the dataset in R
#' 3. adds a variable
#' 4. exports the data as a csv file
#' --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---



#9.Create a network and plot it  ----------

library(igraph)
g <- graph.formula(1-2, 1-3, 2-3, 3-4, 2-5, 3-5, 5-6, 5-7)  #List of edges
plot(g)



# FURTHER SCRIPT - WRITING FUNCTIONS --- --- --- --- --- --- --- --- --- ---
# We will be mainly using functions available in the igraph package for this course.
# In addition, you will find a separate script presenting examples on how to write your own functions.
# It could be useful and time/energy saving to write your own functions in general.
#' --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
