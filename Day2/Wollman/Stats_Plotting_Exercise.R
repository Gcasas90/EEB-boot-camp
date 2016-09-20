#!/usr/bin/env Rscript

data <- ChickWeight

diet_num <- length(unique(data$Diet))
colors <- rainbow(diet_num)

## Make the boxplot for the weight of the chicks for each diet
data_day0<- data[data$Time == 0,]

pdf("Weight_Diet_Day0_boxplot.pdf")

boxplot(weight~Diet,
     data=data_day0,
     main="Day 0 - Weight~Diet",
     xlab="Diet",
     ylab="Weight",
     col=colors,
     las=1,
     cex.axis=1.5,
     cex.lab=1.5)

dev.off()

# run an ANOVA
anova1=aov(data_day0$weight~data_day0$Diet)
summary(anova1)
TukeyHSD(anova1)

## Make the boxplot for the weight of the chicks for each diet
data_day21 <- data[data$Time == 21,]

pdf("Weight_Diet_Day21_boxplot.pdf")

boxplot(weight~Diet,
     data=data_day21,
     main="Day 21 - Weight~Diet",
     xlab="Diet",
     ylab="Weight",
     col=colors,
     las=1,
     cex.axis=1.5,
     cex.lab=1.5)

dev.off()

# run an ANOVA
anova2=aov(data_day21$weight~data_day21$Diet)
summary(anova2)
TukeyHSD(anova2)


summary(aov(weight ~ Diet*Time + Error(Chick), data=data))

## Plot effects of diet on chick growth
data_diet1 <- data[data$Diet == 1,]
data_diet2 <- data[data$Diet == 2,]
data_diet3 <- data[data$Diet == 3,]
data_diet4 <- data[data$Diet == 4,]

min_weight <- min(data$weight)
max_weight <- max(data$weight)

min_Time <- min(data$Time)
max_Time <- max(data$Time)

pdf("Chick_Growth_by_Diet.pdf")

plot(data_diet1$Time,
     data_diet1$weight,
     main = "Chick growth by diet",
     xlab = "Time",
     ylab = "Weight",
     xlim = c(min_Time, max_Time),
     ylim = c(min_weight, max_weight),
     col=colors[1],
     cex.lab = 1.5,
     cex.axis = 1.5)

abline(lm(weight ~ Time, data=data_diet1),
       col=colors[1])

points(data_diet2$Time,
       data_diet2$weight,
       col=colors[2])

abline(lm(weight ~ Time, data=data_diet2),
       col=colors[2])

points(data_diet3$Time,
       data_diet3$weight,
       col=colors[3])

abline(lm(weight ~ Time, data=data_diet3),
       col=colors[3])

points(data_diet4$Time,
       data_diet4$weight,
       col=colors[4])

abline(lm(weight ~ Time, data=data_diet4),
       col=colors[4])

legend("topleft",
       legend = c("Diet 1", "Diet 2", "Diet 3", "Diet 4"),
       col = colors,
       pch = 1,
       bty = "o",
       cex = 1.5)

dev.off()

##Plot individual chick growth
pdf("Individual_Chick_Growth.pdf")

plot(data$Time,
     data$weight,
     main = "Individual chick growth",
     xlab = "Time",
     ylab = "weight",
     cex.lab = 1.5,
     cex.axis = 1.5)

Chick_Colors <- rainbow(50)

for (i in 1:50)
{
    data_chick <- data[data$Chick == i,]
    points(data_chick$Time,
           data_chick$weight,
           col = Chick_Colors[i])

}

dev.off()
