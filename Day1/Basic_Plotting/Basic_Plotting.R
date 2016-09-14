#!/usr/bin/env Rscript

## Samples 1000 values from a normal distribution with mean 0 and standard deviation 1
s1 <- rnorm(1000, mean = 0, sd = 1)

## Samples 1000 values from a normal distribution with mean 0 and standard deviation 3
s3 <- rnorm(1000, mean = 0, sd = 3)

## Plots the histograms of s1 and s3 in a single panel and saves them to a file
pdf(file = "Normal_hist.pdf",
    width = 4,
    height = 7)

par(mfrow = c(2, 1),
    mar = c(4, 4, 3, 2)) # Sets ploting area and margins

hist(s1,
     col = 2,
     xlab = "Value",
     main = expression(paste(sigma, " = 1")))
hist(s3,
     col = 4,
     xlab = "Value",
     main = expression(paste(sigma, " = 3")))

dev.off()

## Plots a smooth density  graph for both distributions
pdf(file = "Normal_density.pdf",
    width = 6,
    height = 6)

par(mfrow = c(1,1),
    mar = c(4, 4, 3, 2))

plot(density(s1),
     col = 2,
     lwd = 4,
     xlab = "Value",
     xlim = c(-15, 15),
     main = "Normal distribution")

lines(density(s3),
      col = 4,
      lwd = 4)

legend(-15, 0.4,
       c(expression(paste(sigma, " = 1")), expression(paste(sigma, " = 3"))),
       lwd = 4,
       col = c(2, 4),
       cex = 1.5)

## Adds the 0.9 quantile for each distribution
abline(v = quantile(s1, 0.9),
       lty = 2,
       lwd = 3,
       col = 2)
abline(v = quantile(s3, 0.9),
       lty = 2,
       lwd = 3,
       col = 4)

dev.off()

## Creates a box plot for the two distributions
pdf(file = "Normal_boxplot.pdf",
    width = 6,
    height = 6)

par(mfrow = c(1, 1),
    mar = c(4, 4, 3, 2))

boxplot(cbind(s1, s3),
        names = c(expression(paste(sigma, " = 1")), expression(paste(sigma, " = 3"))),
        main = "Draws from normal distribution",
        col = c(2, 4))

dev.off()

## Creats a histogram with both random variables

Maximum <- ceiling(max(max(s1), max(s3)))
Minimum <- floor(min(min(s1), min(s3)))

bins <- seq(Minimum, Maximum, by = 0.5)

Counts_s1 <- hist(s1, breaks = bins)$counts
Counts_s3 <- hist(s3, breaks = bins)$counts

pdf(file = "Normal_barplot.pdf",
    width = 6,
    height = 6)

par(mfrow = c(1, 1),
    mar = c(4, 4, 3, 2))

barplot(rbind(Counts_s1, Counts_s3),
       col = c(2, 4),
       beside = TRUE,
       names.arg = bins[1:length(bins)-1],
       xlab = "Value",
       ylab = "Count")

legend(6, 350,
       c(expression(paste(sigma, " = 1")), expression(paste(sigma, " = 3"))),
       lwd = 4,
       col = c(2, 4))

dev.off()
