vol <- function(d, logrets){
  var=0
  lam=0
  varlist<- c()
  for (r in logrets){
    lam=lam*(1-1/d) +1
  var = (1 - 1/lam)*var + (1/lam)*r^2
    varlist <-c(varlist,var)
  }
  sqrt(varlist)
}