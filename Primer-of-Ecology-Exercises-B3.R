#!/usr/bin/env Rscript

writeLines("\n\tCreates the vector Y with the entries 8.3, 8.6, 10.7, 10.8, 11, 11, 11.1, 11.2, 11.3, 11.4\n")
Y <- c(8.3, 8.6, 10.7, 10.8, 11, 11, 11.1, 11.2, 11.3, 11.4)

writeLines("\n\tGenerates the sequence of integers from 1 to 4\n")
1:4

writeLines("\n\tGenerates the same sequence as above, but in reverse order\n")
4:1

writeLines("\n\tGenerates the sequence of integers from 1 to 3 and then takes minus each number\n")
-(1:3)

writeLines("\n\tGenerates an arithmetic progression starting in 1 and ending in 3 with a step of 0.2\n")
seq(from = 1, to = 3, by = 0.2)

writeLines("\n\tSame as above, but naming less parameters\n")
seq(1, 3, by = 0.2)

writeLines("\n\tGenerates an arithmetic progression starting in 1 and ending in 3 containing exactly 7 items\n")
seq(1, 3, length = 7)

writeLines("\n\tGenerates a sequence of length three with all items equal to 1\n")
rep(1, 3)

writeLines("\n\tGenerates a sequence composed of the sequence 1, 2, 3 repeated twice, one after another\n")
rep(1:3, 2)

writeLines("\n\tGenerates a sequence composed of the numbers 1, 2 and 3, each number printed twice before the next one\n")
rep(1:3, each = 2)

writeLines("\n\tCalculates the sum of the elements in Y\n")
sum(Y)

writeLines("\n\tCalculates the mean of the elements in Y\n")
mean(Y)

writeLines("\n\tReturns the largest element of Y\n")
max(Y)

writeLines("\n\tReturns the length of Y\n")
length(Y)

writeLines("\n\tReturns a summary containing the maximum, minimum, mean, median, 1st and 3rd quartiles\n")
summary(Y)

writeLines("\n\tCreates and prints a vector containing the strings 'Sarah' and 'Yunluan'\n")
Names <- c("Sarah", "Yunluan")
Names

writeLines("\n\tCreates and prints a vector containing logical values\n")
b <- c(TRUE, FALSE)
b

writeLines("\n\tReturns the class of the elements in Y\n")
class(Y)

writeLines("\n\tReturns the class of the elements in b\n")
class(b)

writeLines("\n\tCreates a new vector containing for each position TRUE if the corresponding element in Y is larger than 10 and FALSE otherwise\n")
Y > 10

writeLines("\n\tCreates a new vector containing for each position TRUE if the corresponding element in Y is larger than the mean of Y and FALSE otherwise\n")
Y > mean(Y)

writeLines("\n\tCreates a new vector containing for each position TRUE if the corresponding element in Y is not equal to 11 and FALSE otherwise\n")
Y != 11

writeLines("\n\tCreates the vectors a and b and then returns a new vector that contains in each position the sum of the corresponding elements from a and b\n")
a <- 1:3
b <- 4:6
a + b

writeLines("\n\tReturns a new vector that contains in each position the product of the corresponding elements from a and b\n")
a * b

writeLines("\n\tReturns a new vector that contains in each position the division of the corresponding element from a by the corresponding element from b\n")
a / b

writeLines("\n\tAdds 1 to each element in a and returns the resulting vector\n")
a + 1

writeLines("\n\tMultiplies each element in a by 2 and returns the resulting vector\n")
a * 2

writeLines("\n\tTakes the inverse of each element in a and returns the resulting vector\n")
1/a

writeLines("\n\tExtends the vector 1:2 to match the length of a and then multiplies the elements in each vector. Shows a warning\n")
a * 1:2

writeLines("\n\tDoes the same as above, but with no warning\n")
a * c(1, 2, 1)

