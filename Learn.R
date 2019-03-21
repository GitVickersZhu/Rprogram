n <- 500
X <- rcauchy(n)
mn <- numeric(n)
class(mn)
md <- numeric(n)
for(i in 1:n){
  mn[i] <- mean(X[1:i])
  md[i] <- median(X[1:i])
}
plot(1:i, mn, type = "l", col = "blue", xlab = "", ylab = "", lty=1)
?plot
?lty
