

library("tidyverse")
library("dplyr")
library("ggplot2")
library("scales")
library("maps")

prison_population <- read.csv("/Users/nancyliu/Documents/assignment-04-NancyLiu2002/Dataset about prison population per county and state.csv") 
view(prison_population)

summarize_data <- prison_population %>% 
  filter(year == 2010) %>%
  group_by(state) %>%
  summarise(black_prison_pop = sum(black_prison_pop, na.rm = TRUE))

state_shape <- map_data("state")
view(state_shape)

state_naming <- setNames(state.name, state.abb)
summarize_data$full_name <- state_naming[summarize_data$state]
state_naming

total_pop <- summarize_data %>% 
  mutate(full_name = tolower(full_name))
prison_state_shape <- left_join(total_pop, state_shape, by = c("full_name" = "region"))



prison_pop_map <- ggplot(data = prison_state_shape) +
  geom_polygon(mapping = aes(x = long, y = lat, group = group, fill = black_prison_pop)) +
  scale_fill_continuous(low = "grey", high = "red", labels = label_number()) +
  labs(title="Black Prison Population by State in 2010",
       fill="Black Prison Population") + 
  coord_map()
prison_pop_map

