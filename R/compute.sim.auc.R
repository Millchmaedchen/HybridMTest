compute.sim.auc <-
function(ebp.mtx,true.null)
{
    n.null<-sum(true.null)
   n.alt<-sum(!true.null)
   if ((n.null==0)||(n.alt==0)) return(NA)
   nreps<-dim(ebp.mtx)[2]
   ngenes<-dim(ebp.mtx)[1]
   auc<-rep(NA,nreps)
   for (i in 1:nreps)
   {
      ord<-order(ebp.mtx[,i])
      p.null<-cumsum(true.null[ord])/n.null
      p.alt<-cumsum(!true.null[ord])/n.alt
      p.alt.trap<-(p.alt[1:(ngenes-1)]+p.alt[2:ngenes])/2
      p.null.diff<-diff(p.null)
      auc[i]<-sum(p.alt.trap*p.null.diff) 
   }
   return(mean(auc))
}

