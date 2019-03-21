# Code from the Computer Statistics lab, group 2 (Tuesday 10:15)
# 2nd set of exercises, labs 2 and 3.
# If you have any questions, feel free to contact me - Mateusz.
#

# A few words about factors

x <- 11:22
y <- letters[1:10]
mode(x)
mode(y)
?letters
factor_1 <- as.factor(as.character(x))
factor_2 <- as.factor(y)
class(factor_1)

factor_1
z <- factor_1[1:5]
z

levels(z)

# Writing your own functions
?which.max

actual_mode <- function(input_vector) {
  counts <- which.max(table(input_vector))
  return(table(input_vector)[counts])
  # Alternatively:
  # df <- as.data.frame(table(input_vector))
  # as.character(df[which.max(df$Freq), 1, drop = T])
}

actual_mode(factor_1)

tab1 <- table(factor_1)

rm(tab1)
counts <- which.max(table(factor_1))
counts
rm(counts)
?table

# Reading csv files.
# Please remember about the dec argument

cars <- read.table("cars.csv", sep = ";",
                   header = T, dec = ",")

# Ex. 2.1.

names <- c("Mary",  "Mary",  "Mary",  "John",  "Kate",
  "Mary",  "Peter",  "Peter",  "John",  "John",
  "Peter",  "Kate",
  "Peter",  "John",  "John",  "Mary",
  "Mary",  "Mary",  "Kate",  "John",
  "John",  "Mary",  "John",  "Mary",
  "Mary",  "John")
# Getting counts and proportions
table(names)
?round
round(prop.table(table(names)), digits = 2)
prop.table(table(names))*100
# Barplot
barplot(table(names))

# Ex. 2.2.

# Making new vectors
cars
lphk <- (100*3.78)/(cars$mpg*1.6)
lphk

# Getting help
??"cut"
?cut

cut_lphk <- cut(lphk$mpg,
                breaks = c(-Inf, 7, 10, Inf),
                right = F)
barplot(table(cut_lphk))
# Histogram
hist(lphk$mpg)

# Ex. 2.5.

share_prices <- c(23.30,  24.50,  25.30,  25.30,  24.30,  24.80,  25.20,  24.50,  24.60,  24.10,
                  24.30,  26.10,  23.10,  25.50,  22.60,  24.60,  24.30,  25.40,  25.20,  26.80)
# Plot in time
plot(share_prices) # or
plot(1:20, share_prices)
# Any vector can go as "x" argument
plot(2000:2019, share_prices)

# Ex. 2.4.

# Add a column to a data frame
cars$mpgl100km <- (100*3.78)/(cars[, 'mpg']*1.6)
head(cars)

# Drawing boxplots
boxplot(mpgl100km ~ origin, data = cars)
# Place three plots on one panel
par(mfrow = c(1, 3))
hist(cars[cars$origin == 1 & cars$price < 10000, 'mpgl100km'], ylim = c(0, 18))
hist(cars[cars$origin == 2 & cars$price < 10000, 'mpgl100km'], ylim = c(0, 18))
hist(cars[cars$origin == 3 & cars$price < 10000, 'mpgl100km'], ylim = c(0, 18))
# Summary statitics
summary(cars[cars$origin == 1 & cars$price < 10000, 'mpgl100km'])
summary(cars[cars$origin == 2 & cars$price < 10000, 'mpgl100km'])
summary(cars[cars$origin == 3 & cars$price < 10000, 'mpgl100km'])
# Apply function by group
tapply(cars$mpgl100km, cars$origin, mean, na.rm = T)

# Ex. 2.6.

births <- data.frame(
  mother_age = c("19  yrs  and  less", "20-24", "25-29",
                 "30-34", "35-39", "40-44", "45  yrs  and  more"),
  live_births = c(19230, 93569, 139853, 86825, 28487, 5975, 305)
)

births$live_births_prop <- births$live_births/sum(births$live_births)*100

# Draw a piechart
pie(births$live_births, births$mother_age)
# Barplot with names.arg argument
barplot(births$live_births_prop, names.arg = births$mother_age)
# Dotchart
dotchart(births$live_births[order(births$live_births)],
         births$mother_age[order(births$live_births)])

# Ex. 2.7.

old_lady <- c(26,  22,  26,  20,  25,  NA,  21,  20,  28,  27,  26,  38,
  23,  30,  21,  25,  26,  23,  25,  27,  27,  NA,  25,  22,  23,
  31, 19,  NA,  25,  25,  23,  25,  24)

hist(old_lady)
# Remember about missing values while computing the mean.
mean(old_lady, na.rm = T)
summary(old_lady)
# Stem-and-leaf plot
stem(old_lady)
boxplot(old_lady)

summary(old_lady)

# Ex. 2.8.

q1 <- quantile(old_lady, 0.25, na.rm = T)
q2 <- quantile(old_lady, 0.5, na.rm = T)
q3 <- quantile(old_lady, 0.75, na.rm = T)
q4 <- quantile(old_lady, 1, na.rm = T)

wasSheLate <- cut(old_lady[!is.na(old_lady)],
                  breaks = c(-Inf, q1,
                             q2 - 0.5, q2 + 0.5, q3, q4),
                  labels=c("2Early", "Early", "Punctual", "Late", "2Late"))
wasSheLate
# Alternatively, as an exercise in operations on factors:
# not_punct <- cut(old_lady[!is.na(old_lady) & old_lady != median(old_lady, na.rm = T)],
# breaks = c(0, q1, q2, q3, q4),
# labels=c("2Early", "Early", "Late", "2Late"))
# punct <- old_lady[old_lady == median(old_lady, na.rm = T) & !is.na(old_lady)]
# punctual <-as.factor(rep("Punctual!", times = length(punct)))
#
# old_lady_cut <- factor(c(as.character(not_punct),
#                          as.character(punctual)),
#                        levels = c(levels(wasSheLate),
#                                   levels(punctual)))
# barplot(table(old_lady_cut))
