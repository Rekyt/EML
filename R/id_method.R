#' @include eml.R

setGeneric("id", function(x) standardGeneric("id"))
setMethod("id", signature("eml"), 
          function(x) unname(x@packageId))

setGeneric("version", function(x) standardGeneric("version"))
setMethod("version", signature("eml"), 
          function(x) x@namespaces[["eml"]])
setMethod("version", signature("character"), 
          function(x) { 
            x <- eml_read(x) 
            version(x) 
          })

