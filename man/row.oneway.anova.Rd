\name{row.oneway.anova}
\alias{row.oneway.anova}
\title{
Perform one-way ANOVA for many variables.
}
\description{
For each row of Y, use one-way ANOVA to compare means across groups defined by grplbl.
}
\usage{
row.oneway.anova(Y, grplbl)
}

\arguments{
  \item{Y}{
data matrix with variables in rows and subjects in columns
}
  \item{grplbl}{
vector of group labels for the subjects
}
}
 \details{
The alternative hypothesis is that, for each gene, there are at least two groups of different mean.
The null hypothesis is that all groups have the same mean for each gene studied.
}
\value{
A data.frame with three columns:
 \item{stat}{a vector with the ANOVA F-statistic for each row of Y}
 \item{pval}{a vector with the ANOVA p-value for each row of Y}
 \item{ebp}{a vector with the empirical Bayes probability of equal means for each row of Y}

}
\references{
Chambers, J. M. and Hastie, T. J. (1992) Statistical Models in S, Wadsworth & Brooks/Cole.   
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
# ANOVA test
row.oneway.anova(brain.express.set,brain.pheno.data[,1])
 }

\keyword{
Multiple comparison}

