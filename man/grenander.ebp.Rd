\name{grenander.ebp}
\alias{grenander.ebp}
\title{
Grenander EBP.
}
\description{
computes Grenander EBP
}
\usage{
grenander.ebp(p)
}
\arguments{
  \item{p}{
is a vector of p-values.
}
}
\value{
 \item{pval.pdf }{vector of Grenander PDF estimates corresponding to the input vector of p-values}
 \item{ebp.null }{vector of Grenander EBP estimates corresponding to the input vector of p-values}
}
\references{
Langaas, M., Lindqvist, B., 2005. Estimating the proportion of true null hypotheses, with application 
to DNA microarray data. J.R. Statist. Soc. B67, part4, 555-572.
Strimmer, K. 2008. A unified approach to false discovery rate estimation. BMC Bioinformatics 9: 303.
Strimmer, K. 2008. fdrtool: a versatile R package for estimating local and tail area-based false discovery rates. Bioinformatics 24: 1461-1462.
}
\author{
Stan Pounds <\email{stanley.pounds@stjude.org}>; Demba Fofana <\email{demba.fofana@stjude.org}>
}
 \examples{  
####################Grenander estimation #####################
# load data  and compute grenander
p<-rbeta(1000,0.8,1) # Grenander example p-values
gren.res<-grenander.ebp(p) # Compute grenander results
}
\keyword{ Grenander estimation }

