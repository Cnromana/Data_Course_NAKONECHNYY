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

state_max_fatality_rate <- dat %>% group_by(Province_State) %>% filter(!is.na(Case_Fatality_Ratio)) %>% 
  summarise(Maximum_Fatality_Ratio=max(Case_Fatality_Ratio)) 

#now lets put it in descending order

state_max_fatality_rate <- state_max_fatality_rate %>% arrange(desc(Maximum_Fatality_Ratio))

#lets plot it out!

state_max_fatality_rate %>% ggplot(mapping = aes(x = Province_State, y = Maximum_Fatality_Ratio))+
  geom_bar(mapping=aes(x=reorder(Province_State,
                                 -Maximum_Fatality_Ratio)),stat = 'identity')+
  theme(axis.text.x = element_text(angle = 90)) 


