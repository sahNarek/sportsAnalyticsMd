census_csv<-read.csv("Census R.csv")

my.table<-table(census_csv$sex)


barplot(my.table, ylab="Frequency",
        main="Sex Frequency Distribution", 
        xlab="Gender")

str(mtcars)

plot(mtcars$mpg, mtcars$hp, xlab="Miles Per Gallonn",
     ylab="Horsepower", main="Scatterplot for MPG and HP")

hist(census_csv$age, xlab="Age", 
     main="Histogram for Age", freq=FALSE)

# install.packages("ggplot2")
library(ggplot2)
data(diamonds)
str(diamonds)


set.seed(1982)
dsmall<-diamonds[sample(nrow(diamonds),400),]

str(dsmall)

qplot(carat, price, data=dsmall)

qplot(log(carat), log(price), data=dsmall)

qplot(carat, price, data=dsmall, shape=clarity, colour=clarity)


















