#' Compute the maximum likelihood estimate of Model U7
#'
#'  Vasicek (Ornstein-Uhlenbeck) Model
#'  mu = kappa (alpha-x);
#'  Sigma =eta;
#' @param x Observation of the state variable at time t
#' @param x0 Observation of the state variable at time t-1
#' @param del The time step between the current and previous observation
#' @param param The parameter 3-vector (kappa,alpha,eta)
#' @export output a list with a llk variable storing the result of the log likelihood calculation
#' @examples
#' ModelU7(0.4,0.3,0.1,c(0.1,0.3,0.2))
#'

ModelU7 <- function(x,x0,del,param)
{

  kappa <- param[1]
  alpha <- param[2]
  eta <- param[3]
  m <- 1

  output <- list()
  output$llk <- (-m/2)*log(2*pi*del) - log(eta)
  -((x - x0)^2/(2*eta^2))/del
  + ((-(x^2/2) + x0^2/2 + x*alpha - x0*alpha)*kappa)/eta^2
  - ((1/(6*eta^2))*(kappa*(-3*eta^2 + (x^2 + x0^2 + x*(x0 - 3*alpha) - 3*x0*alpha + 3*alpha^2)*kappa)))*del
  - (1/2)*(kappa^2/6)*del^2
  + (1/6)*((4*x^2+7*x*x0+4*x0^2-15*x*alpha-15*x0*alpha+15*alpha^2)*kappa^4)/(60*eta^2)*del^3

  return(output)

}

