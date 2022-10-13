library(tidyverse)
library(dplyr)
library(ggplot2)

read.csv("Data/Utah_Religions_by_County.csv") %>% view()

Utah <- read.csv("Data/Utah_Religions_by_County.csv")

Utah01 <- read.csv("Data/Utah_Religions_by_County.csv")

glimpse(Utah)


#change numbers to percents

library(scales)

Utah <- Utah %>% 
  mutate(Religious=percent(x = Religious,accuracy = 1)) %>% 
  mutate(Non.Religious=percent(x = Non.Religious,accuracy = 1)) %>% 
  mutate(Assemblies.of.God=percent(x = Assemblies.of.God,accuracy = 1)) %>% 
  mutate(Episcopal.Church=percent(x = Episcopal.Church,accuracy = 1)) %>% 
  mutate(Pentecostal.Church.of.God=percent(x = Pentecostal.Church.of.God,accuracy = 1)) %>% 
  mutate(Greek.Orthodox=percent(x = Greek.Orthodox,accuracy = 1)) %>% 
  mutate(LDS=percent(x =LDS,accuracy = 1)) %>% 
  mutate(Southern.Baptist.Convention=percent(x = Southern.Baptist.Convention,accuracy = 1)) %>% 
  mutate(United.Methodist.Church=percent(x = United.Methodist.Church,accuracy = 1)) %>% 
  mutate(Buddhism.Mahayana=percent(x = Buddhism.Mahayana,accuracy = 1)) %>% 
  mutate(Catholic=percent(x = Catholic,accuracy = 1)) %>% 
  mutate(Evangelical=percent(x = Evangelical,accuracy = 1)) %>% 
  mutate(Muslim=percent(x = Muslim,accuracy = 1)) %>% 
  mutate(Non.Denominational=percent(x = Non.Denominational,accuracy = 1)) %>% 
  mutate(Orthodox=percent(x = Orthodox,accuracy = 1))

#pivot longer to make graphing easier
Utah <- 
Utah %>% pivot_longer(cols=ends_with(c("God","Church","Orthodox","DS","tion","ana","al","ic","im")),
                      names_to = "Religion", values_to = "Percent_of_population")

Utah %>% 
  ggplot(mapping = aes(x = County,y = Percent_of_population))+
  geom_point()+
  facet_wrap(~Religion)+
  theme(axis.text.x = element_text(angle = 90,
                                   vjust = 0.5,
                                   hjust = ))


Utah %>% 
  ggplot(mapping = aes(x = Religion,y = Percent_of_population))+
  geom_point()+
  facet_wrap(~County)+
  theme(axis.text.x = element_text(angle = 90,
                                   vjust = 0.5,
                                   hjust = ))

#these two plots show side by side rates of different religions in different counties.




#1.there do seem to be a correlation with a specific religion and populaiton because
#the most prevalent religion in most of the counties is LDS and in Utah County,
#the largest county, does contain a large percentage of LDS people.This pattern seems to be repeated 
#for other counties.

#2.It appears to be where there is not a high percentage of religious people, there is a larger
#amount of evangelical people. I am not sure if this pattern is enough to be a correlation,
#but there are examples of this in the plots.