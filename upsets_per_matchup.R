library(tidyverse)
library(dplyr)
library(ggthemes)

upsets_per_matchup <- upset_data |> 
  ggplot(aes(x = WSEED, y = upsets_per_matchup/148)) + 
  geom_col(color = "black", fill = "gray") + 
  scale_x_continuous(breaks = c(10, 11, 12, 13, 14, 15, 16)) +
  scale_y_continuous(labels = scales::percent_format()) + 
  theme_hc() + 
  labs(title = "Percent Chance of an Upset in the First Round by Seed",          
       subtitle = "Only one 16 seed has beaten a 1 seed (UMBC vs. Virginia in 2018)",  
       x = "Seed", 
       y = "Percent Chance of Upset",
       caption = "Source: kaggle (Woody Gilbertson; 2021)")

write_rds(x = upsets_per_matchup, file = "upsets_per_matchup.rds")
