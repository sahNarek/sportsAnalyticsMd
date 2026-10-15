#Getting working directory
data(mtcars)
str(mtcars)
dim(mtcars)[2]
nrow(mtcars)
ncol(mtcars)
View(mtcars)
head(mtcars, n=5)
tail(mtcars, n=5)
mtcars$mpg


a<-c(5,7,8)
a

mean(x<-c(5,8,9,6,7))

new_df<-mtcars[,c(1:3,7)]
dim(new_df)
names(mtcars)
new_df1<-mtcars[,c("mpg", "hp", "wt")]

min(mtcars$mpg)
which.min(mtcars$mpg)
rownames(mtcars)[which.max(mtcars$hp)]

mean(mtcars$hp)
median(mtcars$hp)
sd(mtcars$hp)

range(mtcars$hp)
range(mtcars$hp)[2]-range(mtcars$hp)[1]

max(mtcars$hp)-min(mtcars$hp)

summary(mtcars[,1:5])



