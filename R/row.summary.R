row.summary <-
function(Y,x)  # Y = expression matrix, x = vector of group labels

{
  x<-as.character(x)
  ugrp<-unique(x)
  #print(ugrp)
  ngrp<-length(ugrp)
  for (i in 1:ngrp)
  {
     grp.mtch<-is.element(x,ugrp[i])
     Y.grp<-as.matrix(Y[,grp.mtch])
     #print(Y.grp)
     grp.num<-rowSums(!is.na(Y.grp))
     grp.mean<-rowMeans(Y.grp,na.rm=TRUE)
     grp.sd<-sqrt(rowSums((Y.grp-grp.mean)^2,na.rm=TRUE)/(grp.num-1))
     grp.res<-cbind.data.frame(grp.mean,grp.sd)
     names(grp.res)<-paste(ugrp[i],c(".mean",".stdev"),sep="")
     if (i==1) res<-grp.res
     else res<-cbind.data.frame(res,grp.res)
  }
  return(res)
}

