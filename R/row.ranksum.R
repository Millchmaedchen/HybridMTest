row.ranksum <-
function(Y,x)  # Y is expression matrix, x is vector of group labels

{
   tres<-apply(Y,1,ranksum.test,x)
   ebp.res<-grenander.ebp(tres[2,])
   res0<-t(tres)
   res<-cbind.data.frame(stat=res0[,1],pval=res0[,2],ebp=ebp.res$ebp)
   return(res)
}

