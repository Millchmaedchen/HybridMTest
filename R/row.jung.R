row.jung <-
function (x, time.cens, strat = NULL) 
{
    if (is.null(strat)) 
        strat <- rep(1, dim(time.cens)[1])
    ustrat <- unique(strat)
    nstrat <- length(ustrat)
    zstat.sum <- 0
    sum.n <- 0
    for (i in 1:nstrat) {
        this.strat <- (strat == ustrat[i])
        this.x <- x[, this.strat]
        this.n <- sum(this.strat)
        this.time.cens <- time.cens[this.strat, ]
        time <- this.time.cens[, 1]
        cens <- this.time.cens[, 2]
        miss.tc <- is.na(time) | is.na(cens)
        time <- time[!miss.tc]
        cens <- cens[!miss.tc]
        this.x <- this.x[, !miss.tc]
        miss.this.x <- is.na(this.x)
        tR <- apply(this.x, 1, rank)
        R <- t(tR)
        n <- length(time)
        Y <- matrix(0, n, n)
        for (i in 1:n) {
            ind <- (time >= time[i])
            Y[i, ] <- ind/sum(ind)
        }
        I.Y <- diag(1, n) - Y
        s <- t(I.Y) %*% cens
        mn.s <- mean(s)
        sd.s <- sd(s)
        s.cnt <- (s - mn.s)/sd.s
        mn.R <- (n + 1)/2
        sd.R <- sd(1:n)
        cnt.R <- (R - mn.R)/sd.R
        n <- rowSums(!miss.this.x)
        cnt.R[miss.this.x] <- 0
        res <- as.vector((cnt.R %*% s.cnt)/n)
        zstat<-0.5*(log(1+res)-log(1-res))*sqrt((n-3)/1.06)
        zstat.sum <- zstat.sum + zstat
        sum.n <- sum.n + this.n
    }
    zstat.final<-zstat.sum/sqrt(nstrat)
    pval<-2-2*pnorm(abs(zstat.final))
    ebp.res<-grenander.ebp(pval)
    res<-cbind.data.frame(stat=zstat.final,pval=pval,ebp=ebp.res$ebp)
    return(res)
}

