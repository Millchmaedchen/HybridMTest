row.oneway.anova <-
function(Y,grplbl)
{
  ugrps<-unique(grplbl)
  ngrps<-length(ugrps) #number of groups
  ngenes<-dim(Y)[1]
  GrandM<-rowMeans(Y)   # overall mean

  SST<-rowSums((Y-GrandM)^2) # total sum of squares for each gene
  
  grp.mean<-matrix(NA,ngenes,ngrps)  # group mean matrix, rows for genes, each column for a different group
  grp.SSW<-matrix(NA,ngenes,ngrps)  # within-group sums of squares for each gene
  n<-rep(NA,ngrps)  # vector with group-specific sample sizes
  for (i in 1:ngrps)
  {
     grp.mtch<-(grplbl==ugrps[i])
     n[i]<-sum(grp.mtch)
     grp.mean[,i]<-rowMeans(Y[,grp.mtch])
     grp.SSW[,i]<-rowSums((Y[,grp.mtch]-grp.mean[,i])^2)
  }
  
  df1<-(ngrps-1)
  df2<-sum(n)-df1-1
  
  SSW<-rowSums(grp.SSW)
  SSB<-SST-SSW
  MSE<-SSW/df2
  MSB<-SSB/df1
  
  F.stat<-MSB/MSE
  pval<-1-pf(F.stat,df1,df2)

  ebp<-grenander.ebp(unlist(pval))
  res<-cbind.data.frame(stat=F.stat,pval=pval,ebp=ebp$ebp)
   return(res)
 }

