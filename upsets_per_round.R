library(tidyverse)
library(dplyr)
library(ggthemes)

upsets_per_round <- rounds |> 
  mutate(upset_chance = upsets_per_round/total_games) |> 
  ggplot(aes(x = ROUND, y = upset_chance)) + 
  geom_line(color = "blue") + 
  scale_x_continuous(breaks = c(1, 2, 3, 4, 5, 6)) +
  scale_y_continuous(labels = scales::percent_format()) + 
  theme_bw() + 
  labs(title = "Percent Chance of Upset in Each Round of March Madness",
       subtitle = "Upsets are common earlier in the tournament, but higher seeds tend to win in the later rounds", 
       x = "Round", 
       y = "Percent Chance of Upset",
       caption = "Source: kaggle (Woody Gilbertson; 2021)")

write_rds(x = upsets_per_round, file = "upsets_per_round.rds")
