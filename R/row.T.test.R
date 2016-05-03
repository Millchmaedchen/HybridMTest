row.T.test <-
function(Y,        # Expression matrix, rows for genes, columns for experimental units
                 grplbl,   # vector of group labels, must have same number of items and columns of Y
                 eq.var=FALSE) # option to indicate whether to assume equal variance between two groups or not

{
    ugrp<-unique(grplbl)
    ngrp<-length(ugrp)
    if (ngrp!=2) stop("Error in row.ttest: Valid for exactly 2-groups only.")
    grp1<-(grplbl==ugrp[1])
    grp2<-(grplbl==ugrp[2])
    n1<-sum(grp1)
    n2<-sum(grp2)
    Y1<-Y[,grp1]
    Y2<-Y[,grp2]
    mn1<-rowMeans(Y1,na.rm=TRUE)
    mn2<-rowMeans(Y2,na.rm=TRUE)
    
    sd1<-apply(Y1,1,sd)
    sd2<-apply(Y2,1,sd)
     if (!eq.var)
    {
      tstat<-(mn2-mn1)/sqrt(sd1^2/n1+sd2^2/n2)
      deg.free<-(sd1^2/n1+sd2^2/n2)^2/
                 ((sd1^2/n1)^2/(n1-1)+(sd2^2/n2)^2/(n2-1))
    }
    else
    {
      sp<-sqrt(((n1-1)*sd1^2+(n2-1)*sd2^2)/(n1+n2-2))
      tstat<-(mn2-mn1)/sqrt(sp^2*((1/n1)+(1/n2)))
      deg.free<-n1+n2-2
    }
    pval<-2-2*pt(abs(tstat),deg.free)
    ebp.res<-grenander.ebp(pval)
    res<-cbind.data.frame(stat=tstat,pval=pval,ebp=ebp.res$ebp)
    return(res)
}

