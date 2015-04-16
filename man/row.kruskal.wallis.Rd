\name{row.kruskal.wallis}
\alias{row.kruskal.wallis}

\title{
Apply the Kruskal-Wallis test many times
}
\description{
For each row of Y, use the Kruskal-Wallis test to compare medians across groups defined in grplbl
}
\usage{
row.kruskal.wallis(Y, grplbl)
}

\arguments{
  \item{Y}{
data matrix with variables in rows and observations (subjects) in columns
}
  \item{grplbl}{
vector of group labels
}
}
\details{
The alternative hypothesis is that, for each gene, there are at least two groups of different median.
The null hypothesis is that all groups have the same median for each gene studied.
}
\value{
A data.frame with three columns
 \item{stat }{a vector with the test-statistic for each row of Y}
 \item{pval }{a vector with the p-value for each row of Y}
\item{ebp}{a vector with the empirical Bayes probability of equal medians for each row of Y}
}
\references{
Kruskal, W.H. and W.A. Wallis (1952)  Use of ranks in one-criterion variance analysis.  J. Amer. Stat. Assoc.  47:583-621.
}
\author{
Stan Pounds <\email{stanley.pounds@stjude.org}>; Demba Fofana <\email{demba.fofana@stjude.org}>

}
\examples{  
####################Three group comparison###################
# load data
data(GroupComp.data)
# Read the expression values   
brain.express.set <- exprs(GroupComp.data)
head(brain.express.set)
# Read the phenotype
brain.pheno.data <- pData(GroupComp.data)
brain.pheno.data[,1] 
row.kruskal.wallis(brain.express.set,brain.pheno.data[,1])
 }
\keyword{
Multiple comparison }




