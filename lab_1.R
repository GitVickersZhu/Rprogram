# Code from the Computer Statistics lab, group 2 (Tuesday 10:15)
# First set of exercises, first lab.
# If you have any questions, feel free to contact me - Mateusz.
#

# How to assign to a variable in R?
x <- 1:10
# Everything is a vector (if it's 1-dimensional). How to create vectors?
y <- seq(1, 11, by = 2)
z <- seq(0, 1, length = 100)
xy <- c(x, y, 10, 21:30)
?seq
xy
# All operations are vectorised
x + seq(0, 1, length = 10)
# Beware of recycling
x + c(1, 2, 3)
x + rep(1:2, times = 5)

# Anything  you do is a function call. Functions can be fun.
`+` <- function(x, y) x - y
1 + 1
remove('+')
# Summary functions (AKA function that turn a vector into a singel number)
sum(1:10)
cumsum(1:10)
?cumsum
# Logical vectors
T
F
# USE
TRUE
FALSE
# because they can't be overwritten

# Character vectors
letters
LETTERS

paste(letters, LETTERS, sep = "///")

# Integer vectors
xx <- 1:10L
10L
xx
# Types are dynamic, no problem assigning string to an integer vector.
xx <- "xxx"

# Missing values and howto find them
xxx <- c(1:10, NA)
xxx < 5
is.na(xxx)

# Indexing
xxx[xxx > 5]
xxx[1:5]

vec <- c(23, 51, 0, -2, 32, 62, 12, 1.2, 35.3, -9, 0)
vec[vec >= 0]
length(vec)
vec[seq(1, length(vec), by = 2)]
vec[vec == 0] <- NA
sort(vec, decreasing = T)

# Matrices are two dimensional, so require to sets of indices.
mmm <- matrix(c(1:100), nrow = 10, byrow = T)
mmm[1, ]
mmm[, 1]
mmm[1, 1]
mmm[1:2, 1]
mmm[mmm[1, ] %% 2 == 0, 1]
mmm
# List can contain object of any type
ll <- list(
  l1 = x,
  l2 = mmm,
  l3 = vec
)

# How to index list
ll$l1
# A vector
ll[[1]]
# A list
ll[1]
# Remember to use double square brackets

ll[2]
ll[[2]]

# Data frames
data('iris')
class(iris)
head(iris, 10)
# Data frames are actually list of vector, so they can be indexed like list and vector
length(iris$Sepal.Length)
# They have two dimensions, just like matrices
iris[1, ]

iris[iris$Species == "setosa", 1:2]

# Go beyond base R
library(dplyr)
library(tidyverse)
