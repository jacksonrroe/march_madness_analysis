library(tidyverse)
library(dplyr)
library(ggthemes)

championship <- joined_data |> 
  ggplot(aes(x = WSEED, y = times_won / 37)) + 
  geom_col(color = "honeydew4", fill = "honeydew3") + 
  scale_x_continuous(breaks = c(1, 2, 3, 4, 5, 6, 7, 8)) +
  scale_y_continuous(labels = scales::percent_format()) + 
  theme_bw() + 
  labs(title = "Percent Chance of Each Seed Winning the National Championship", 
       subtitle = "It is very likely a 1 seed will win, and no 5 seed has ever won", 
       x = "Seed", 
       y = "Percent Chance of Winning",
       caption = "Source: kaggle (Woody Gilbertson; 2021)")

write_rds(x = championship, file = "championship.rds")
