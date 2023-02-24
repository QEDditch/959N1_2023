#' EXERCISE 2  --- --- --- --- --- --- --- --- --- --- --- ---
#' Write a script that
#' 1. creates a matrix 5x5 from 5 numerical vectors;
#' 2. returns the diagonal of the matrix;
#' 3. transposes the matrix;
#' 4. multiplies the new matrix with the original matrix;
#' 5. extracts the last row of the resulting matrix;
#' 6. extracts the third column of the resulting matrix.
# --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---


#' SOLUTION  --- --- --- --- --- --- --- --- --- --- --- ---
rm(list=ls())

#' 1. creates a matrix 5x5 from 5 numerical vectors;
a <- c(1, 2, 3, 4, 5)
b <- seq(from = 10, to = 18, by = 2)
c <- c(1, 0, 0, 0, 0)
d <- c(0, 0, 0, 0, 0)
e <- c(2, 5, 7, 10, 3)
A <- rbind(a, b, c, d, e)

#' 2. returns the diagonal of the matrix;
diag(A)

#' 3. transposes the matrix;
B <- t(A)

#' 4. multiplies the new matrix with the original matrix;
C <- A%*%B

#' 5. extracts the last row of the resulting matrix;
C[5,]

#' 6. extracts the third column of the resulting matrix.
C[,3]
