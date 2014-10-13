row.slr.resids <-
function(Y,x)
{
   X<-cbind(1,x)
   xtx<-t(X)%*%X
   xtx.inv<-ginv(xtx)
   H<-X%*%xtx.inv%*%t(X)
   n<-dim(X)[1]
   I.mtx<-diag(n)
   tres<-(I.mtx-H)%*%t(Y)
   res<-t(tres)
   return(res)
}

