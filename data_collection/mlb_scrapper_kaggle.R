# install.packages("rvest")
library(rvest)

#Define functions to read the links
readLink <- function(link){
  out <- tryCatch(
    {
      con <- file(link)
      on.exit(close(con))
      readLines(con, warn = F, n = 4000)#n = 4500 fails
    },
    error=function(e){#For links that don't exist, replace link with "No games scheduled"
      c("")
    },
    warning=function(w){
      c("")
    }
  )
  return(out)
}

#Extract all matches as list
allMatches <- function(string, pattern, playerCount = 100){ #https://en.wikipedia.org/wiki/Major_League_Baseball_rosters#:~:text=Each%20team%20is%20still%20allowed,end%20of%20the%20regular%20season.
  return(unlist(regmatches(string, gregexpr(pattern, string)))[seq(1,playerCount)])
}


#Now do the above for all teams and all years from 2019 to 2021
allTeamsYears <- function(team, year){
  link <- paste0("https://www.spotrac.com/mlb/", team, "/payroll/", year, "/")
  htmlLines <- readLink(link)
  
  #Extract Names Raw
  namesPattern <- "[[:punct:]]a[[:space:]]href[[:punct:]]{2}https[[:punct:]]{3}www.spotrac[].]com[/]redirect[/]player[/][[:digit:]]{1,}[/][[:punct:]]{2}[[:space:][:alpha:].']{1,}"
  namesVectorRaw <- allMatches(htmlLines, namesPattern)
  
  #Extract Names Clean
  #namesPattern <- "[[:upper:]]{1}[[:alpha:][:space:]]{1,}"
  namesPattern <- "[[:upper:]]{1}.{1,}"
  namesVectorClean <- allMatches(namesVectorRaw, namesPattern)
  
  #Extract Salaries
  salaryPattern <- "Total Adjusted Salary including base salary and bonuses[[:punct:][:space:]]{4}[[:digit:],]{1,}"
  salaryVectorRaw <- allMatches(htmlLines, salaryPattern)
  
  #Extract Salaries Clean
  salaryPattern <- "[$]{1}[[:digit:],]{1,}"
  salaryVectorClean <- allMatches(salaryVectorRaw, salaryPattern)
  salaryVectorClean <- gsub("[$,]{1}", "", salaryVectorClean)
  
  return(cbind.data.frame(year, team, namesVectorClean, as.integer(salaryVectorClean)))
}

#Define the teams and years vectors
start <- 2021
end <- 2022
teams <- rep(c("arizona-diamondbacks","atlanta-braves", "baltimore-orioles", "boston-red-sox", "chicago-cubs", "chicago-white-sox", "cincinnati-reds",
               "cleveland-indians", "colorado-rockies", "detroit-tigers", "houston-astros", "kansas-city-royals", "los-angeles-angels", "los-angeles-dodgers",
               "miami-marlins", "milwaukee-brewers", "minnesota-twins", "new-york-mets", "new-york-yankees", "oakland-athletics", "philadelphia-phillies",
               "pittsburgh-pirates", "san-diego-padres", "san-francisco-giants", "seattle-mariners", "st-louis-cardinals", "tampa-bay-rays", "texas-rangers",
               "toronto-blue-jays", "washington-nationals"), each = (end-start+1))
years <- rep(seq(start,end), length(teams)/(end-start+1))
print("should be true:")
length(teams) == length(years)

#Now loop over the vectors to create the dataframe
df <- c()
for (i in seq(1, length(teams))){
  df <- rbind.data.frame(df, allTeamsYears(team = teams[i], year = years[i]))
}

colnames(df) <- c("year", "team", "name", "salary")

write.csv(df, "mlbSalaries_2022.csv")
