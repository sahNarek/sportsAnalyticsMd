data("mtcars")
str(mtcars)
dim(mtcars)
length(mtcars)
nrow(mtcars)
ncol(mtcars)
head(mtcars, n=3)
tail(mtcars, n=5)
New<-mtcars[,1:3]
str(New)
New2<-mtcars[,c("mpg","hp","wt")]
str(New2)
names(New2)
mtcars[[10]]
mtcars[[10,3]]
min(mtcars$mpg)
which.min(mtcars$mpg)
mtcars[15,]
mtcars$hp[[19]]
min(mtcars$hp)

census_csv<-read.csv("Census R.csv")
names(census_csv)
str(census_csv)


##subseting the data
New<-mtcars[mtcars$am==1,]
New1<-mtcars[mtcars$mpg>=19,]
###If you need to subset the text, use ' ' 

New<-mtcars[mtcars$am!=1,]  ##is not equal

## sorting the dataset
mtcars[order(mtcars$mpg, decreasing=TRUE),] ## by decreasing order will just print the sorted dataframe
mtcars<-mtcars[order(mtcars$mpg, decreasing=FALSE),] ## by increasing order - will save the sorted dataframe

# sort by column number





