library(tidyverse)
library(dplyr)
library(ggthemes)

final_four <- joined_data |> 
  ggplot(aes(x = WSEED, y = seed_total / 148)) +
  geom_col(fill = "steelblue4", color = "steelblue4") +
  scale_x_continuous(breaks = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11)) +
  scale_y_continuous(labels = scales::percent_format()) + 
  theme_stata() + 
  labs(title = "Percent Chance of Making Final Four by Seed", 
       subtitle = "Each 1 seed has over a 40% chance of making the Final Four, \nno seed ranked 12+ has ever made the final four", 
       x = "Seed", 
       y = "Percent Chance of Making Final Four",
       caption = "Source: kaggle (Woody Gilbertson; 2021)")

write_rds(x = final_four, file = "final_four.rds")
