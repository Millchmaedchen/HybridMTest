ranksum.test <-
function(y,grplbl)  # y is a vector of observations, x is a vector of group labels
{
   ugrp<-unique(grplbl)
   ngrp<-length(ugrp)
   if (ngrp!=2) stop("Error: Rank-Sum Test Valid for Exactly 2 groups.")
   x1<-y[grplbl==ugrp[1]]
   x2<-y[grplbl==ugrp[2]]
   res<-wilcox.test(x1,x2)
   return(c(stat=res$statistic,pval=res$p.value))
}

