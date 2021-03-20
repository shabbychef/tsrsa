#
# This file is part of tsrsa.
#
# tsrsa is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
#
# The data in tsrsa are not copyright by the maintainer of
# the package, and may not be freely available for redistribution.
# Check with your lawyer.

# Created: 2021.03.11
# Copyright: Steven E. Pav, 2017-2021
# Author: Steven E. Pav <steven@sharperat.io>
# Comments: Steven E. Pav

#' @title Daily Fama French 4 Factor Returns
#' @description The daily returns of the 4 Fama French Factors: Market, the cap factor SMB, 
#' the growth factor HML, and the momentum factor UMD.
#' @format An \code{xts} object with 24,795 observations and 5 columns. 
#' The data run from January, 1927 through December, 2020.
#' As in the upstream source, the data are given in \emph{percents}, meaning a
#' value of 1.00 corresponds to a 1\% movement.
#' Note also that returns presumably are \sQuote{simple} returns, not log
#' returns, though this is not clarified by the upstream source.
#' The columns are defined as follows:
#' \describe{
#'  \item{\code{Mkt}}{The Market daily return. Note that the risk free rate has been added back
#'  to the excess returns published by the upstream source.}
#'  \item{\code{SMB}}{The cap factor daily return.}
#'  \item{\code{HML}}{The growth factor daily return.}
#'  \item{\code{UMD}}{The momentum factor daily return.}
#'  \item{\code{RF}}{The risk-free rate, presumably as an daily rate, though note that no corrections have been
#'  made for weekend effects when adding the risk-free rate back to the market
#'  rate.}
#' }
#' @source Kenneth French data library.
#' See \url{http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/data_library.html},
#' data description at \url{http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/Data_Library/f-f_factors.html}.
#' @author Steven E. Pav \email{steven@@sharperat.io}
#' @examples
#' \dontrun{
#' data(dff4)
#' str(dff4)
#' }
"dff4"

#' @title Monthly Fama French 4 Factor Returns
#' @description The monthly returns of the 4 Fama French Factors: Market, the cap factor SMB, 
#' the growth factor HML, and the momentum factor UMD.
#' @format An \code{xts} object with 1,128 observations and 5 columns. 
#' The data run from January, 1927 through December, 2020.
#' As in the upstream source, the data are given in \emph{percents}, meaning a
#' value of 1.00 corresponds to a 1\% movement.
#' Note also that returns presumably are \sQuote{simple} returns, not log
#' returns, though this is not clarified by the upstream source.
#' The columns are defined as follows:
#' \describe{
#'  \item{\code{Mkt}}{The Market monthly return. Note that the risk free rate has been added back to the excess returns published by the upstream source.}
#'  \item{\code{SMB}}{The cap factor monthly return.}
#'  \item{\code{HML}}{The growth factor monthly return.}
#'  \item{\code{UMD}}{The momentum factor monthly return.}
#'  \item{\code{RF}}{The risk-free rate, presumably as a monthly rate. The average value is arround 0.28, corresponding to an annualized rate of around 3.3\%.}
#' }
#' @source Kenneth French data library.
#' See \url{http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/data_library.html},
#' data description at \url{http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/Data_Library/f-f_factors.html}.
#' @author Steven E. Pav \email{steven@@sharperat.io}
#' @examples
#' \dontrun{
#' data(mff4)
#' str(mff4)
#' }
"mff4"

