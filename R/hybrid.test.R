hybrid.test<-function(express.set,          # A Bioconductor expression set object
                      test.specs,           # A data frame with columns label, test.func, x, and opts
                      ebp.def=NULL)         # a data frame with columns wght and mthd


{
    Y<-exprs(express.set)       # Extract expression data from express.set
    pheno<-pData(express.set)   # Extract phenotype data from express.set
    ntest<-dim(test.specs)[1]   # determine number of tests to perform
    fin.res<-NULL               # initialize final result
    for (i in 1:ntest)          # Loop over the statistical tests to be performed
    {
       x.list<-unlist(strsplit(as.character(test.specs$x[i]),split=","))  # extract x arguments
       x<-pheno[,x.list]  # create phenotype matrix
       opts.str<-""
       if (test.specs$opts[i]!="") opts.str<-paste(",",test.specs$opts[i],sep="")  # create an options string
       call.str<-paste("call('",
                       test.specs$func.name[i],
                       "',Y,x",
                       opts.str,
                       ")",sep="")  # Generate the command string to call a function
       parse.res<-parse(text=call.str)  # create object to parse the command string
       eval.res1<-eval(parse.res)       # evaluate the expression to parse the command string
       eval.res2<-eval(eval.res1)       # evaluate the expression defined by the command string
       names(eval.res2)<-paste(test.specs$label[i],names(eval.res2),sep=".") # append the label to the front of the result matrix
       if (i==1) fin.res<-eval.res2                                          # add results to the final result data frame 
       else fin.res<-cbind.data.frame(fin.res,eval.res2)
    }

    if (!is.null(ebp.def))   # if the final ebp was defined, evaluate it and add it to the results
    {
        final.ebp.def<-paste(paste(ebp.def$wght,ebp.def$mthd,sep="*"),collapse="+")
        attach(fin.res)                       # lets me use the variable names in creating commands
        ebp.parse<-parse(text=final.ebp.def)  # create a command string, interpret, and execute it
        ebp.res1<-eval(ebp.parse)             # evaluate the expression to parse the command string
        ebp.res2<-eval(ebp.res1)              # evaluate the command string to compute the ebp
        best.pval<-get.best.pvals(fin.res,ebp.def) # Pick the p-value from the best test based on assumption evaluation for each gene
        best.gren<-grenander.ebp(best.pval)        # Compute EBP using "best-test" p-value from each gene
        best.ebp<-best.gren$ebp.null               
        fin.res<-cbind.data.frame(fin.res,wgt.mean.ebp=ebp.res2,
                                  best.pval=best.pval,
                                  best.ebp=best.ebp)  # add the result to the final result data frame
        detach(fin.res)
    }
    return(fin.res)
}

get.best.pvals<-function(fin.res,ebp.def)

{
   n.method<-dim(ebp.def)[1]
   n.genes<-dim(fin.res)[1]
   W<-matrix(NA,n.genes,n.method)
   P<-matrix(NA,n.genes,n.method)
   attach(fin.res)
   for (i in 1:n.method)
   {
      wght.parse<-parse(text=as.character(ebp.def$wght[i]))
      wght.res<-eval(wght.parse)
      W[,i]<-wght.res
      mthd.str<-as.character(ebp.def$mthd[i])
      pval.parse<-parse(text=paste(substring(mthd.str,1,regexpr("ebp",mthd.str)-2),".pval",sep=""))
      pval.res<-eval(pval.parse)
      P[,i]<-pval.res
   }
   detach(fin.res)
   best.ind<-apply(W,1,which.max)
   best.p<-rep(NA,n.genes)
   for (i in 1:n.method) best.p[best.ind==i]<-P[best.ind==i,i]
   return(best.p)
}


