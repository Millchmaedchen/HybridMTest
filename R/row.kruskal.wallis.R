row.kruskal.wallis <-
function(Y,grplbl)
{
  ngenes<-dim(Y)[1]
  ugrps<-unique(grplbl)
  ngrps<-length(ugrps) #number of groups
  T.mtx<-matrix(NA,ngenes,ngrps)  # will store average rank for each group for each gene
  n<-rep(NA,ngrps)                # sample size for each group
  tR<-apply(Y,1,rank)
  Yrank<-t(tR)
  for (i in 1:ngrps)   # compute sample size & average rank for each group
  {
     grp.mtch<-(grplbl==ugrps[i])
     n[i]<-sum(grp.mtch)
     T.mtx[,i]<-rowMeans(Yrank[,grp.mtch])
  }
  N<-sum(n)
  k<-12/(N*(N+1))
  H.stat<-k*(T.mtx-(N+1)/2)^2%*%n
  pval<-1-pchisq(H.stat,ngrps-1)
  gren.res<-grenander.ebp(unlist(pval))
  res<-cbind.data.frame(stat=H.stat,pval=pval,ebp=gren.res$ebp)
  return(res)
}

