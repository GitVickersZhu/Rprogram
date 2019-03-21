unif_sample <- runif(1000)
hist(-log(1 - unif_sample))

pnorm(2) - pnorm(-2)

y <- runif(1000, min = 2, max = 2)
x <- runif(1000, min = -2, max = 2)
z <-  y <=(1/sqrt(2*pi))*exp(-(x^2)/2)
4*sum(z)
4*mean(z)
x[z]
curve(((1/sqrt(2*pi))*exp(-(x^2)/2)))
plot(x,y)


curve()











