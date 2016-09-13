#!/usr/bin/env Rscript

##Creates the vector Y with the entries 8.3, 8.6, 10.7, 10.8, 11, 11, 11.1, 11.2, 11.3, 11.4
Y <- c(8.3, 8.6, 10.7, 10.8, 11, 11, 11.1, 11.2, 11.3, 11.4)

##Generates the sequence of integers from 1 to 4
1:4

##Generates the same sequence as above, but in reverse order
4:1

##Generates the sequence of integers from 1 to 3 and then takes minus each number
-(1:3)

##Generates an arithmetic progression starting in 1 and ending in 3 with a step of 0.2
seq(from = 1, to = 3, by = 0.2)

##Same as above, but naming less parameters
seq(1, 3, by = 0.2)

#Generates an arithmetic progression starting in 1 and ending in 3 containing exactly 7 items
seq(1, 3, length = 7)

##Generates a sequence of length three with all items equal to 1
rep(1, 3)

##Generates a sequence composed of the sequence 1, 2, 3 repeated twice, one after another
rep(1:3, 2)

##Generates a sequence composed of the numbers 1, 2 and 3, each number printed twice before the next one
rep(1:3, each = 2)

##Calculates the sum of the elements in Y
sum(Y)

##Calculates the mean of the elements in Y
mean(Y)

##Returns the largest element of Y
max(Y)

##Returns the length of Y
length(Y)

##Returns a summary containing the maximum, minimum, mean, median, 1st and 3rd quartiles
summary(Y)

##Creates and prints a vector containing the strings "Sarah" and "Yunluan"
Names <- c("Sarah", "Yunluan")
Names

##Creates and prints a vector containing logical values
b <- c(TRUE, FALSE)
b

##Returns the class of the elements in Y
class(Y)

##Returns the class of the elements in b
class(b)

##Creates a new vector containing for each position TRUE if the corresponding element in Y is larger than 10 and FALSE otherwise
Y > 10

##Creates a new vector containing for each position TRUE if the corresponding element in Y is larger than the mean of Y and FALSE otherwise
Y > mean(Y)

##Creates a new vector containing for each position TRUE if the corresponding element in Y is not equal to 11 and FALSE otherwise
Y != 11

##Creates the vectors a and b and then returns a new vector that contains in each position the sum of the corresponding elements from a and b
a <- 1:3
b <- 4:6
a + b

##Returns a new vector that contains in each position the product of the corresponding elements from a and b
a * b

##Returns a new vector that contains in each position the division of the corresponding element from a by the corresponding element from b
a / b

##Adds 1 to each element in a and returns the resulting vector
a + 1

##Multiplies each element in a by 2 and returns the resulting vector
a * 2

##Takes the inverse of each element in a and returns the resulting vector
1/a

##Extends the vector 1:2 to match the length of a and then multiplies the elements in each vector. Shows a warning
a * 1:2

##Does the same as above, but with no warning
a * c(1, 2, 1)

##Extends the vector 1:2 to match the length of 1:4 and then multiplies the elements in each vector. Doesn't show a warning because the length of the longer vector is a multiple of the length of the smaller vector
1:4 * 1:2

##Returns the first element in Y
Y[1]

##Returns the first, second and third elements in Y
Y[1:3]

##Returns all elements in Y greater than the mean of Y
Y[Y > mean(Y)]

##Creatas the array a containing integers and one NA, saes it in a, and then prints it to the screen
a <- c(5, 3, 6, NA)
a

##Returns a logical vector containing TRUE if the corresponding element in Y is NA and FALSE otherwise
is.na(a)

##Returns the logical opposite of the vector above, i.e., a logical vector that is FALSE if the corresponding element in Y is NA and TRUE otherwise
!is.na(a)

##Returns the elements in a that are not NA
a[!is.na(a)]

##Similar to above, but also returns the positions of the elements containing NAs in a
na.exclude(a)

##Calculates the mean of a, but returns NA, because a contains NAs
mean(a)

##Calculates the mean of a excluding NA entries
mean(a, na.rm = TRUE)

##Creates a new vector conaining only the non-NA entries of a, saves it in d, and calculates its mean
d <- na.exclude(a)
mean(d)

##Returns a 2x2 matrix containing the letters 'a', 'b', 'c' and 'd', filling the matrix by columns
matrix(letters[1:4], ncol=2)

##Creates a 2x2 matrix containing the numbers frpoom 1 to 4, filling the matrix by columns, saves it in M, and then prints it on the screen
M <- matrix(1:4, ncol=2)
M

##Creates a 2x2 matrix containing the numbers frpoom 1 to 4, filling the matrix by rows, saves it in M2, and then prints it on the screen
M2 <- matrix(1:4, ncol=2, byrow = TRUE)
M2

##Creates a diagonal 2x2 matrix with every diagonal entry equal to 1, then prints it to the screen
I <- diag(1, nrow = 2)
I

## Calculates the inverse of M and prints M times its inverse
Minv <- solve(M)
M %*% Minv


##Returns the element from the first row and second column in M
M[1, 2]

##Returns the elements from the first and second columns in the first row in M
M[1, 1:2]

##Returns the second column of M
M[, 2]

##Returns all rows and columns of M, i.e., returns M
M[, ]

##Creates a data frame containing plant names, treatment types, height and width, stores it in dat and then prints it on the screen
dat <- data.frame(species = c("S.altissima", "S.rugosa","E.graminifolia", "A. pilosus"),
                  treatment = factor(c("Control","Water", "Control", "Water")),
                  height = c(1.1,0.8, 0.9, 1), width = c(1, 1.7, 0.6, 0.2))
dat

##Prints the second entry in dat
dat[, 2]

##Prints the fourth column (width) for the third entry in dat
dat[3, 4]

##Prints a logical vector containing TRUE if the corresponding entry in dat has 'Water' in the second column and FALSE otherwise
dat[, 2] == "Water"

##Prints only the entries of dat that have "Water" in the second column
dat[ dat[, 2] == "Water", ]

##Does the same as above, but with a different function
subset(dat, treatment == "Water")
