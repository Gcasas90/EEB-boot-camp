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

## Apply chisqure test on each row
chisqs=apply(snps,1,compute_chisquare)

## Extract the p-values for the tests
pvals=pchisq(chisqs,1,lower.tail=FALSE)

num_pval <- length(pvals)

print(paste(num_pval, "SNPs analyzed on the chi-square test"))

for (p in c(0.05, 0.01, 0.001))
{
    below_thr <- sum(pvals<p)
    proportion <- round(below_thr/num_pval, digits=4)
    print(paste0(Below_Thr, " SNPs have p-value under ", p, "(", proportion*100, "%)"))
}

exp_pvals <- rep(0, num_pval)

for(i in 1:num_pval)
{
    exp_pvals[i] <- i/num_pval
}

sort_pvals <- sort(pvals)

log_sort_pvals <- -log10(sort_pvals)
log_exp_pvals <- -log10(exp_pvals)

max_log_pval <- max(log_exp_pvals, log_sort_pvals)

plot(log_exp_pvals, log_sort_pvals,
     xlab = "-log10(expected P-value)",
     ylab = "-log10(observed P-value)",
     xlim = c(0, max_log_pval),
     ylim = c(0, max_log_pval),
     cex.lab = 1.5,
     cex.axis = 1.5)

abline(b = 1, a = 0,
       col = "red",
       lwd = 3,
       lty = 2)
