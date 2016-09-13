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
