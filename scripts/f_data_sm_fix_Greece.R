library(SportsAnalytics270)
f_data_sm <- f_data_sm %>%
  mutate(HOMETEAM = replace(HOMETEAM, HOMETEAM == 'Apollon Apollon', 'Apollon'),
         AWAYTEAM = replace(AWAYTEAM, AWAYTEAM == 'Apollon Apollon', 'Apollon'))

save(f_data_sm, file = "f_data_sm.rda") 
