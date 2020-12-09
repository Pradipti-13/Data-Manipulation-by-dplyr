# Section-1 
library(dplyr)
demo= read.csv("demographics.csv")
View(demo)
# Filter command- to select rows
demo2= filter(demo, 
              income>55 | marital=="Married",
              carcat== "Luxury",
              !age %in% c(42, 45, 60))
View(demo2)
# Select command- to select columns
demo3= select(demo, age, marital, gender)
View(demo3)
demo3= select(demo, c(3,5))
demo3= select(demo, 2:4)
demo3= select(demo, -age, -income)
demo3= select(demo, -6,-8)
demo3= select(demo, -1:-3)
demo3= select(demo, contains("ret"))
demo3= select(demo, starts_with("in"))
demo3= select(demo, ends_with("cat"))
# Mutate command- to do some kind of operation.
demo4= mutate(demo, income2= income*10)
View(demo4)
demo4= mutate(demo, diff= income-carpr)
## Create a vector and add it to the data frame as a variable.
y= rnorm(510, 0, 1)
demo4= mutate(demo, new_var= y)
## Applying same operations to different columns.
## We use this across function
demo4= mutate(demo, across(c(1,5), ~./1000, 
                           .names="{col}_2"))
demo4= mutate(demo, across(where(is.numeric),
                           ~./1000))
demo4= mutate(demo, across(c(1,5),
                           ~.*3,
                           .names= "{col}_new"))
demo4= mutate(demo, across(c(1,5),
                           .fns= mean,
                           .names = "{col}_mean"))
# We can use filter inside the mutate function
demo4= mutate(filter(demo, 
                     retired== "Yes"), 
              across(c(1,3,5),
                     ~./1000,
                     .names = "{col}_2"))
# Arrange command
demo5= arrange(demo, income)
View(demo5)
demo5= arrange(demo, desc(income))
# Strings get sorted A-Z automatically
demo5= arrange(demo, income, educ)
demo5= arrange(demo, educ, income)
demo5= arrange(demo, income, desc(educ))
# Summarise command- Does not make a dataframe
meaninc= summarise(demo, avginc= mean(income, 
                                      na.rm= T))
View(meaninc)
typeof(meaninc) # The type is a list
sd= summarise(demo, stdinc= sd(income, 
                               na.rm= T))
View(sd)
sum= summarise(demo, suminc= sum(income,
                                 na.rm= T))
View(sum)
# median, min, max can be used. 
var= summarise(demo, varinc= var(income, 
                                 na.rm= T)) # variance
# the n() function returns the number of rows 
n_row = summarise(demo, n())
# Several Statistics at once 
summarise(demo,
          avginc= mean(income, na.rm= T),
          stdinc= sd(income, na.rm= T),
          varinc= var(income, na.rm= T))
summarise(filter(demo, age>35), 
          avginc= mean(income, na.rm= T),
          stdinc= sd(income, na.rm= T))
summarise(filter(demo, gender== "Male"), 
          avginc= mean(income, na.rm = T),
          stdinc= sd(income, na.rm= T),
          n())
# Across function
summarise(demo, across(c(1,5), mean))
summarise(demo, across(where(is.numeric), mean))
summarise(filter(demo, carcat== "Luxury"),
          across(where(is.numeric), mean))
summarise(demo, across(starts_with("c") & 
                         where(is.numeric),
                       mean))
demo7= select(demo, age, income, carpr)
View(demo7)
summarise(demo7, across(everything(), mean))
# Group_By function 
demo8= group_by(demo, educ)
View(demo8)
summarise(demo8, avginc= mean(income))
summarise(demo8, stdprice= sd(carpr))
demo9= filter(demo8, age>40)
View(demo9)
summarise(demo9, avginc= mean(income))
summarise(demo8, across(c(1,4), mean))
# Here grouping variable is not being considered
summarise(filter(demo8, carcat== "Luxury"), 
          across(where(is.numeric), mean))
