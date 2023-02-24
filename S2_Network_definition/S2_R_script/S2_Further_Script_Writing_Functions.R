
#1.Writing functions: Example 1 ----------

var1 <- 1
var2 <- 3
var3 <- var1 + var2

#Converting to a function
#--a) How many inputs?  --> var1 and var2
#--b) Renaming input
#---- We call var1  -->  x1
#---- We call var2  -->  x2
#--c) Creating and naming the function
mySum <- function(x1, x2) {
  x1 + x2
}

mySum(var1, var2)

var4 <- 10
var5 <- 20
mySum(var4, var5)



#2.Writing functions: Example 2 ----------

myVector <- c("a", "b", "c", "d", "e") 
myVector[c(1, 2)]

#Converting to a function the return
#--a) How many inputs? --> myVector
#--b) Renaming input
#---- We call myVector  -->  x
#--c) Creating and naming the function
element_extraction_12 <- function(x) {
  x[c(1,2)]
}

myVector1 <- c(1, 100, 1000, 10000, 100000)
element_extraction_12(myVector1)

myVector2 <- c(1, 3, 5, 7, 10000)
element_extraction_12(myVector2)

#A more generic version
element_extraction <- function(x, i, j) {
  x[c(i,j)]
}

element_extraction(myVector1, 3, 4)
element_extraction(myVector1, 1, 5)



#3.Writing functions: Example 3 ----------
#'We want to create a function returns
#'frequency table and the corresponding plot
#'resulting from Throwing a dice n times

myDice <- function(n){
  throws <- sample(1:6, n, rep = T)
  frequency <- table(throws)/n
  barplot(frequency, main = paste0("Throwing a dice (n=", n, ")"))
  abline(h = 1/6, col = 'red', lwd = 2)
  return(frequency)
}

myDice(100)
myDice(1000)
myDice(100000000)
