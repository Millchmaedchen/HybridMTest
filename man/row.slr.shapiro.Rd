\name{row.slr.shapiro}
\alias{row.slr.shapiro}
\title{
Test normality of residuals for many variables.

}
\description{
For each row of the data matrix Y, use the Shapiro-Wilk test to determine if the residuals of simple linear regression on x are normally distributed.
}
\usage{
row.slr.shapiro(Y, x)
}
\arguments{
  \item{Y}{
a data matrix with rows for variables and columns for subjects
}
  \item{x}{
a vector with values of the independent variables for regression of each row of Y.
}
}

\value{
A data.frame with three columns:
 \item{stat }{A vector with the Shapiro-Wilk test statistic for each row of Y}
 \item{pval }{A vector with the Shapiro-Wilk p-value for each row of Y}
\item{ebp}{A vector with the estimated empirical Bayes probability of normally distributed residuals for each row of Y}
}
\references{
Patrick Royston (1982) Algorithm AS 181: The W test for Normality. Applied  Statistics, 31, 176-180.
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
#Shapiro Test
row.slr.shapiro(Y,x[,1])
}
\keyword{Test for normality }