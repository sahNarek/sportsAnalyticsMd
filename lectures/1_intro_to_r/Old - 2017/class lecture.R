install.packages("ggplot2")
library(ggplot2)
?min
??qplot
data(mtcars)
str(mtcars)
New<-mtcars[mtcars$am==1,]
View(New)
New1<-mtcars[mtcars$mpg>19,]
N<-mtcars[mtcars$am !=1,]
mtcars[order(mtcars$mpg, decreasing=TRUE),]
View(mtcars)
mtcars<-mtcars[order(mtcars$mpg, decreasing=FALSE),]
View(mtcars)
census_csv<-read.csv("Census R.csv")
str(census_csv)
census_csv$sex<-factor(census_csv$sex, levels=c(1,2), labels=c("Male", "Female"))
census_csv$happy<-ordered(census_csv$happy, levels=c(1,2,3), labels=c("Very Happy", 
                  "Pretty Happy", "Not too Happy"), exclude=c(8,9))

str(census_csv$happy)
census_csv$age[census_csv$age==99]<-NA
str(census_csv$age)
