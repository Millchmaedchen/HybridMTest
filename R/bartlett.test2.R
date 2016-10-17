bartlett.test2 <-
function(y,  # vector of observations
            grplbl) # vector of group labels

{
   res0<-bartlett.test(y,grplbl)
   res<-c(stat=res0$statistic,pval=res0$p.value)
   return(res)
 }

