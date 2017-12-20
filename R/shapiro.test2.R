shapiro.test2 <-
function(z)

{
   res<-tryCatch(shapiro.test(as.numeric(z)), error = function(e) NULL)
   return(c(stat=res$statistic,pval=res$p.value))
}

