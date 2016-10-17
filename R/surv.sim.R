surv.sim <-
function(n.grp,        # Vector with number of subjects per group
                   rdist,        # rdist matrix
                   dist.param1,  # dist.param1
                   dist.param2,  # dist.param2
                   slope,
                   event.rate,
                   min.max.fu,  
                   test.specs,
                   ebp.def,
                   keep.res,     # names of result items to keep
                   nreps=10)
                   
{
   # Initialize result list
   res<-vector("list",8+length(keep.res))
   names(res)<-c("test.specs","ebp.def","slope","event.rate","min.max.fu","rdist","dist.param1","dist.param2",keep.res)
   res$test.specs<-test.specs
   res$ebp.def<-ebp.def
   res$rdist<-rdist
   res$dist.param1<-dist.param1
   res$dist.param2<-dist.param2
   res$slope<-slope
   res$event.rate<-event.rate
   res$min.max.fu<-min.max.fu
   ngenes<-max(dim(rdist)[1],dim(dist.param1)[1],dim(dist.param2)[1])
   for (i in 8+1:length(keep.res))  res[[i]]<-matrix(NA,ngenes,nreps)
       # Now perform simulation
   for (i in 1:nreps)  # Loop over sim reps
   {
      ex.set<-generate.surv.data(n.grp,rdist,dist.param1,dist.param2,slope,event.rate,min.max.fu) # Generate a data set
      sim.res<-hybrid.test(ex.set,test.specs,ebp.def)    # Apply the method
      for (j in 1:length(keep.res))  # Store results in result list object
      {
         res[[keep.res[j]]][,i]<-sim.res[,keep.res[j]]
      }  
   }
   return(res)  # Return results
}

