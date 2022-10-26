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

class(dat$Under_5_mortality_rate)

#now I will make a line plot of the means of each continent over time

glimpse(dat)

dat %>% group_by(Continent) %>% 
  mean(dat$Under_5_mortality_rate)

#can't figure it out SKIPPPPPPPPP for now

#mod1 year
#mod2 year and continent
#mod3 year, continent and thier interactionterm


mod1 <- glm(data = dat, 
              formula = Under_5_mortality_rate~year)

mod2 <- glm(data = dat, 
            formula = Under_5_mortality_rate~year+Continent)

mod3 <- glm(data = dat, 
            formula = Under_5_mortality_rate~year*Continent)

compare_performance(mod1,mod2,mod3)

#from what I see here, model 3 has the best r2, with AIC and BIC being lower and RMSE and Sigma
#also being lower