#' @title Monthly Fama French 6 Factor Returns
#' @description The monthly returns of the 6 Fama French Factors: 
#' Market, 
#' the cap factor SMB, 
#' the growth factor HML, 
#' the momentum factor UMD,
#' the profitability factor RMW,
#' and the invesment factor CMA.
#'
#' @format An \code{xts} object with 690 observations and 7 columns. 
#' The data run from July, 1963 through December, 2020.
#' As in the upstream source, the data are given in \emph{percents}, meaning a
#' value of 1.00 corresponds to a 1\% movement.
#' Note also that returns presumably are \sQuote{simple} returns, not log
#' returns, though this is not clarified by the upstream source.
#' The columns are defined as follows:
#' \describe{
#'  \item{\code{Mkt}}{The Market monthly return. Note that the risk free rate has been added back to the excess returns published by the upstream source.}
#'  \item{\code{SMB}}{The cap factor monthly return.}
#'  \item{\code{HML}}{The growth factor monthly return.}
#'  \item{\code{UMD}}{The momentum factor monthly return.}
#'  \item{\code{RMW}}{The profitability factor monthly return.}
#'  \item{\code{CMA}}{The investment factor monthly return.}
#'  \item{\code{RF}}{The risk-free rate, presumably as a monthly rate. The average value is arround 0.39, corresponding to an annualized rate of around 4.7\%.}
#' }
#' @source Kenneth French data library.
#' See \url{http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/data_library.html},
#' and data description at \url{http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/Data_Library/f-f_5_factors_2x3.html}.
#' @author Steven E. Pav \email{steven@@sharperat.io}
#' @examples
#' \dontrun{
#' data(mff6)
#' str(mff6)
#' }
"mff6"

#' @title Daily VIX Close
#' @description The daily closing value of the CBOE VIX index.
#' @format An \code{xts} object with 7,809 observations and 1 columns. 
#' The data run from January, 1990 through December, 2020.
#' The columns are defined as follows:
#' \describe{
#'  \item{\code{VIX}}{The closing value of the VIX index. 
#'  From January 2004 onward, the data are from the modern definition of the VIX index.
#'  The data from before 2004 are sourced from the back-computed data archive on CBOE.}
#' }
#' @source CBOE. See \url{http://www.cboe.com/products/vix-index-volatility/vix-options-and-futures/vix-index/vix-historical-data}.
#' @author Steven E. Pav \email{steven@@sharperat.io}
#' @examples
#' \dontrun{
#' data(dvix)
#' str(dvix)
#' }
"dvix"

#' @title Monthly Fama French 5 Industry Returns
#' @description The monthly returns of 5 industries: Consumer, Manufacturing, High Technology, Healthcare and Other.
#' @format An \code{xts} object with 1,128 observations and 5 columns. 
#' The data run from January, 1927 through December, 2020.
#' As in the upstream source, the data are given in \emph{percents}, meaning a
#' value of 1.00 corresponds to a 1\% movement.
#' Note also that returns presumably are \sQuote{simple} returns, not log
#' returns, though this is not clarified by the upstream source.
#' The columns are defined as follows:
#' \describe{
#'  \item{\code{Consumer}}{The monthly returns of the Consumer industry, published as \dQuote{Cnsmr}.}
#'  \item{\code{Manufacturing}}{The monthly returns of the Manufacturing industry, published as \dQuote{Manuf}.}
#'  \item{\code{Technology}}{The monthly returns of the Technology industry, published as \dQuote{HiTec}.}
#'  \item{\code{Healthcare}}{The monthly returns of the Healthcare industry, published as \dQuote{Hlth}.}
#'  \item{\code{Other}}{The monthly returns of the Other industry, published as \dQuote{Other}.}
#' }
#' @source Kenneth French data library.
#' See \url{http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/data_library.html},
#' data description at \url{http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/Data_Library/det_5_ind_port.html}.
#' @author Steven E. Pav \email{steven@@sharperat.io}
#' @note These are not the \dQuote{ex dividend} returns series.
#' @examples
#' \dontrun{
#' data(mind5)
#' str(mind5)
#' }
"mind5"

