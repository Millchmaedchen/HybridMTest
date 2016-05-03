row.spearman <-
function(Y,x)
{
  n<-dim(Y)[2]
  x<-rank(x)
  mnx<-mean(x)
  X<-x-mnx
  sdX<-sd(X)
  X<-X/(sdX*sqrt(n-1))
  tY<-apply(Y,1,rank)
  Y<-t(tY)
  mnY<-rowMeans(Y)
  Y<-Y-mnY
  rowYsd<-sqrt(rowSums(Y^2))
  Y<-Y/rowYsd
  rs<-Y%*%X
  t<-(rs*sqrt(n-2))/sqrt(1-rs^2)
  pval<-2-2*pt(abs(t), n-2,lower.tail = TRUE)
  ebp.res<-grenander.ebp(pval)
  res<-cbind.data.frame(stat=rs,pval=pval,ebp=ebp.res$ebp)
  return(res)
}

