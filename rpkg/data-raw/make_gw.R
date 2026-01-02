# /usr/bin/r
#
# Created: 2018.05.25
# Copyright: Steven E. Pav, 2018
# Author: Steven E. Pav <steven@sharperat.io>
# Comments: Steven E. Pav

library(readr)
library(dplyr)
rawdata <- read_csv('http://www.ivo-welch.info/professional/goyal-welch/goyal-welch-a.csv',
										col_types=cols(`"yyyy"`=col_integer(),
																	 .default=col_double())) %>%
	setNames(gsub('"','',names(.)))

library(xts)
gw <- xts(rawdata %>% dplyr::select(-yyyy),
					order.by=as.Date(paste0(rawdata$yyyy,'-12-31'),format='%Y-%m-%d'))

devtools::use_data(gw)

#for vim modeline: (do not edit)
# vim:fdm=marker:fmr=FOLDUP,UNFOLD:cms=#%s:syn=r:ft=r
