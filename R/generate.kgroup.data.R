generate.kgroup.data <-
function(n.grp,         # vector with sample size for each group
                               rdist,         # charcter matrix with name of distribution 
                                              #to generate data, rows for genes, columns for groups
                               dist.param1,   # first parameter of distribution
                               dist.param2)   # second parameter of distribution
  {
   k<-length(n.grp)      # number of groups
   ngenes<-dim(rdist)[1] # number of genes
   for (i in 1:k)  # Loop over groups
   {
      Y0<-matrix(NA,ngenes,n.grp[i])  # Declare an expression matrix
      for (j in 1:ngenes)  # Loop over genes
      {
         call.obj<-call(rdist[j,i],n.grp[i],dist.param1[j,i],dist.param2[j,i])  # Define a
                                                                       # generic call to generate data for gene j, group k
         y<-eval(call.obj)  # evaluate the generic call
         Y0[j,]<-y          # Assign to gene j for group k
      }

      if (i==1) Y<-Y0      # Initialize expression matrix if group 1
      else Y<-cbind(Y,Y0)  # Otherwise Add it to the expression matrix
   }
   ids<-paste("Y",1:sum(n.grp))    # Creates subject ids
   colnames(Y)<-ids                # Assign subject ids to Y
   
   grp<-paste("grp",rep(1:length(n.grp),n.grp),sep="")      # Create group ids
   grp.data<-data.frame(grp=grp)                            # Put in a data frame
   rownames(grp.data)<-ids                                  # Assign subject IDs to group ID data frame
   meta.grp<-data.frame(labelDescription="group",           # Build meta data frame
                        row.names="grp")

   adf<-new("AnnotatedDataFrame",data=grp.data,varMetadata=meta.grp)  # Create annotated data frame
   express.set<-new("ExpressionSet",exprs=Y,phenoData=adf)  # Put it all together in an expressionSet object
   
   return(express.set)  # return
}

