library("tidyverse")
library("dplyr")
library("ggplot2")
## Summary Information
prison_population <- read.csv("/Users/nancyliu/Documents/assignment-04-NancyLiu2002/Dataset about prison population per county and state.csv")
View(prison_population)

# How many total Black prisons have there been in the U.S. by 2010?
total_black_prison <- prison_population %>%
  filter(year == 2010) %>%
  filter(state == "CA") %>%
  summarize(total_black_prison_pop = sum(black_prison_pop, na.rm = TRUE))
total_black_prison 

# How many total White prisons have there been in the U.S. by 2010?
total_white_prison <- prison_population %>%
  filter(year == 2010) %>%
  summarize(total_white_prison_pop = sum(white_prison_pop, na.rm = TRUE))
total_white_prison

# Which state has had the highest number of Black prisons in 2010? 
state_highest_black_prison <- prison_population %>%
  filter(year == 2010) %>%
  filter(black_prison_pop == max(black_prison_pop, na.rm = TRUE)) %>%
  pull(state)
state_highest_black_prison 


# the difference of the total Black prisons population between the 2010 and 30 years before that
previous_black_prison <- prison_population %>%
  filter(year == 2010 - 30) %>%
  summarize(previous_black_prison = sum(black_prison_pop, na.rm = TRUE))
previous_black_prison

diff_black_prison <- total_black_prison - previous_black_prison
diff_black_prison

# the difference of the total White prisons population between the 2010 and 30 years before that
previous_white_prison <- prison_population %>%
  filter(year == 2010 - 30) %>%
  summarize(previous_white_prison = sum(white_prison_pop, na.rm = TRUE))
previous_white_prison

diff_white_prison <- total_white_prison - previous_white_prison
diff_white_prison

# dataset
num_obs_pop <- nrow(prison_population)
num_obs_pop
num_features_pop <- ncol(prison_population)
num_features_pop

