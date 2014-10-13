\name{row.spearman}
\alias{row.spearman}
\title{
Compute Spearmans rank-based correlation of many variables with a variable x
}
\description{
For each row of the data matrix Y, compute its Spearman correlation with x.
}
\usage{
row.spearman(Y, x)
}

\arguments{
  \item{Y}{
a data matrix with rows for variables and columns for subjects
}
  \item{x}{
a vector of the variable to be associated with each row of Y
}
}

\value{
A data.frame with three components:
 \item{stat }{a vector with the Spearman correlation for each row of Y}
 \item{pval }{a vector with the p-value for each row of Y}
\item{ebp}{a vector with the estimated empirical Bayes probability of zero correlation for each row of Y}
}
\references{
Spearman, C.  (1904) The proof and measurement of association between two things.  Amer. J. Psychol. 15:72-101.

}
\author{
Stan Pounds <\email{stanley.pounds@stjude.org}>; Demba Fofana <\email{demba.fofana@stjude.org}>
}

\examples{  
####################Correlation Study#####################
# load data
data(correlation.data)
# Read the expression values  
Y<-exprs(correlation.data)
# Read the phenotype
x<-pData(correlation.data)
x[,1]
#Spearman Test
row.spearman(Y,x[,1])
}
\keyword{ Multiple comparison}

