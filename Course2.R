votes <- c("Mary"," Mary","Mary","John"
          ,"Kate","Mary","Peter","Peter",
          "John","John","Peter","Kate","Peter", 
          "John","John","Mary","Mary","Mary","Kate", 
          "John","John","Mary","John","Mary","Mary");
votes <- factor(votes);
length(votes);
(votesTab <- table(votes))
votes
votesTab

prop.table(votesTab)
?name

cands <- names(votesTab)

NumVotes <- as.vector(votesTab)
print(cands)
cands[2];NumVotes[2]
rep(cands,NumVotes)
pie(NumVotes,labels = cands)
barplot(votesTab, main = "Election 2012")

maxVotes <- function(input_vector){
  counts <- which.max(table(input_vector))
  return(table(input_vector)[counts])
}
maxVotes(NumVotes)
?table

?range

votesTab[which.max(votesTab)]



 cars <- read.table("cars.csv",head = T, sep = ";", dec = ",")
head(cars)
length(cars$mpg)
mpg <- cars$mpg[!is.na(cars$mpg)]
fc <- 3.785*100/(mpg*1.609);
print(fc, digits = 3)
fuelcons <- character(length(fc));
?character
fuelcons[fc<7] <- "small";
fuelcons[fc>=7 & fc<10] <- "medium";
fuelcons[fc>=10] <- "large";
fuelcons <- factor(fuelcons);
print(fuelcons)
fuelcons
fcTab <- table(fuelcons); print(fcTab)
barplot(prop.table(fcTab),names = as.vector(prop.table(fcTab)))
?round



mean(fc)
quantile(fc, c(0.1, 0.5, 0.9))
par(xpd = TRUE)

h <- hist(fc, breaks = 5, labels = T, col = "gray", main = NA)

h <- hist(fc, prob = T, main = NA)
h
intWidth <- h$breaks[2]-h$breaks[1]
numClass <- length(h$mids)
polylineX <- c(h$mids[1]-intWidth, h$mids, h$mids[numClass]+intWidth);
polylineY <- c(0, h$density, 0)
lines(polylineX,polylineY,col = "blue")
?lines
stem(fc);
fc <- 3.785 * 100/(cars$mpg * 1.609)
head(cars$carmakers)
prod <- factor(cars$origin)
levels(prod) <- c("America", "Europe", "Japan")
fcA <- fc[prod == "America" & cars$price < 10000]
fcB <- fc[prod == "Europe" & cars$price < 10000]
fcC <- fc[prod == "Japan" & cars$price < 10000]

x02pi <- seq(0, 2*pi, length = 1000)
x02pi
?par


library("datasets")
morley# print
class(morley)
speed <- as.data.frame(table(morley[morley$Expt == 1, 3]))
speed
as.character(speed$Var1[which.min(speed$Var1)],drop = T)
hist(morley[morley$Expt == 1,'Speed'])
morley[morley$Expt == 1,"Speed"]
?table






