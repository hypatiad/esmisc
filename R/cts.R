#' Get record details from Chemical Translation Service (CTS)
#' 
#' Get record details from CTS, see \url{http://cts.fiehnlab.ucdavis.edu}
#' @import RCurl RJSONIO
#' @param inchikey character, InChIkey.
#' @param verbose logical; should a verbose output be printed on the console?
#' @param ... currently not used.
#' @return a list of 7. inchikey, inchicode, molweight, exactmass, formula, synonyms and externalIds
#' @author Eduard Szoecs, \email{eduardszoecs@@gmail.com}
#' @export
#' @examples 
#' \dontrun{
#' out <- cts_compinfo("DNYVWBJVOYZRCX-RNGZQALNSA-N")
#' str(out)
#' out[1:5]
#' }
cts_compinfo <- function(inchikey, verbose = FALSE, ...){
  if(length(inchikey) > 1){
    stop('Cannot handle multiple input strings.')
  }
  baseurl <- "http://cts.fiehnlab.ucdavis.edu/service/compound"
  qurl <- paste0(baseurl, '/', inchikey)
  if(verbose)
    message(qurl)
  # Sys.sleep(0.3)
  h <- try(getURL(qurl))
  if(!inherits(h, "try-error")){
    out <- fromJSON(h)
  } else{
    warning('Problem with web service encountered... Returning NA.')
    out < NA
  }
  if (length(out) == 0){
    message("Not found. Returning NA.")
    out <- NA
  }
  return(out)
}

#' Convert Ids using Chemical Translation Service (CTS)
#' 
#' Convert Ids using Chemical Translation Service (CTS), see \url{http://cts.fiehnlab.ucdavis.edu/conversion/index}
#' @import RCurl RJSONIO
#' @param query character; query ID. 
#' @param from character; type of query ID, e.g. \code{'Chemical Name'} , \code{'InChIKey'},
#'  \code{'PubChem CID'}, \code{'PubChem CID'}, \code{'CAS'}.
#' @param to character; type to convert to.
#' @param first logical; return only first result be returned?
#' @param verbose logical; should a verbose output be printed on the console?
#' @param ... currently not used.
#' @return a character vector.
#' @author Eduard Szoecs, \email{eduardszoecs@@gmail.com}
#' @export
#' @examples 
#' \dontrun{
#' cts_convert('XEFQLINVKFYRCS-UHFFFAOYSA-N', 'inchikey', 'Chemical Name')
#' str(out)
#' out[1:5]
#' }
cts_convert <- function(query, from, to, first = FALSE, verbose = FALSE, ...){
  if(length(from) > 1){
    stop('Cannot handle multiple input strings.')
  }
  baseurl <- "http://cts.fiehnlab.ucdavis.edu/service/convert"
  qurl <- paste0(baseurl, '/', from, '/', to, '/', query)
  qurl <- URLencode(qurl)
  if(verbose)
    message(qurl)
  h <- try(getURL(qurl))
  if(!inherits(h, "try-error")){
    out <- fromJSON(h)[[1]]$result
  } else{
    warning('Problem with web service encountered... Returning NA.')
    out < NA
  }
  if (length(out) == 0){
    message("Not found. Returning NA.")
    out <- NA
  }
  return(out)
}
