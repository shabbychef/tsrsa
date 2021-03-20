# get the VIX data
#
# Created: 2014.03.12
# Copyright: Steven E. Pav, 2014
# Author: Steven E. Pav
# Comments: Steven E. Pav

suppressMessages({
	library(readr)
	library(dplyr)
	library(tidyr)
	library(readxl)
	library(httr)
	library(devtools)
	library(usethis)

	library(xts)
	library(Quandl)
})

# crap hell.
#vix.xts <- Quandl("YAHOO/INDEX_VIX",
	#start_date="1990-01-31",end_date="2018-12-31",
	#type="xts")

#vix.xts <- sanitize.TEO(vix.xts)
#vix.xts <- vix.xts[,'Adjusted Close']
#colnames(vix.xts) <- 'VIX'


vixy <- readr::read_csv('https://ww2.cboe.com/publish/scheduledtask/mktdata/datahouse/vixcurrent.csv',
												skip=1,
												col_types=readr::cols(Date=col_date(format='%m/%d/%Y'))
												) %>%
	setNames(gsub('\\s+','_',names(.)))
#vxo <- readxl::read_xls('http://www.cboe.com/publish/scheduledtask/mktdata/datahouse/vixarchive.xls',
												#skip=1) %>%
	#setNames(gsub('\\s+','_',names(.)))

GET('https://ww2.cboe.com/publish/scheduledtask/mktdata/datahouse/vixarchive.xls', write_disk(tfname <- tempfile(fileext = ".xls")))
vxo <- readxl::read_xls(tfname, skip=1) %>%
	setNames(gsub('\\s+','_',names(.))) %>%
	select(Date,VIX_Close) %>%
	rename(VIX=VIX_Close) %>%
	mutate(VIX=as.numeric(VIX)) %>%
	mutate(Date=as.Date(Date)) %>%
	filter(!is.na(VIX))

vix <- rbind(vxo, vixy %>% select(Date,VIX_Close) %>% rename(VIX=VIX_Close)) %>%
	filter(Date <= as.Date('2020-12-31'))

dvix <- xts(x=vix$VIX,order.by=as.Date.POSIXlt(as.POSIXlt(vix$Date)))
colnames(dvix) <- c('VIX')
cat('dvix is ',dim(dvix),'\n')

usethis::use_data(dvix,overwrite=TRUE)

#for vim modeline: (do not edit)
# vim:fdm=marker:fmr=FOLDUP,UNFOLD:cms=#%s:syn=r:ft=r:nu
