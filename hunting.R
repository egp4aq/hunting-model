#' Lot. Voltera Model
#'
#' function computes the rate of change of populations in a predictor prey interaction
#' @param t  time (days)
#' @param pop datatype list initial conditions; list with two values prey=number of prey and pred=number of predictor
#' @param pars datatype list  coefficient in Lotka-Voltera pars$rprey, pars$alpha, pars$eff, pars$pmort, pars$prey_thresh, pars$beta, pars$hunters
#'  \emph{rprey} is growth rate of prey population;
#'  \emph{eff} is the rate of ingestion of prey by predators
#'  \emph{alpha} is a interaction coefficient (higher values greater interaction
# ’  \emph{pmort}  mortality rate of predictor population
#' @examples
#' lotvod(t = 1, pop = list(1, 2), pop = list(0.5, 0.3, 0.2, 0.2))
#'
#' @return  lotvmod returns a list containing the following components
#' \describe{
#' \item{dprey}{rate of change of prey populutation}
#' \item{dpred}{rate of change of preditor populutation}
#' }

hunting <- function(t, pop, pars) {
  with(as.list(c(pars, pop)), {
    
    
    if (prey < prey_thresh) {
      hunting <- 0
      } else {
      hunting <- beta * hunters * prey
    }
      
    dprey <- rprey * (1 - prey / K) * prey - alpha * prey * pred - hunting
    dpred <- eff * alpha * prey * pred - pmort * pred
    return(list(c(dprey, dpred)))
    
  })
}
# lotvmod_hunting <- function(t, pop, pars) {
#   with(as.list(c(pars, pop)), {
#     
#     hunting <- if (prey >= prey_thresh) beta * hunters * prey
#     else 0 
#     
#     dprey <- rprey * (1 - prey / K) * prey - alpha * prey * pred - hunting
#     dpred <- eff * alpha * prey * pred - pmort * pred
#     return(list(c(dprey, dpred)))
#   })
# }