writeLines("\n\tExtends the vector 1:2 to match the length of 1:4 and then multiplies the elements in each vector. Doesn't show a warning because the length of the longer vector is a multiple of the length of the smaller vector\n")
1:4 * 1:2

writeLines("\n\tReturns the first element in Y\n")
Y[1]

writeLines("\n\tReturns the first, second and third elements in Y\n")
Y[1:3]

writeLines("\n\tReturns all elements in Y greater than the mean of Y\n")
Y[Y > mean(Y)]

writeLines("\n\tCreatas the array a containing integers and one NA, saes it in a, and then prints it to the screen\n")
a <- c(5, 3, 6, NA)
a

writeLines("\n\tReturns a logical vector containing TRUE if the corresponding element in Y is NA and FALSE otherwise\n")
is.na(a)

writeLines("\n\tReturns the logical opposite of the vector above, i.e., a logical vector that is FALSE if the corresponding element in Y is NA and TRUE otherwise\n")
!is.na(a)

writeLines("\n\tReturns the elements in a that are not NA\n")
a[!is.na(a)]

writeLines("\n\tSimilar to above, but also returns the positions of the elements containing NAs in a\n")
na.exclude(a)

writeLines("\n\tCalculates the mean of a, but returns NA, because a contains NAs\n")
mean(a)

writeLines("\n\tCalculates the mean of a excluding NA entries\n")
mean(a, na.rm = TRUE)

writeLines("\n\tCreates a new vector conaining only the non-NA entries of a, saves it in d, and calculates its mean\n")
d <- na.exclude(a)
mean(d)

writeLines("\n\tReturns a 2x2 matrix containing the letters 'a', 'b', 'c' and 'd', filling the matrix by columns\n")
matrix(letters[1:4], ncol=2)

writeLines("\n\tCreates a 2x2 matrix containing the numbers frpoom 1 to 4, filling the matrix by columns, saves it in M, and then prints it on the screen\n")
M <- matrix(1:4, ncol=2)
M

writeLines("\n\tCreates a 2x2 matrix containing the numbers frpoom 1 to 4, filling the matrix by rows, saves it in M2, and then prints it on the screen\n")
M2 <- matrix(1:4, ncol=2, byrow = TRUE)
M2

writeLines("\n\tCreates a diagonal 2x2 matrix with every diagonal entry equal to 1, then prints it to the screen\n")
I <- diag(1, nrow = 2)
I

writeLines("\n\t Calculates the inverse of M and prints M times its inverse\n")
Minv <- solve(M)
M %*% Minv


writeLines("\n\tReturns the element from the first row and second column in M\n")
M[1, 2]

writeLines("\n\tReturns the elements from the first and second columns in the first row in M\n")
M[1, 1:2]

writeLines("\n\tReturns the second column of M\n")
M[, 2]

writeLines("\n\tReturns all rows and columns of M, i.e., returns M\n")
M[, ]

writeLines("\n\tCreates a data frame containing plant names, treatment types, height and width, stores it in dat and then prints it on the screen\n")
dat <- data.frame(species = c("S.altissima", "S.rugosa","E.graminifolia", "A. pilosus"),
                  treatment = factor(c("Control","Water", "Control", "Water")),
                  height = c(1.1,0.8, 0.9, 1), width = c(1, 1.7, 0.6, 0.2))
dat

writeLines("\n\tPrints the second entry in dat\n")
dat[, 2]

writeLines("\n\tPrints the fourth column (width) for the third entry in dat\n")
dat[3, 4]

writeLines("\n\tPrints a logical vector containing TRUE if the corresponding entry in dat has 'Water' in the second column and FALSE otherwise\n")
dat[, 2] == "Water"

writeLines("\n\tPrints only the entries of dat that have 'Water' in the second column\n")
dat[ dat[, 2] == "Water", ]

writeLines("\n\tDoes the same as above, but with a different function\n")
subset(dat, treatment == "Water")
