\name{row.pearson}
\alias{row.pearson}

\title{
Compute the Pearson correlation of a variable x with many variables in a matrix Y
}
\description{
For each row of a data matrix Y, compute the Pearson correlation with the variable x.
}
\usage{
row.pearson(Y, x)
}

\arguments{
  \item{Y}{
A data matrix with rows for variables and columns for subjects.
}
  \item{x}{
a vector with the variable to be correlated with each variable of Y
}
}

\value{
A data.frame with three columns:
 \item{stat }{a vector with the Pearson correlation for each row of Y}
 \item{pval }{a vector with the p-value for each row of Y}
\item{ebp}{a vector with the empirical Bayesian probability that the correlation is zero for each row of Y}

}
\references{
Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) The New S Language. Wadsworth & Brooks/Cole. 
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
#Pearson Test
row.pearson(Y,x[,1])
}
\keyword{ Multiple comparison}

