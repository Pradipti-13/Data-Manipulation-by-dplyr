# Chaining in dplyr
# magrittr package- %>%- piping- read as then.
demo= read.csv("demographics.csv")
demo2= demo %>% filter(age<=40 & educ== "Some college")
View(demo2)
demo2= demo %>% select(income, carcat, carpr)
demo2= demo %>% 
  filter(age<=40 & educ== "Some college") %>%
  select(income, carcat, carpr)
# select the owners younger than 40 and with some college education.
# retain the variables income, car category, and car price only.
# then compute a new variable "x" as income divided to price.
demo2= demo %>%
  filter(age<=40 & educ=="Some college") %>%
  select(income, carcat, carpr) %>%
  mutate(x= income/carpr)
demo2= demo %>%
  filter(age<=40 & educ=="Some college") %>%
  select(income, carcat, carpr) %>%
  arrange(desc(income))
demo2= demo %>%
  filter(age<=40 & educ=="Some college") %>%
  summarise(avginc= mean(income, na.rm= T))
demo2
demo2= demo %>%
  filter(age<=40 & educ=="Some college") %>%
  summarise(avginc= mean(income, na.rm= T),
            stdinc= sd(income, na.rm= T))
demo3= demo %>% 
  group_by(gender) %>%
  summarise(across(where(is.numeric), mean))
demo3
demo3= demo %>% 
  group_by(gender) %>%
  filter(carcat== "Luxury") %>%
  summarise(across(where(is.numeric), max))
demo3= demo %>% 
  group_by(gender) %>%
  filter(carcat== "Luxury") %>%
  summarise(n())
demo3= demo %>% 
  group_by(gender) %>%
  select(gender, carpr, income) %>%
  summarise(across(everything(), mean))
demo3= demo %>%
  select(income, carpr) %>%
  mutate(x= income/carpr) %>%
  arrange(x)
# count is used only for categorical variables. 
# tally is used only for numeric variables.
demo %>%
  filter(income>40) %>%
  count(marital, gender)
demo %>%
  filter(income>40) %>%
  tally(income)
demo %>%
  group_by(marital) %>%
  filter(income>40) %>%
  tally(income)
demo %>%
  filter(carcat== "Standard") %>%
  sample_n(50)
demo %>%
  filter(carcat== "Standard") %>%
  select(age, income, carpr, carcat) %>%
  sample_n(50) %>%
  top_n(5, income)
demo %>%
  filter(carcat== "Standard") %>%
  select(age, income, carpr, carcat) %>%
  sample_n(50) %>%
  glimpse()