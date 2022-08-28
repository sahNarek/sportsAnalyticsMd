library(dplyr)
library(SportsAnalytics270)
library(stringr)

data("mlb_salary")

salaries <- read.csv("mlbSalaries.csv")

team_name_converter <- function(team_name){
  return(team_name %>% str_replace_all("-", " ") %>% str_to_title())
}

new_salaries = salaries %>% 
                group_by(team, year) %>%
                summarise("Current" = sum(salary), 
                          "Avg" = mean(salary),  
                          "Median" = median(salary))

new_salaries$team <- lapply(new_salaries$team, team_name_converter)

new_salaries$team[new_salaries$team == 'St Louis Cardinals'] <- 'St. Louis Cardinals'
new_salaries$team[new_salaries$team == 'Tampa Bay Rays'] <- 'Tampa Bay Devil Rays'
new_salaries$team[new_salaries$team == 'Los Angeles Angels'] <- 'Los Angeles Angels of Anaheim'

new_salaries$"Opening.day" <- new_salaries$Current

colnames(new_salaries) <- c("Team", "Season", "Current", "Avg", "Median", "Opening.day")
changed_order <- c("Team", "Opening.day", "Current", "Avg", "Median", "Season")
new_salaries <- new_salaries[, changed_order]

new_salaries

is.contained=function(vec1,vec2){
  x=vector(length = length(vec1))
  for (i in 1:length(vec1)) {
    x[i] = vec1[i] %in% vec2
    if(length(which(vec1[i] %in% vec2)) == 0) vec2 else
      vec2=vec2[-match(vec1[i], vec2)]
    if(x[i] == FALSE){
      print(vec1[i])
    }
  }
  y=all(x==T)
  return(y)
}

is.contained(unique(new_salaries$Team), unique(mlb_salary$Team))

salaries_1999_2021 <- rbind(mlb_salary, new_salaries) %>% arrange(Season)

save(salaries_1999_2021, file="mlb_salaries_99_21.rda")
