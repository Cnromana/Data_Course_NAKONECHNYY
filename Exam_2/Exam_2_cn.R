#first load some libraries
library(tidyverse)
library(modelr)
library(easystats)
library(broom)
library(ggplot2)

#next find the data and make a short cut
dat <- read.csv("BIOL3100_Exams/Exam_2/unicef-u5mr.csv")

#look at the data
unique(dat$CountryName)
unique(dat$Region)
unique(dat$Continent)

#looked at some of the variable and the data, missing lots of data in the early years
#data needs to be tidied, thinking to pivot longer with the years


 names(dat) = gsub(pattern = "U5MR.", replacement = "", x = names(dat))

#fixed the names to be just the year

dat <- dat %>% pivot_longer(cols = -c(CountryName,Region,Continent),
               names_to = "year",
               values_to = "Under_5_mortality_rate")

#now that the graph is tidied and the years are cleaned up,time to graph


dat %>% group_by(year) %>%
  ggplot(mapping = aes(x = year,y = Under_5_mortality_rate,fill = CountryName)) +
  geom_point() +facet_wrap(~Continent)+scale_x_discrete(breaks = c(1960,1980,2000))+
  theme(legend.position="none")

#geom_line destorys my graph, and will leave it blank, can't figure out why
#doing points because it is better than not having anything.

class(dat$Under_5_mortality_rate)

#now I will make a line plot of the means of each continent over time

glimpse(dat)

class(dat$Under_5_mortality_rate)


dat <- dat %>% mutate(Under_5_mortality_rate_n= as.numeric(Under_5_mortality_rate))

dat %>% group_by(Continent) %>%
  ggplot(mapping = aes(x = year,y = Under_5_mortality_rate,color=Continent)) +
  geom_point()+geom_smooth() +scale_x_discrete(breaks = c(1960,1980,2000))+
  theme_minimal()
  


#having lots of trouble, errors keep insisting that the mortality rates are not numeric
#even when mutated to a numeric.Mean refuses to calculate no matter how I do it, because it is not
#numeric.
# :(

#time to make some models!


mod1 <- glm(data = dat, 
              formula = Under_5_mortality_rate~year)

mod2 <- glm(data = dat, 
            formula = Under_5_mortality_rate~year+Continent)

mod3 <- glm(data = dat, 
            formula = Under_5_mortality_rate~year*Continent)

compare_performance(mod1,mod2,mod3)

#from what I see here, model 3 has the best r2, with AIC and BIC being lower and RMSE and Sigma
#also being lower


dat %>% gather_predictions(mod1,mod2,mod3,type="response") %>% 
  ggplot(aes(x = year, y = pred, color=Continent))+geom_point()+
  geom_smooth(method = "lm",se=FALSE)+
  facet_wrap(~model)+
  theme_minimal()+scale_x_discrete(breaks = c(1960,1980,2000))

#again geom_line hates me and will not bring anything up, geom_point is all I got.
#if you use the same code and replace geom_point with geom_line
#I guarantee it will show the lines, but my plots go blank when I do it

#checking that all of my code is submitted
