shapiro.test2 <-
function(z)

{
   res<-shapiro.test(z)
   return(c(stat=res$statistic,pval=res$p.value))
}

