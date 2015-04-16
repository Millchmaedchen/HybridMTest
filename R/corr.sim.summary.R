corr.sim.summary <-
function(sim.res.obj,    # A simulation result object
                           ebp.alpha=0.1)  # The ebp cut-off
 {
   k<-length(sim.res.obj)
   ngenes<-dim(sim.res.obj$rdist)[1]
   pr.reject<-matrix(NA,ngenes,k-6)
   true.null<-(sim.res.obj$slope==0)

   auc<-fdr<-rep(NA,k-6)
   for (i in 1:(k-6))
   {
      rej<-(sim.res.obj[[6+i]]<=ebp.alpha)
      pr.reject[,i]<-rowMeans(rej)
      top<-colSums(rej[true.null,])
      bot<-colSums(rej)
      bot[bot==0]<-1    # If no rejections, define denominator as 1 so that FDR=0 as in Benjamini & Hochberg 1995
      fdr[i]<-mean(top/bot)
      auc[i]<-compute.sim.auc(sim.res.obj[[6+i]],true.null)
   }
   obj.names<-names(sim.res.obj)
   mtx.names<-as.character(obj.names[6+(1:(k-6))])
   names(auc)<-names(fdr)<-mtx.names
   colnames(pr.reject)<-mtx.names
   gene.lbl0<-matrix(paste(round(sim.res.obj$slope,1),"x + ",sim.res.obj$rdist,"(",sim.res.obj$dist.param1,",",
                    sim.res.obj$dist.param2,")",sep=""),ncol=dim(sim.res.obj$rdist)[2])

   gene.lbl1<-gene.lbl0[,1]
   if (dim(sim.res.obj$rdist)[2]>1)
   for (i in 2:(dim(sim.res.obj$rdist)[2])) gene.lbl1<-paste(gene.lbl1,gene.lbl0[,i],sep="_")

   rownames(pr.reject)<-gene.lbl1
   uniq.gene.lbl<-unique(gene.lbl1)
   nuniq<-length(uniq.gene.lbl)
   pr.rej.summary<-matrix(NA,nuniq,dim(pr.reject)[2])
    
   for (i in 1:nuniq)
   {
      gene.mtch<-is.element(gene.lbl1,uniq.gene.lbl[i])
      nmtch<-sum(gene.mtch)
      pr.rj.mtx<-matrix(pr.reject[gene.mtch,],nmtch)
      pr.rej.summary[i,]<-colMeans(pr.rj.mtx)
   }
   if (any(!true.null))   sim.power<-colMeans(pr.reject[!true.null,])
   else sim.power<-NA
   if (any(true.null)) sim.level<-colMeans(pr.reject[true.null,])
   else sim.level<-NA
   rownames(pr.rej.summary)<-uniq.gene.lbl
   colnames(pr.rej.summary)<-colnames(pr.reject)
   
   res<-list(test.specs=sim.res.obj$test.specs,
             ebp.def=sim.res.obj$ebp.def,
             rdist=sim.res.obj$rdist,
             dist.param1=sim.res.obj$dist.param1,
             dist.param2=sim.res.obj$dist.param2,
             ebp.alpha=ebp.alpha,pr.reject=pr.reject,
             true.null=true.null,pr.rej.summary=pr.rej.summary,
             sim.power=sim.power,sim.level=sim.level,sim.fdr=fdr,sim.auc=auc)
   return(res)
}

