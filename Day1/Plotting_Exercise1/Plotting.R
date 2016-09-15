#!/usr/bin/env Rscript

get_heights <- function(n)
{
    heights <- rnorm(n, mean = 69, sd = 10)
    mean_height <- mean(heights)
    return(mean_height)
}

mean_heights_100 <- rep(0, 1000)
mean_heights_1000 <- rep(0, 1000)

for (i in 1:1000)
{
    mean_heights_100[i] <- get_heights(100)
    mean_heights_1000[i] <- get_heights(1000)
}

Maximum <- ceiling(max(max(mean_heights_100), max(mean_heights_1000)))
Minimum <- floor(min(min(mean_heights_100), min(mean_heights_1000)))

bins <- seq(Minimum, Maximum, by = 0.5)

Counts_100 <- hist(mean_heights_100, breaks = bins)$counts
Counts_1000 <- hist(mean_heights_1000, breaks = bins)$counts

pdf(file = "Heights_barplot.pdf",
    width = 6,
    height = 6)

par(mfrow = c(1, 1),
    mar = c(4, 4, 3, 2))

barplot(rbind(Counts_100, Counts_1000),
       col = c(2, 4),
       beside = TRUE,
       names.arg = bins[1:length(bins)-1],
       xlab = "Value",
       ylab = "Mean height")

legend("topright",
       c("Sample size = 100", "Sample size = 1000"),
       lwd = 4,
       col = c(2, 4))

dev.off()
