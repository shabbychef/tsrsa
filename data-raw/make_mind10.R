#
# Created: 2018.04.26
# Copyright: Steven E. Pav, 2018
# Author: Steven E. Pav
# Comments: Steven E. Pav

suppressMessages({
	library(xts)
	library(Quandl)
	library(devtools)
	library(usethis)
})

# old way, which only went through 2104:
#ind5.xts <- Quandl("KFRENCH/5_IND_PORTF_M",
	#start_date="1927-01-31",end_date="2017-07-31",
	#type="xts")
#mind5 <- ind5.xts['::2014-12-21',]

# so much fun, guys
ff_read <- function(stub,
										basedir='http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/',
										subfile=c(paste0(stub,'.txt'),paste0(stub,'.TXT'),
															paste0(stub,'.csv'),paste0(stub,'.CSV')),
										...) {
	url <- paste0(basedir,stub,'.zip')
	# c.f.  http://stackoverflow.com/a/3053883/164611
	temp <- tempfile(fileext='_ff.zip')
	download.file(url,temp)
	wasok <- FALSE
	iii <- 1
	while (!wasok) {
		wasok <- TRUE
		data <- tryCatch({
			read.fwf(unz(temp, subfile[iii]),stringsAsFactors=FALSE,...) 
		},error=function(e) { 
			wasok <- FALSE;
		 	NULL })
		iii <- iii + 1 
		stopifnot(wasok || (iii <= length(subfile))) 
	}
	unlink(temp)
	stopifnot(wasok)

	# deal with colnames:
	data[1,1] <- "Date"
	colnames(data) <- gsub("\\s","",data[1,])
	data <- data[-1,]
	# remove trailing junk:
	badrow <- as.numeric(rowSums(is.na(data))) == dim(data)[2]
	if (any(badrow)) {
		browid <- which(badrow)[1]
		data <- data[1:(browid-1),]
	}
	# now deal with dates:
	TEO <- as.yearmon(data$Date,format="%Y%m") 
	# to xts:
	data2 <- xts(sapply(data[,colnames(data) != 'Date',drop=FALSE],as.numeric),
							order.by=TEO)
	data2
}

#http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/5_Industry_Portfolios_CSV.zip
#wget http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/5_Industry_Portfolios_TXT.zip
#unzip -l 5_Industry_Portfolios_TXT.zip
mind <- ff_read('10_Industry_Portfolios_TXT',
							 subfile='10_Industry_Portfolios.txt',
							 skip=11,header=FALSE,widths=c(6,rep(7,10)))

colnames(mind) <- gsub('NoDur','NondurableGoods',colnames(mind))
colnames(mind) <- gsub('Durbl','DurableGoods',colnames(mind))
colnames(mind) <- gsub('Manuf','Manufacturing',colnames(mind))
colnames(mind) <- gsub('Enrgy','Energy',colnames(mind))
colnames(mind) <- gsub('HiTec','Technology',colnames(mind))
colnames(mind) <- gsub('Telcm','Telecom',colnames(mind))
colnames(mind) <- gsub('Shops','Retail',colnames(mind))
colnames(mind) <- gsub('Hlth','Healthcare',colnames(mind))
colnames(mind) <- gsub('Utils','Utilities',colnames(mind))
colnames(mind) <- gsub('Other','Other',colnames(mind))

mind10 <- mind['1926-12-30::2020-12-31',]
cat('mind10 is ',dim(mind10),'\n')
usethis::use_data(mind10,overwrite=TRUE)

#for vim modeline: (do not edit)
# vim:fdm=marker:fmr=FOLDUP,UNFOLD:cms=#%s:syn=r:ft=r
