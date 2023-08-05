
library("tidyverse")
library("dplyr")
library("ggplot2")

prison_population <- read.csv("/Users/nancyliu/Documents/assignment-04-NancyLiu2002/Dataset about prison population per county and state.csv") 
view(prison_population)

summarize_data <- prison_population %>%
  group_by(year) %>%
  filter(state == "CA") %>%
  summarize(total_black_prison_pop = sum(black_prison_pop, na.rm = TRUE),
            total_prison_pop = sum(total_prison_pop, na.rm = TRUE))

chart_2 <- ggplot(data = prison_population) +
  geom_point(mapping = aes(x = year, y = black_prison_pop, color = "Black")) +
  geom_point(mapping = aes(x = year, y = total_prison_pop, color = "Total")) +
  labs(title = " Black Prison Population vs. Total Prison Population over time in California", x = "Year", y = "Prison Population", color = "group")
print(chart_2)

