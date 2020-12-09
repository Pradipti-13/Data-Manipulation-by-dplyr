# Section-2
# Some other commands in dplyr
# Command function- used to count number of rows.
d= read.csv("demographics.csv")
count(d)
count(filter(d, income<100))
count(d, educ) # Categorical variable - grouped automatically
count(d, gender, retired)
d2= add_count(d)
View(d2)
# Tally function- to count rows, sum of values in variable
tally(d)
tally(d, income)
tally(d, carpr)
d3= add_tally(d)
d4= add_tally(d, income)
View(d4)
# The n() command- Number of distinct values in a vector
n_distinct(d$educ)
n_distinct(d$income)
n_distinct(d) # No of rows
# sample() command- Extract sample from data frame at random
d5= sample_n(d, 100, replace= T)
View(d5)
id= 1:5
names= c("Tom", "Mary", "Nicholas", "Diana", "Ellen")
dat= data.frame(id, names)
View(dat)
dat_s= sample_n(dat, 100, replace= T)
View(dat_s)
# same_frac- extracts a fraction of rows at random
demo_s2= sample_frac(d, 0.3, replace= T)
View(demo_s2)
# top_n()- extracts top n people from a dataset
d7= top_n(demo, 10, income)
View(d7)
d7= top_n(demo, 10, age) # age repeat so entries are 17 than 10.
# bind()- used to bind dataframes using rows or columns
# for bind_rows()- this binds dataframes by rows. 
# for bind_rows()- number of columns must be the same.
d8= demo[1:10,]
d9= demo[501:510,]
d_b= bind_rows(d8, d9)
View(d_b)
# for bind_cols()- this binds dataframes by columns.
# for bind_cols()- number of rows/entries must be the same.
d10= demo[,1:3]
d11= demo[,4:8]
d_c= bind_cols(d10, d11)
View(d_c)
# glimpse function
glimpse(d)
# Set Operations
# There are four set operations- 
# intersect(), union(), setdiff(), setequal()
x= 1:10
y= c(2, 4, 6, 9, 11, 15)
intersect(x,y)
d= d[1:30, ]
d2= demo[20:40, ]
intersect(d, d2)
# We get the rows from 20 to 30.
x= 1:10
y= c(2, 4, 6, 9, 11, 15)
union(x,y)
union(d, d2)
# We get rows from 1 to 40.
x= 1:10
y= c(2, 4, 6, 9, 11, 15)
setdiff(x,y)
setdiff(y,x)
# Un-common rows/entries
setdiff(d, d2) 
setdiff(d2, d) # 31-40
x= 1:10
y= c(2, 4, 6, 9, 11, 15)
setequal(x,y)
setequal(d,d2) # if two dataframes are identical.