#' @title Monthly Fama French 10 Industry Returns
#' @description The monthly returns of 10 industries: Nondurable goods, durable goods,
#' Manufacturing, Energy, High Technology, Telecom, Retail, Healthcare, Utilities and Other.
#' @format An \code{xts} object with 1,128 observations and 10 columns. 
#' The data run from January, 1927 through December, 2020.
#' As in the upstream source, the data are given in \emph{percents}, meaning a
#' value of 1.00 corresponds to a 1\% movement.
#' Note also that returns presumably are \sQuote{simple} returns, not log
#' returns, though this is not clarified by the upstream source.
#' The columns are defined as follows:
#' \describe{
#'  \item{\code{NondurableGoods}}{The monthly returns of the nondurable goods industry, published as \dQuote{NoDur}.}
#'  \item{\code{DurableGoods}}{The monthly returns of the durable goods industry, published as \dQuote{Durbl}.}
#'  \item{\code{Manufacturing}}{The monthly returns of the Manufacturing industry, published as \dQuote{Manuf}.}
#'  \item{\code{Energy}}{The monthly returns of the Energy industry, published as \dQuote{Enrgy}.}
#'  \item{\code{Technology}}{The monthly returns of the Technology industry, published as \dQuote{HiTec}.}
#'  \item{\code{Telecom}}{The monthly returns of the Telecommunications industry, published as \dQuote{Telcm}.}
#'  \item{\code{Retail}}{The monthly returns of the Retail industry, published as \dQuote{Shops}.}
#'  \item{\code{Healthcare}}{The monthly returns of the Healthcare industry, published as \dQuote{Hlth}.}
#'  \item{\code{Utilities}}{The monthly returns of the Utilities industry, published as \dQuote{Utils}.}
#'  \item{\code{Other}}{The monthly returns of the Other industry, published as \dQuote{Other}.}
#' }
#' @source Kenneth French data library.
#' See \url{http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/data_library.html},
#' data description at \url{http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/Data_Library/det_10_ind_port.html}.
#' @author Steven E. Pav \email{steven@@sharperat.io}
#' @note These are not the \dQuote{ex dividend} returns series.
#' @examples
#' \dontrun{
#' data(mind10)
#' str(mind10)
#' }
"mind10"

#' @title Goyal Welch Equity Premium Data.
#' @description The yearly excess returns of the Market, aligned with a number
#' of lagging independent variables which have been posited to be predictive
#' of the excess returns.
#' @format An \code{xts} object with 215 observations and 23 columns. 
#' The data are annual and span from 1802 through 2016. 
#' As in the upstream source, the data are given in \emph{percents}, meaning a
#' value of 1.00 corresponds to a 1\% movement.
#' The columns are defined in the paper, but are roughly as follows:
#' \describe{
#'  \item{\code{cpi}}{The Consumer price index}
#'  \item{\code{gold}}{The spot price of gold}
#'  \item{\code{infl}}{Inflation as a percent?}
#'  \item{\code{tbill}}{The Treasury bill rate?}
#'  \item{\code{ltyld10}}{???}
#'  \item{\code{ltrate}}{???}
#'  \item{\code{callmoney}}{????}
#'  \item{\code{aaa}}{????}
#'  \item{\code{baa}}{????}
#'  \item{\code{corprate}}{????}
#'  \item{\code{corprate.i}}{????}
#'  \item{\code{sp500index}}{The closing value of the S&P 500 index.}
#'  \item{\code{sp500d12}}{????}
#'  \item{\code{sp500e12}}{????}
#'  \item{\code{vwm}}{????}
#'  \item{\code{vwx}}{????}
#'  \item{\code{svar}}{????}
#'  \item{\code{bkmk}}{????}
#'  \item{\code{ntis}}{????}
#'  \item{\code{eqis}}{????}
#'  \item{\code{csp}}{????}
#'  \item{\code{cay}}{????}
#'  \item{\code{ik}}{????}
#' }
#' @references 
#' Welch, Ivo and Goyal, Amit. "A Comprehensive Look at The Empirical Performance of Equity Premium Prediction." 
#' The Review of Financial Studies 21 , no. 4 (2007): 1455-1508. \url{https://doi.org/10.1093/rfs/hhm014}
#' @source Ivo Welch's data page, \url{http://www.ivo-welch.info/professional/goyal-welch/}. 
#' @author Steven E. Pav \email{steven@@sharperat.io}
#' @examples
#' \dontrun{
#' data(gw)
#' str(gw)
#' }
"gw"

#for vim modeline: (do not edit)
# vim:fdm=marker:fmr=FOLDUP,UNFOLD:cms=#%s:syn=r:ft=r
