\name{hybrid.test}
\alias{hybrid.test}
\title{
Hybrid Multiple Testing of Gene Expression Data
}
\description{
This function allows users to generalize the assumption adequacy averaging method of Pounds and Rai (2009).  
Multiple hypothesis testing methods are applied to the data of each gene.  Additionally, for each gene, 
assumptions of those methods are formally evaluated with a statistical test.  For each gene, the results 
of the statistical evaluation of model assumptions (e.g. normality) are used to define weights to combine
or select the results of the tests of primary interest (e.g. differential expression).  For example, 
the Shapiro-Wilk (1965) test may be applied to residuals to test the assumption of normality and used 
to select the t-test or rank-sum test for differential expression analysis of each gene.
}
\usage{
hybrid.test(express.set, test.specs, ebp.def=NULL)
}
\arguments{
  \item{express.set}{A Bioconductor ExpressionSet (add a link) object.  The AssayData component contains the
   normalized log-expression data and the phenoData component contains the phenotype, biological condition, 
   or treatment data.
}
  \item{test.specs}{
A data.frame that describes the statistical tests to be performed.  Each row gives details about one statistical
 test to be applied to the data.  For each test, provide a label, the name of the R function that performs
the test, the x argument of the function, and the opts (options).  All entries are to be character strings.
}
  \item{ebp.def}{
A data.frame that describes how the statistical test results are to be combined to give the final hybrid test result.  
It has a column `wght' and a column 'mthd'.  Each row defines one term in the sum of probabilities for the final
hybrid test result.  The EBP will be the sum of the product of the wght EBP and the mthd EBP.  }
}

\value{
Returns a data.frame, each row giving results for one gene.  The columns include the test statistic, p-value, and EBP 
for each test applied to the data, the final hybrid.test EBP defined by the weighted average (wgt.mean.ebp), the p-value
from the empirically best test (best.pval), and the EBP computed from best.pval.

}
\references{
Pounds, S., Rai, S., 2009. Assumption adequacy averaging as a concept for developing more robust methods for differential gene
 expression analysis.  Computational Statistics and Data Analysis 53, 1604-1612.
 S.S. Shapiro and M.B. Wilk, An analysis of variance test for normality (complete samples). Biometrika, 52 (1965), pp. 591-611.
}
\author{
Stan Pounds <\email{stanley.pounds@stjude.org}>; Demba Fofana <\email{demba.fofana@stjude.org}>  or <\email{dfofana@yahoo.com}>
}
\examples{  

####################Correlation Study#####################
# load data
data(correlation.data)
# Read the expression values  
Y<-exprs(correlation.data)
# Read the phenotype
x<-pData(correlation.data)
# Create test Spectrum
 test.specs<-cbind.data.frame(label=c("pearson","spearman","shapiro"),
                             func.name=c("row.pearson","row.spearman","row.slr.shapiro"),
                             x=rep("x",3),
                             opts=rep("",3))
# Specify the tests
ebp.def<-cbind.data.frame(wght=c("shapiro.ebp","(1-shapiro.ebp)"),
                          mthd=c("pearson.ebp","spearman.ebp"))
# Perform the Hybrid test
corr.res<-hybrid.test(correlation.data,test.specs,ebp.def)
head(corr.res) 

####################Three group comparison###################
# load data
data(GroupComp.data)
# Read the expression values   
brain.express.set <- exprs(GroupComp.data)
head(brain.express.set)
# Read the phenotype
brain.pheno.data <- pData(GroupComp.data)
brain.pheno.data 
# Specify the tests
test.specs<-cbind.data.frame(label=c("anova","kw","shapiro"),
                             func.name=c("row.oneway.anova","row.kruskal.wallis","row.kgrp.shapiro"),
                             x=rep("grp",3),
                             opts=rep("",3))

# Define the final ebp
ebp.def<-cbind.data.frame(wght=c("shapiro.ebp","(1-shapiro.ebp)"),
                          mthd=c("anova.ebp","kw.ebp"))
                       
#Perform the Hybrid test
Kgrp.res<-hybrid.test(GroupComp.data,test.specs,ebp.def)


}


\keyword{ Hybrid Multiple testing}

