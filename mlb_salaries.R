library(dplyr)
library(SportsAnalytics270)

data("mlb_salary")

salaries <- read.csv("mlbSalaries.csv")

team_name_converter <- function(team_name){
  return(team_name %>% str_replace_all("-", " ") %>% str_to_title())
}

new_salaries = salaries %>% 
                group_by(team, year) %>%
                summarise("Team" = team, "Current" = sum(salary), 
                          "Avg" = mean(salary),  
                          "Median" = median(salary), "Season" = year) %>% 
                mutate("Team" = ifelse(team == "st-louis-cardinals", "St. Louis Cardinals", team_name_converter(team))) %>%
                mutate("Team" = ifelse(team == "los-angeles-angels", "Los Angeles Angels of Anaheim", team_name_converter(team))) %>%
                mutate("Team" = ifelse(team == "tampa-bay-rays", "Tampa Bay Devil Rays", team_name_converter(team)))

new_salaries = new_salaries[,3:7]

new_salaries <- as.data.frame(new_salaries)

new_salaries

is.contained=function(vec1,vec2){
  x=vector(length = length(vec1))
  for (i in 1:length(vec1)) {
    x[i] = vec1[i] %in% vec2
    if(length(which(vec1[i] %in% vec2)) == 0) vec2 else 
      vec2=vec2[-match(vec1[i], vec2)]
  }
  y=all(x==T)
  return(x)
}

is.contained(unique(new_salaries$Team), unique(mlb_salary$Team))




