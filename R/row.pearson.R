row.pearson <-
function(Y,x)  # Y = expression matrix, x = vector
{
  n<-dim(Y)[2]
  mnx<-mean(x)
  x<-x-mnx
  sdx<-sd(x)
  x<-x/(sdx*sqrt(n-1))
  mnY<-rowMeans(Y)
  Y<-Y-mnY
  Y<-as.matrix(Y)
  rowYsd<-sqrt(rowSums(Y^2))
  Y<-Y/rowYsd
  rp<-Y%*%x #Pearson correlation
  t<-(rp*sqrt(n-2))/sqrt(1-rp^2)
  pval<-2-2*pt(abs(t), n-2,lower.tail = TRUE)
  ebp.res<-grenander.ebp(pval)
  res<-cbind.data.frame(stat=rp,pval=pval,ebp=ebp.res$ebp)
  return(res)
}

