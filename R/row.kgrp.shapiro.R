row.kgrp.shapiro <-
function(Y,x)   # Y is expression matrix, x is vector of group labels

{
   ugrp<-unique(x)
   ngrp<-length(ugrp)
   Z<-Y
   for (i in 1:ngrp)
   {
       temp<-Y[,x==ugrp[i]]
       mn<-rowMeans(temp)
       s<-apply(temp,1,sd)
       Z[,x==ugrp[i]]<-(temp-mn)/s
   }
   tres<-apply(Z,1,shapiro.test2)
   ebp.res<-grenander.ebp(tres[2,])
   res0<-t(tres)
   res<-cbind.data.frame(stat=res0[,1],pval=res0[,2],ebp=ebp.res$ebp)
   return(res)
}

