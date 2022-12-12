#Exam 4: a retake of exam 1 

#loading libraries
library(tidyverse)
library(dplyr)
library(ggplot2)

#task 1
#reading data!!!! and call it dat
dat <- read.csv("../BIOL3100_Exams/Exam_1/cleaned_covid_data.csv")

#task 2
#filter those A's
A_states <- dat %>% filter(substr(Province_State,1,1) == "A")

#task 3
#plot deaths in A states over time
A_states %>% ggplot(mapping =
                      aes(x = Last_Update,
                          y = Deaths))+
  geom_point()+
  geom_smooth(method = lm, se = FALSE) +
  facet_wrap(~Province_State, scales = "free")+
  theme_minimal()

#task 4
#reload data

dat <- read.csv("../BIOL3100_Exams/Exam_1/cleaned_covid_data.csv")

#find the peaks of case fatalities

peak <- dat %>% group_by(Province_State) %>% filter(!is.na(Case_Fatality_Ratio)) %>% 
  summarise(state_max_fatality_rate=max(Case_Fatality_Ratio)) 

#now lets put it in descending order

peak <- peak %>% arrange(desc(state_max_fatality_rate))

#lets plot it out!
peak_desc <-  order(desc(peak$state_max_fatality_rate))

peak %>% ggplot(mapping = aes(x = Province_State, y = peak_desc))+
  geom_bar(mapping=aes(x=reorder(Province_State,
                                 state_max_fatality_rate)),stat = 'identity')+
  theme(axis.text.x = element_text(angle = 90)) 

