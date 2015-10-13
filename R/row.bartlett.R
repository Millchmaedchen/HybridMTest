row.bartlett <-
function(Y,  # Expression matrix
                   x)  # a vector of group labels
{
   tres<-apply(Y,1,bartlett.test2,x)
   ebp.res<-grenander.ebp(tres[2,])
   res0<-t(tres)
   res<-cbind.data.frame(stat=res0[,1],pval=res0[,2],ebp=ebp.res$ebp)
   return(res)
}

