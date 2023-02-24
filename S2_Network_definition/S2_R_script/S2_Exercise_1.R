#' EXERCISE 1  --- --- --- --- --- --- --- --- --- --- --- ---
#' Write a script that
#' 1. creates a vector with some of your friend's names;
#' 2. calculates the length of this vector;
#' 3. returns the first two friends from this vector;
#' 4. returns the 2nd and 3rd friend names;
#' 5. sorts your friends by names;
#' 6. reverses direction of the above sort.
#' --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---


#' SOLUTION  --- --- --- --- --- --- --- --- --- --- --- ---
rm(list=ls())

#' 1. creates a vector with some of your friend's names;
x <- c("Antonio", "Sam", "Monica", "Michael", "Roberto", "Nicola")

#' 2. calculates the length of this vector;
length(x)

#' 3. returns the first two friends from this vector;
x[1:2]

#' 4. returns the 2nd and 3rd friend names;
x[2:3]

#' 5. sorts your friends by names;
sort(x)

#' 6. reverses direction of the above sort.
sort(x, decreasing = T)