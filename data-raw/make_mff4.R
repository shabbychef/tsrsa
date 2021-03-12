# get the Fama-French data
#
# Created: 2014.03.12
# Copyright: Steven E. Pav, 2014
# Author: Steven E. Pav
# Comments: Steven E. Pav

suppressMessages({
	library(xts)
	library(Quandl)
	library(devtools)
	library(usethis)
})

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

FF4 <- ff_read('F-F_Research_Data_Factors_TXT',
							 subfile='F-F_Research_Data_Factors.txt',
							 skip=3,header=FALSE,widths=c(6,rep(8,4)))
FFM <- ff_read('F-F_Momentum_Factor_TXT',
							 subfile='F-F_Momentum_Factor.TXT',
							 skip=13,header=FALSE,widths=c(6,rep(8,1)))
colnames(FFM) <- c("UMD")

ff4.xts <- cbind(FF4,FFM)
ff4.xts <- ff4.xts[! rowSums(is.na(ff4.xts)),]

# put Mkt back:
ff4.xts$Mkt <- ff4.xts[,"Mkt.RF"] + ff4.xts[,"RF"]
# re-sort
ff4.xts <- ff4.xts[,c("Mkt","SMB","HML","UMD","RF")]

# kill old data so it does not litter the workspace
rm("FF4","FFM","ff_read")

# subselect. 
mff4 <- ff4.xts['1900-01-01::2018-12-11',]

cat('mff4 is ',dim(mff4),'\n')

usethis::use_data(mff4,overwrite=TRUE)

#for vim modeline: (do not edit)
# vim:fdm=marker:fmr=FOLDUP,UNFOLD:cms=#%s:syn=r:ft=r:nu
