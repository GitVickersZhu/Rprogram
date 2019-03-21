samples <- lapply(1:10,
                  function(x) rbinom(100, 1, 0.5))
samples

confidence_interval <- lapply(
  samples,
  function(sample){
    phat <- mean(sample)
    stand_dev <- sqrt(phat*(1 - phat))
    z <- qnorm(1 - 0.1/2)
    n <- length(sample)
    
    data.frame(lower = phat - (stand_dev*z)/sqrt(n), 
              higher = phat + (stand_dev*z)/sqrt(n))
  }
)

conf_int <- do.call("rbind", confidence_interval)
conf_int


?rbinom
