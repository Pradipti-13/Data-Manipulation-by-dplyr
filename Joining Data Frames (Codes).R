# Section-4
# Joining Data Frames 
# There are 5 types of joining commands in dplyr.
# inner_join(), semi_join(), left_join(), anti_join(), full_join()
# Most of these are not symmetric- inner_join(df1, df2) is 
# different than inner_join(df2, df1)
# inner_join()
cities= read.csv("cities.csv")
View(cities)
buildings= read.csv("buildings.csv")
View(buildings)
# common column city in both the data frames.
# Some values in second data frame are not in the first data frame.
# inner join cities with buildings.
ij= inner_join(cities, buildings)
View(ij) # Two buildings removed.
ij2= inner_join(buildings, cities)
View(ij2)
# semi_join()
# this command returns all rows from the first data frame where
# there are matching values in the second data frame, keeping 
# variables from te first data frame only.
# semijoin cities with buildings
sj= semi_join(cities, buildings)
View(sj)
sj2= semi_join(buildings, cities)
View(sj2)
# the dataframe sj2 does not contain two buildings, because their
# cities are not in the cities data frame. 
# furthermore, it only contains the variables in the buildings data frame.
# left_join()
# this command returns all rows from the first data frame
# and all the variables from both the data frames.
# if there are multiple matches between the data frames, all
# combinations of matches are returned.
lj= left_join(cities, buildings)
View(lj)
lj2= left_join(buildings, cities)
View(lj2)
# anti_join() command
# this command returns all rows from the first data frame
# where there are not matching values in the second data frame
# and retains the variables from the first data frame.
aj= anti_join(cities, buildings)
View(aj)
aj2= anti_join(buildings, cities)
View(aj2)
# full_join() command
# this command returns all rows and variables from both data frames.
# where there are not matches, the NA value is returned.
fj= full_join(cities, buildings)
View(fj)
fj2= full_join(buildings, cities)
View(fj2)
# The full join command is the only command that is symmetric.