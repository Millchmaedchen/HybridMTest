\name{row.kgrp.shapiro}
\alias{row.kgrp.shapiro}
\title{
Shapiro Wilk test of normality.
}
\description{
For each row of the expression matrix Y, use Shapiro-Wilks test to determine whether the residuals of one-way ANOVA (with groups defined by x) are normally distributed.
}
\usage{
row.kgrp.shapiro(Y, x)
}
\arguments{
  \item{Y}{
the data matrix with variables in rows and observations (subjects) in columns
}
  \item{x}{
x is vector of group labels
}
}

\value{
A data.frame with three columns
 \item{stat }{a vector with the Shapiro-Wilk test statistic for each row of Y}
 \item{pval }{a vector with the Shapiro-Wilk p-value for each row of Y}
\item{ebp}{a vector with the estimated empirical Bayes probability of normality for each row of Y}
}
\references{

Patrick Royston (1982) An extension of Shapiro and Wilk's W test for normality to large samples. Applied Statistics, 31, 115-124.
Patric Royston (1992) Algorithm As 181: The W test for Normality. Applied Statistics, 31, 176-180.
Patric Royston (1995) Remarks As R94: A remark on Algorithm AS 181:The W test for normality. Applied Statistics, 44, 547-551
}
\author{Stan Pounds <\email{stanley.pounds@stjude.org}>; Demba Fofana <\email{demba.fofana@stjude.org}>
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
#Shapiro Test of Normality
row.kgrp.shapiro(brain.express.set,brain.pheno.data[,1] )
 }
\keyword{Test for normality }

