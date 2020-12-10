# Section-5- Part-1 
# Using dplyr and ggplot2 together.
library(dplyr)
library(ggplot2)
# Column chart
demo= read.csv("demographics.csv")
# create a column chart that represents the average car price
# by car category.
demo %>% 
  group_by(carcat) %>%
  summarise(avgpr= mean(carpr, na.rm = T)) %>%
  ggplot(aes(x= carcat, y= avgpr)) +
  geom_col(fill= "darkblue")
# geom_bar cannot be used when y axis is defined. 
demo %>% 
  group_by(carcat) %>%
  summarise(maxpr= max(carpr, na.rm = T)) %>%
  ggplot(aes(x= carcat, y= maxpr)) +
  geom_col(fill= "darkblue")
demo %>%
  group_by(gender) %>%
  summarise(avginc= mean(income, na.rm= T)) %>%
  ggplot(aes(x= gender, y= avginc, 
             fill= gender))+
  geom_col()
demo %>%
  group_by(gender) %>%
  filter(carcat== "Luxury") %>%
  summarise(avginc= mean(income, na.rm= T)) %>%
  ggplot(aes(x= gender, y= avginc, 
             fill= gender))+
  geom_col()
# Mean Plot chart
# a mean plot chart for average income by education level.
demo %>%
  group_by(educ) %>%
  summarise(avginc= mean(income, na.rm = T)) %>%
  ggplot(aes(x= educ, y= avginc, group= 1))+ # There is one grouping variable.
  geom_line(colour= "darkred")

demo %>%
  group_by(gender) %>%
  summarise(avgpr= mean(carpr, na.rm = T)) %>%
  ggplot(aes(x= gender, y= avgpr, group= 1))+ # There is one grouping variable.
  geom_line(colour= "darkred")

demo %>%
  group_by(gender) %>%
  filter(income>70) %>%
  summarise(avgpr= mean(carpr, na.rm = T)) %>%
  ggplot(aes(x= gender, y= avgpr, group= 1))+ # There is one grouping variable.
  geom_line(colour= "darkred")

demo %>%
  group_by(gender, marital) %>%
  summarise(avginc= mean(income, na.rm = T)) %>%
  ggplot(aes(x= gender, y= avginc, group= marital,
             colour= marital))+ # There are two grouping variable.
  geom_line()

demo %>%
  group_by(gender, marital) %>%
  summarise(avginc= mean(income, na.rm = T)) %>%
  ggplot(aes(x= marital, y= avginc, group= gender,
             colour= gender))+ # There are two grouping variable.
  geom_line()

demo %>%
  group_by(gender, marital) %>%
  filter(carcat== "Economy") %>%
  summarise(avginc= mean(income, na.rm = T)) %>%
  ggplot(aes(x= marital, y= avginc, group= gender,
             colour= gender))+ # There are two grouping variable.
  geom_line()