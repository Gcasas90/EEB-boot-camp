#!/usr/bin/env Rscript

writeLines("\n\tgets help for 'mean' function\n")
'?'(mean)

writeLines("\n\tSame result, with different command\n")
help("mean")

writeLines("\n\tSearches for functions related to the keyword 'mean'\n")
help.search("mean")

writeLines("\n\tReturns similar information as above, but in the form of an array containing only thw names of objects matching the search\n")
apropos("mean")

writeLines("\n\tOpens a webpage on default browser to search for help pages with the keyword 'violin'\n")
RSiteSearch("violin")

writeLines("\n\tSimilar as above, but searches only for functions\n")
RSiteSearch("violin", restrict = c("functions"))

writeLines("\n\tOpens help on the RSiteSearch function\n")
help(RSiteSearch)
