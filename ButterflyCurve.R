# Temple Fay's Butterfly Curve
butterflyCurve <- function(t, lamda = 4){
  
  # Parametric equations
  x = sin(t) * (exp(cos(t)) - 2*cos(lamda*t) - sin(t/12)^5)
  y = cos(t) * (exp(cos(t)) - 2*cos(lamda*t) - sin(t/12)^5)
  
  # Rotated butterfly curve
  r <- exp(sin(t)) - 2*cos(lamda*t) + sin( (t-pi/2) / 12 )^5
  
  # Output
  return(data.frame(x=x, y=y, r=r))
}
