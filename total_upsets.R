library(tidyverse)
library(dplyr)
library(ggthemes)

total_upsets <- all_upsets |> 
  ggplot(aes(x = YEAR, y = upsets_per_year)) + 
  geom_col() + 
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE) + 
  scale_x_continuous(breaks = c(1985, 1990, 1995, 2000, 2005,                                     2010, 2015, 2020)) + 
  scale_y_continuous(breaks = c(0, 5, 10, 15, 20)) + 
  labs(title = "Total Upsets Per Year in March Madness", 
       subtitle = "Seems to be a slow increase in the number of upsets over time, no\ntournament during 2020 due to the Covid-19 pandemic", 
       x = "Year", 
       y = "Number of Upsets", 
       caption = "Source: kaggle (Woody Gilbertson; 2021)") +
  theme_bw()

write_rds(x = total_upsets, file = "total_upsets.rds")
