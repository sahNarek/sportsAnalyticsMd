library(dplyr)
library(SportsAnalytics270)
library(stringr)

data("mlb_salary")

salaries_19_21 <- read.csv("mlbSalaries.csv")
salaries_2022 <- read.csv("mlbSalaries_2022.csv")

salaries_19_21 <- salaries_19_21 %>% select(-c("playerID"))
salaries_2022 <- salaries_2022 %>% select(-c(1))
salaries_2022 <- salaries_2022[!is.na(salaries_2022$salary),]
salaries_2022$salary <- round(salaries_2022$salary)

salaries <- rbind(salaries_19_21, salaries_2022)

team_name_converter <- function(team_name){
  return(team_name %>% str_replace_all("-", " ") %>% str_to_title())
}


clean_scrapped_data <- function(salaries){
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
  
  return(new_salaries)
}

new_salaries <- clean_scrapped_data(salaries)

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

mlb_salary <- rbind(mlb_salary,new_salaries) %>% arrange(Season)

mlb_salary$Avg <- round(mlb_salary$Avg)

save(mlb_salary, file = "mlb_salary.rda")


