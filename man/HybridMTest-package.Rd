\name{HybridMTest-package}
\alias{HybridMTest-package}
\docType{package}
\title{
A powerful tool in gene expression hypothesis testing.
}
\description{
This package enables users to generalize the assumption adequacy averaging (AAA) procedure proposed
by Pounds and Rai (2009). AAA uses empirical Bayes methodology (Efron et al 2001) to simultaneously evaluate
assumptions for each hypothesis test, select the best hypothesis testing procedure for each hypothesis test, 
and adjust for multiple testing.
}  % end description
\details{
\tabular{ll}{
Package: \tab HybridMTest\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2010-07-24\cr
License: \tab GPL (>=2)\cr
LazyLoad: \tab yes\cr
}  %end tabular
The main function is hybrid.test.  The users may use existing row.test functions (such as row.T.test) 
or utilize their own row.test functions with similar input and output structures.
} %end details
\author{
Stan Pounds <\email{stanley.pounds@stjude.org}>; Demba Fofana <\email{demba.fofana@stjude.org}>
Maintainer: Stan Pounds <\email{stanley.pounds@stjude.org}>; Demba Fofana <\email{dfofana@yahoo.com}>
}
\examples{  

####################Correlation Data##############
# load data
data(correlation.data)
# Read the expression values  
Y<-exprs(correlation.data)
head(Y)
# Read the phenotype
x<-pData(correlation.data)
####################Three group comparison Data####
# load data
data(GroupComp.data)
# Read the expression values   
brain.express.set <- exprs(GroupComp.data)
head(brain.express.set)
# Read the phenotype
brain.pheno.data <- pData(GroupComp.data)
}
\references{
Pounds SB, Rai SN.  (2009) Assumption Adequacy Averaging as a Concept for Developing More Robust Methods
for Differential Gene Expression Analysis.  Computational Statistics and Data Analysis, 53: 1604-1612 .

B. Efron, R. Tibshirani, J.D. Storey and V. Tusher, Empirical Bayes analysis of a microarray experiment.
 Journal of American Statistical Association, 96 (2001), pp. 1151-1160.
}
\keyword{ package }

