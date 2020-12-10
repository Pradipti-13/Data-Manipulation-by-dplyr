# Section-5- Part-2
# Using dplyr and ggplot2 together.
library(dplyr)
library(ggplot2)
# Scatterplot charts
mk= read.csv("marketingdb.csv")
View(mk)

# a scatterplot that represents the relationship
# between age and income by gender
# We don't need to use group_by() here.
# Because the option colour= gender in the ggplot()
# function creates a clustered scatterplot

mk %>%
  ggplot(aes(x= age, y= income, 
             colour= gender))+ 
  geom_point()

mk %>%
  filter(card== "Mastercard") %>%
  ggplot(aes(x= age, y= income, 
             colour= gender))+ 
  geom_point()

mk %>%
  filter(ed>20) %>%
  ggplot(aes(x= age, y= income, 
             colour= gender))+ 
  geom_point()

# Histogram charts
demo= read.csv("demographics.csv")
demo %>%
  ggplot(aes(x= income, fill= gender))+
  geom_histogram()

demo %>%
  filter(carcat== "Luxury") %>%
  ggplot(aes(x= income, fill= gender))+
  geom_histogram()

demo %>%
  filter(carpr<50) %>%
  ggplot(aes(x= income, fill= gender))+
  geom_histogram()

# Boxplot charts
demo %>%
  ggplot(aes(x= gender,
             y= income)) + 
  geom_boxplot()

demo %>% 
  filter(carcat== "Standard") %>%
  ggplot(aes(x= gender,
             y= income)) + 
  geom_boxplot()

demo %>% 
  filter(age>=35 & age<=50) %>%
  ggplot(aes(x= gender,
             y= income)) + 
  geom_boxplot()
