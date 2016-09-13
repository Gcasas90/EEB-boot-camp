#!/usr/bin/env Rscript

##gets help for "mean" function
'?'(mean)

##Same result, with different command
help("mean")

##Searches for functions related to the keyword "mean"
help.search("mean")

##Returns similar information as above, but in the form of an array containing only thw names of objects matching the search
apropos("mean")

##Opens a webpage on default browser to search for help pages with the keyword "violin"
RSiteSearch("violin")

##Similar as above, but searches only for functions
RSiteSearch("violin", restrict = c("functions"))

#Opens help on the RSiteSearch function
help(RSiteSearch)
