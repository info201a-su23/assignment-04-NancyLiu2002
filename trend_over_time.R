
library("tidyverse")
library("dplyr")
library("ggplot2")
prison_population <- read.csv("/Users/nancyliu/Documents/Dataset about prison population per county and state.csv")


summarize_data <- prison_population %>%
  group_by(year) %>%
  summarize(total_black_prison_pop = sum(black_prison_pop, na.rm = TRUE),
            total_white_prison_pop = sum(white_prison_pop, na.rm = TRUE))

ggplot(data = prison_population) +
  geom_line(mapping = aes(x = year, y = black_prison_pop, color = "Black")) +
  geom_line(mapping = aes(x = year, y = white_prison_pop, color = "White")) +
  labs(title = "Trends of Total Prison Population over time by race", x = "Year", y = "Prison Population", color = "race")

