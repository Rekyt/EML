#' eml online validation tool
#' 
#' Programmatic interface to the online parsing tool https://knb.ecoinformatics.org/emlparser/parse
#' @param eml path to an eml file or text of eml file
#' @param ... additional arguments to formQuery
#' @param schema_only logical, use schema-only validation tests. 
#'  will also be used as the fallback mechanism if RHTMLForms is unavailable.  
#' @return Two logicals indicating if we pass schema validation tests and id/referencing tests.  
#' @details More detailed testing against the schema can be performed using the xmlSchemaValidate
#'   function from the XML package, which will report information on exactly what lines fail the 
#'   test, if any.  However, this performs only the first of the two checks provided by the online
#'   tool, which also checks that all referenced internal ids (describes nodes) correspond to matching ids.  
#' 
#'   This function requires an internet connection.
#' @import XML
#' @author Duncan Temple Lang
#' @export
eml_validate <- function(eml, schema_only = TRUE){
  
  doctext <- saveXML(xmlParse(eml))
  out <- xmlSchemaValidate("http://ropensci.github.io/EML/eml.xsd", doctext)
  #    out <- xmlSchemaValidate(system.file("xsd", "eml.xsd", package="EML"), doctext)
  if(out$status == 0){ 
    TRUE
  } else { 
    out$errors
  }
  
}
