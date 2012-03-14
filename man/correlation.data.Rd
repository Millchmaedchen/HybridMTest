\name{correlation.data}
\alias{correlation.data}
\title{Sample ExpressionSet object of correlation.data}
\description{An \emph{ExpressionSet} object of correlation.data.}
   
  
\usage{
data(correlation.data)
}   
  
\details{
   \emph{correlation.data} includes expression data for 100 randomly selected genes for the subjects of the
    AML97 clinical trial in Lamba et al (2010).  The phenotype is the log-transformed baseline DNA synthesis rate.  
   The data set is included for an example of exploring the correlation of expression with a quantitative phenotype.
}

\value{
\item{expr(correlation.data)}{A matrix with 100 rows and 83 columns with rows representing probe-sets and 
 cloumns of human sample IDs. 
}

\item{pData(correlation.data)}{A data frame with 100 rows and 2 columns. Each row represents one human sample.
 Column \emph{id} is the column without title and 
\emph{x} is the phenotype observations transformed by log function.} 
}

\seealso{
\link[Biobase]{ExpressionSet}-class


\code{\link{hybrid.test}}; \code{\link{GroupComp.data}}
}

\references{
	Lamba JK et al.  Identification of predictive markers of cytarabine response in acute myeloid leukemia
  by integrative analysis of gene-expression profiles with multiple phenotypes.  Pharmacogenomics, 12: 327-39.
}

\examples{
data(correlation.data)
tumor.express.set <- exprs(correlation.data)
tumor.pheno.data <- pData(correlation.data)

}
