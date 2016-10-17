grenander <-
function(F, type=c("decreasing", "increasing"))
{
  if( !any(class(F) == "ecdf") ) stop("ecdf object required as input!")
  type <- match.arg(type)
  if (type == "decreasing")
  {
    # find least concave majorant of ECDF
    ll = gcmlcm(environment(F)$x, environment(F)$y, type="lcm")
  }
  else
  {
    # find greatest convex minorant of ECDF
    l = length(environment(F)$y)
    ll = gcmlcm(environment(F)$x, c(0,environment(F)$y[-l]), type="gcm")
  }
  f.knots = ll$slope.knots
  f.knots = c(f.knots, f.knots[length(f.knots)])
  g = list(F=F,
       x.knots=ll$x.knots,
       F.knots=ll$y.knots,
       f.knots=f.knots)
  class(g) <- "grenander"
  return(g)
}

