# Get xy for a collection of butterflies

kaleidoscope <- function(t, lamda=4, butterflies=10, 
                         paint=c("red","orange","yellow","green","blue","purple")){
  
  df <- NULL
  for(i in seq(1:butterflies)){
    
    # Get x y for butterfly i
    butterflyi <- butterflyCurve(t=t, lamda=lamda)
    
    # Randomly place butterfly in 2D plane
    stretchFactorX <- sample(seq(-5,5,0.2), butterflies, replace = F)
    stretchFactorY <- sample(seq(-5,5,0.2), butterflies, replace = F)
    butterflyi$x <- butterflyi$x + stretchFactorX[i]
    butterflyi$y <- butterflyi$y - stretchFactorY[i]
    
    # Apply a random factor to tilt the butterfly configuration
    tiltFactor <- sample(c(1,4,10,13,14), 1)  # tried numbers up to 20; 2,6 removed from 12*pi/4 scenario
    tilt <- max(t)/ tiltFactor
    butterflyi$x <- with(butterflyi, x*cos(tilt) + y*sin(tilt))
    butterflyi$y <- with(butterflyi, x*sin(tilt) - y*cos(tilt))
    
    # Add supporting information & color for plotting
    butterflyi$id <- i
    butterflyi$tilt <- tiltFactor
    butterflyi$paint <- sample(paint, 1)
    
    # Stack i butterflies
    df <- rbind(df, butterflyi) 
  }
  
  return(df)
}
