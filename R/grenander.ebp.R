grenander.ebp <-
function(p)     # Compute the grenander.ebp from a vector of p-values
{
   na<-is.na(p)
   p.edf<-ecdf(p[!na])
   gren.res<-grenander(p.edf)
   gren.pdf<-approx(gren.res$x.knots,gren.res$f.knots,xout=p)$y
   gren.ebp<-min(gren.res$f.knots)/gren.pdf
   ebp.null<-pval.pdf<-rep(NA,length(p))
   ebp.null[!na]<-gren.ebp
   pval.pdf[!na]<-gren.pdf   
   return(cbind.data.frame(pval.pdf=pval.pdf,ebp.null=ebp.null))
}

