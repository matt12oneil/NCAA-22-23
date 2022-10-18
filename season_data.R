library(tidyverse)

if (!requireNamespace('devtools', quietly = TRUE)){
  install.packages('devtools')
}
devtools::install_github("andreweatherman/toRvik") 

library(toRvik)
library(hoopR)

clean_team <- function(df, team_name) {
  (case_when(team_name == 'American' ~ 'American University',
             team_name == 'Arkansas Pine Bluff' ~ 'Arkansas-Pine Bluff',
             team_name == 'Bethune Cookman' ~ 'Bethune-Cookman',
             team_name == 'Cal Baptist' ~ 'California Baptist',
             team_name == 'Cal St. Bakersfield' ~ 'CSU Bakersfield',
             team_name == 'Cal St. Fullerton' ~ 'CSU Fullerton',
             team_name == 'Cal St. Northridge'~ 'CSU Northridge',
             team_name == 'Connecticut' ~ 'UConn',
             team_name == 'FIU' ~ 'Florida International',
             team_name == 'Gardner Webb' ~ 'Gardner-Webb',
             team_name == 'Grambling St.' ~ 'Grambling',
             team_name == 'Hawaii' ~ "Hawai'i",
             team_name == 'Illinois Chicago' ~ 'UIC',
             team_name == 'LIU' ~ 'Long Island University',
             team_name == 'Louisiana Monroe' ~ 'UL Monroe',
             team_name == 'Loyola MD' ~ 'Loyola (MD)',
             team_name == 'Massachusetts' ~ 'UMass',
             team_name == 'McNeese St.' ~ 'McNeese',
             team_name == 'Miami FL' ~ 'Miami',
             team_name == 'Miami OH' ~ 'Miami (OH)',
             team_name == 'Mississippi' ~ 'Ole Miss',
             team_name == 'N.C. State'~ 'NC State',
             team_name == 'Nebraska Omaha' ~ 'Omaha',
             team_name == 'Nicholls St.' ~ 'Nicholls',
             team_name == 'Penn' ~ 'Pennsylvania',
             team_name == 'Sam Houston St.' ~ 'Sam Houston',
             team_name == 'San Jose St.' ~ "San José State",
             team_name == 'Seattle' ~ 'Seattle U',
             team_name == 'Southeastern Louisiana' ~ 'SE Louisiana',
             team_name == 'St. Francis NY' ~ 'St. Francis (BKN)',
             team_name == 'St. Francis PA' ~ 'St. Francis (PA)',
             team_name == 'St. Thomas' ~ 'St. Thomas - Minnesota',
             team_name == 'Tarleton St.' ~ "Tarleton",
             team_name == 'Tennessee Martin' ~ 'UT Martin',
             team_name == 'Texas A&M Corpus Chris' ~ 'Texas A&M-CC',
             team_name == 'UMKC' ~ 'Kansas City',
             team_name == 'USC Upstate' ~ 'South Carolina Upstate',
             team_name == 'Grambling St.' ~ 'Grambling',
             str_sub(team_name,start = -1) == '.' ~ paste0(str_sub(team_name, end = -2),'ate'),
                                                    TRUE ~ as.character(team_name))) 
  }

bart_ratings() %>%
  View()

teams <- espn_mbb_teams()

ratings <- kp_pomeroy_ratings(min_year = 2023) %>%
  mutate(team = clean_team(team_name = .$team))

clean_team(ratings, team_name = ratings$team)


