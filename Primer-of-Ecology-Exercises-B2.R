#!/usr/bin/env Rscript

writeLines("\n\tAssigns the result of the operation 2+3 and prints it on the screen\n")
a <- 2 + 3
a

writeLines("\n\tAssigns the value of a+a to the variable b, then prints the values of a+a and of a+b \n")
b <- a + a
a + a; b + a
