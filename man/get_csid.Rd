% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/chemspider.R
\name{get_csid}
\alias{get_csid}
\title{Retrieve ChemSpider ID}
\usage{
get_csid(query, token = NULL, first = FALSE, verbose = TRUE, ...)
}
\arguments{
\item{query}{charachter; search term.}

\item{token}{character; your security token.}

\item{first}{logical; If TRUE return only first result.}

\item{verbose}{logical; should a verbose output be printed on the console?}

\item{...}{currently not used.}
}
\value{
a character vector of class 'csid' with ChemSpider IDs.
}
\description{
Return Chemspider ID (CSID) for a search query, see \url{http://www.chemspider.com/}.
}
\note{
A security token is neeeded. Please register at RSC
\url{https://www.rsc.org/rsc-id/register}
for a security token.
}
\examples{
\dontrun{
token <- '<YOUR-SECURITY-TOKEN>'
get_csid("Triclosan", token = token)
# [1] "5363"
# attr(,"class")
# [1] "csid"
get_csid("3380-34-5", token = token)
# multiple inputs
sapply(c('Aspirin', 'Triclosan'), get_csid, token = token)
}
}
\author{
Eduard Szoecs, \email{eduardszoecs@gmail.com}
}
\seealso{
\code{\link{csid_compinfo}} and \code{\link{csid_extcompinfo}} to
retrieve compound details from csid.
}

