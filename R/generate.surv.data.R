generate.surv.data <-
function(n,                                 # vector with sample size for each group
                             rdist,         # charcter matrix with name of distribution to
                                            # generate data, rows for genes, columns for groups
                             dist.param1,   # first parameter of distribution
                             dist.param2,   # second parameter of distribution
                             slope.vec,     # expression = slope*log(surv.time) + error
                             event.rate,    # event rate for exponential distribution
                             min.max.fu)    # 2-vector with min & max follow-up (censor distribution is runif(min,max)
                       
{
   k<-1      # number of groups
   ngenes<-dim(rdist)[1] # number of genes
   # Generates error observations
   for (i in 1:k)  # Loop over groups
   {
      Y0<-matrix(NA,ngenes,n)  # Declare an expression matrix
      for (j in 1:ngenes)  # Loop over genes
      {
         call.obj<-call(rdist[j,i],n,dist.param1[j,i],dist.param2[j,i]) # Define a generic call to generate data for gene j, group k
         y<-eval(call.obj)  # evaluate the generic call
         Y0[j,]<-y          # Assign to gene j for group k
      }

      if (i==1) Y<-Y0      # Initialize expression matrix if group 1
      else Y<-cbind(Y,Y0)  # Otherwise Add it to the expression matrix
   }
   stime<-rexp(n,event.rate)                       # Generate survival time
   ctime<-runif(n,min.max.fu[1],min.max.fu[2])     # Generate censor time
   otime<-stime*(stime<=ctime)+ctime*(ctime<stime) # Generate observation time
   event<-(stime<=ctime)
   
   for (j in 1:ngenes) Y[j,]<-Y[j,]+slope.vec[j]*log(stime)
   
   ids<-paste("Y",1:n)    # Creates subject ids
   colnames(Y)<-ids                # Assign subject ids to Y
   

   grp.data<-data.frame(obs.time=otime,event=event)         # Put in a data frame
   rownames(grp.data)<-ids                                  # Assign subject IDs to group ID data frame
   meta.grp<-data.frame(labelDescription=c("Observation Time","Event Indicator"),   # Build meta data frame
                        row.names=c("obs.time","event"))

   adf<-new("AnnotatedDataFrame",data=grp.data,varMetadata=meta.grp)  # Create annotated data frame
   express.set<-new("ExpressionSet",exprs=Y,phenoData=adf)  # Put it all together in an expressionSet object
   
   return(express.set)  # return
}

