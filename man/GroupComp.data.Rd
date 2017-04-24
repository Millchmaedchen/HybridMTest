\name{GroupComp.data}
\alias{GroupComp.data}
\title{Sample ExpressionSet of GroupComp.data}
\description{An \emph{ExpressionSet} object of GroupComp.data}
   
  
\usage{
data(GroupComp.data)
}   
  
\details{
   \emph{GroupComp.data} is an \emph{ExpressionSet} object with the expression data from Johnson et al (2010)
    for 100 randomly selected genes. The expression data was collected from 83 subjects with ependymoma defined
    by anatomic subclass (grp1 = posterior fossa, grp2 = supratentorial, grp3 = spinal).  
   The data set is used for an example of using the package for a comparison of expression across 3 groups.  
   
}

\value{
\item{expr(GroupComp.data)}{A matrix with 100  rows and 83 columns with rows representing probe-sets and
 cloumns of human sample IDs. 
}

\item{pData(GroupComp.data)}{A data frame with 83 rows and 2 columns. Each row represents one human sample.
 Column \emph{id} is the human sample ID and 
\emph{sppfst.grps} is the assigned sample group label.} 
}

\seealso{
\link[Biobase]{ExpressionSet}-class


\code{\link{hybrid.test}}; \code{\link{correlation.data}}
}

\references{
	R. Johnson et al.(2010) Cross-species genomics matches driver mutations and cell compartments to model 
  ependymoma. \emph{Nature}, 466: 632-6.
}

\examples{
data(GroupComp.data)
brain.express.set <- exprs(GroupComp.data)
brain.pheno.data <- pData(GroupComp.data)

}
