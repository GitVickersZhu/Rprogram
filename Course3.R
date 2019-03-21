pnorm(0)
?pnorm
# 0 at N(2,1)
pnorm(0, 2, 1)
?poisson
?ppois
dpois(3,1)
dexp(c(0, 1, 2), 1.2)


pr <- dbinom(0 : 8, 8, 0.25)
pr
class(pr)
round(pr, 3)

?dbinom
dbinom(0, 2, 0.1)
dbinom(4, 8, 0.25)


x <- seq(-5, 5, by = 0.1)
plot(x, pnorm(x), col = 1, main = "", ylab = "", type = "1")
?legend

legend("topleft", c("N(0,1)", "N(1,1)", "N(2,1)"), col = c(1, 2, 4), lty = 1)

n <- 1000
u <- runif(n)
x <- (1 - u)^(-0.5)
hist(x, prob = T, main = NA, ylim = c(0, 1.2), breaks = 100)
lines(density(x), col = "blue")
curve(2/x^3, add = T, col = "red", from = 1)











test <- (1:10) %% 2 == TRUE
yes <- rep("yes", 10)
no <- rep("no", 10)
ret <- ifelse(test, yes, no)
ret


for(i in 1:5)
{
  print(i)
}

i <- 0
while (2^i < 100) {
  i <- i + 1
}
print(c(i, 2^i))
i
print(c(i - 1, 2^(i - 1)))
i <- 0
sumEven <- 0
while (i < 10) {
  i <- i + 1
  if (i%%2 == 1)
    next
  print(i)
  sumEven <- sumEven + i
}
  ?sd
results <- replicate(50, {
  sample <- rnorm(10, 0, 1)
  sd(sample)
})
mean(results)  
  