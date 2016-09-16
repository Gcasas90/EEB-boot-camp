#!/usr/bin/env Rscript

compute_chisquare=function(x){
        freq=sum(x,na.rm=TRUE)/(2.0*sum(!is.na(x)))
        cnt0=sum(x==0,na.rm=TRUE)
        cnt1=sum(x==1,na.rm=TRUE)
        cnt2=sum(x==2,na.rm=TRUE)
        obscnts=c(cnt0,cnt1,cnt2)
        #print(obscnts)
        n=sum(obscnts)
        expcnts=c((1-freq)^2,2*freq*(1-freq),freq^2)*n
        chisq=sum((obscnts-expcnts)^2/expcnts)
        return(chisq)
}

## Read SNPs file
snpsDataFrame=read.table('hapmap_CEU_r23a_chr2_ld-1.txt',header=TRUE)
snps=as.matrix(snpsDataFrame)

## Perform chisquare analysis and extract pvalues (1a)
chisqs=apply(snps,1,compute_chisquare)
pvals=pchisq(chisqs,1,lower.tail=FALSE)

## Find the number of SNPs analyzed (1c)
num_pval <- length(pvals)

print(paste(num_pval, "SNPs analyzed on the chi-square test"))

## Print number and proportion of SNPs under 0.05, 0.01 and 0.001 thresholds (1b)

for (p in c(0.05, 0.01, 0.001))
{
    below_thr <- sum(pvals<p)
    proportion <- round(below_thr/num_pval, digits=4)
    print(paste0(Below_Thr, " SNPs have p-value under ", p, "(", proportion*100, "%)"))
}

## Calculate the expected pvalues (1d)

exp_pvals <- rep(0, num_pval)

for(i in 1:num_pval)
{
    exp_pvals[i] <- i/num_pval
}

## Sort the observed p-values (1e)
sort_pvals <- sort(pvals)

## Calculating -log10 of p-values (1f)
log_sort_pvals <- -log10(sort_pvals)
log_exp_pvals <- -log10(exp_pvals)

## Find the maximum -log10 p-value for window size adjustments
max_log_pval <- max(log_exp_pvals, log_sort_pvals)

pdf(file = "QQ_plot.pdf",
    width = 6,
    height = 6)

par(mfrow = c(1,1),
    mar = c(4, 4, 3, 2))

## Plot the QQ-plot (1g)
plot(log_exp_pvals, log_sort_pvals,
     xlab = "-log10(expected P-value)",
     ylab = "-log10(observed P-value)",
     xlim = c(0, max_log_pval),
     ylim = c(0, max_log_pval),
     cex.lab = 1.5,
     cex.axis = 1.5)

## Plot the diagonal line (1h)
abline(b = 1, a = 0,
       col = "red",
       lwd = 3,
       lty = 2)

dev.off()

## Loads the glucose phenotypes into R (2a)
zz <- read.table("pheno.sim.2014-1.txt", header=TRUE)
glucose <- zz$glucose_mmolperL

## Prints the 25% and 75% quantiles (2b and 2c)
print(paste("25% of individuals have glucose levels under", quantile(glucose, 0.25)))
print(paste("25% of individuals have glucose levels above", quantile(glucose, 0.75)))

## Prints the density plot with the vertical quantile lines (2d)
pdf(file = "Glucose_density.pdf",
    width = 6,
    height = 6)

par(mfrow = c(1,1),
    mar = c(4, 4, 3, 2))

plot(density(glucose),
     lwd = 3,
     xlab = "Glucose levels (mmol/L)",
     main = "Glucose levels distribution")

abline(v = quantile(glucose, 0.25),
       lty = 2,
       lwd = 3)
abline(v = quantile(glucose, 0.75),
       lty = 2,
       lwd = 3)

dev.off()
