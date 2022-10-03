library(tidyverse)
dat <- read_csv("Data/BioLog_Plate_Data.csv")

library(knitr)

#task 1
dat %>% 
  pivot_longer(cols = starts_with("Hr"), names_to = "Hour", values_to = "Absorbance" ) 

#task 2
dat %>% 
  pivot_longer(cols = starts_with("Hr"), names_to = "Hour", values_to = "Absorbance" ) %>% 
  mutate(Source = case_when(
    startsWith(`Sample ID`, "S") ~ "soil",
    startsWith(`Sample ID`, "C") ~ "water",
    startsWith(`Sample ID`, "W") ~ "water"
  ))

#Task 3

dat %>% 
  pivot_longer(cols = starts_with("Hr"), names_to = "Hour", values_to = "Absorbance" ) %>% 
  mutate(Source = case_when(
    startsWith(`Sample ID`, "S") ~ "soil",
    startsWith(`Sample ID`, "C") ~ "water",
    startsWith(`Sample ID`, "W") ~ "water"
  )) %>% filter(Dilution==0.1) %>% mutate()
 %>% 
  ggplot(mapping = aes(x = Hour, y = Absorbance))+geom_line()+geom_smooth(method = lm, aes(color=Source))+
  facet_wrap(~Substrate) 





