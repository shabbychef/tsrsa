

# tsrsa 

[![Build Status](https://github.com/shabbychef/tsrsa/workflows/R-CMD-check/badge.svg)](https://github.com/shabbychef/tsrsa/actions)

Data and code for the book, _The Sharpe Ratio: Statistics and Applications._ 

-- Steven E. Pav, steven@sharperat.io

## Installation

This package can be installed 
via [drat](https://github.com/eddelbuettel/drat "drat"), or
from github:


```r
# via drat:
if (require(drat)) {
    drat:::add("shabbychef")
    install.packages("tsrsa")
}
# get snapshot from github (may be buggy)
if (require(remotes)) {
    remotes::install_github("shabbychef/tsrsa/rpkg")
}
```


