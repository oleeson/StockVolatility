library(tseries)
pgdata <- get.hist.quote('pg', quote="Close")
#trying URL 'http://chart.yahoo.com/table.csv?s=^gspc&a=0&b=02&c=1991&d=10&e=12&f=2016&g=d&q=q&y=0&z=^gspc&x=.csv'
#downloaded 498 KB
#time series ends   2016-11-11
#log of lagged data minus log of data finds our time series returns
pgreturn <- log(lag(pgdata)) - log(pgdata)
length(pgreturn)

#find volatility. standard deviation of pgreturn times square root of 250
#250 is number of trading days/year
pgvol <- sd(pgreturn)*sqrt(250)*100
pgvol

#estimate volatility for varying ds, or weights
volest <-vol(10,pgreturn)
volest2 <-vol(30,pgreturn)
volest3 <-vol(100,pgreturn)

#plot volatilities 
plot(volest,type="l", col = "pink4")
lines(volest2, type="l", col="palevioletred1")
lines(volest3, type="l", col="rosybrown2")