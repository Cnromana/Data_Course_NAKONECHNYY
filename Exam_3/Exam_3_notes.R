
library(tidyverse)
library(patchwork)
library(janitor)
library(easystats)
library(modelr)
library(broom)
library(dplyr)
library(tidyr)
# Task 1: Load the csv files

money <- read_csv(file = "./BIOL3100_Exams/Exam_3/FacultySalaries_1995.csv")

oil <- read_csv(file = "./BIOL3100_Exams/Exam_3/Juniper_Oils.csv")

# Tidy the data
# Let's use pivot_longer to make each row contain only one observation

names(money) = gsub(pattern = "Avg", replacement = "", x = names(money)) 
names(money) = gsub(pattern = "Prof", replacement = "", x = names(money)) 

money <- pivot_longer(money,contains("Salary"),
                      names_to = "Rank_Salary",
                      values_to = "Salary")

money <- pivot_longer(money,contains("Comp"),
                      names_to = "Rank_Comp",
                      values_to = "Compensation")

money <- pivot_longer(money,contains("Num", ignore.case = TRUE), 
                      names_to = "Rank_Num", 
                      values_to = "Number")

money$Rank_Salary <- str_remove(string = money$Rank_Salary,"Salary")

money$Rank_Comp <- str_remove(string = money$Rank_Comp,"Comp")

money$Rank_Num <- str_remove(string = money$Rank_Num,"Num")

money <- money$Rank_Salary %>% full_join(money$Rank_Comp,by = money$FedID)

money %>% pivot_longer(money,starts_with("Rank"),names_to = Rank_type, values_to = Rank)





money %>% full_join(x = Rank_1,y = Rank_2)

money <- subset(money,select = -c(money$Rank_1,money$Rank_2,money$Rank_3))

names(money$Rank_1) = gsub(pattern = "Salary", replacement = "",
                               x = names(money$Rank_1)) 

names(money) = gsub(pattern = "Comp", replacement = "", x = names(money)) 
names(money) = gsub(pattern = "Num", replacement = "", x = names(money))
  


# Re-create the graph shown in "fig1.png"
money %>% filter(grepl('Salary', Rank_Salary)) %>%
  filter(!grepl('All', Rank_Salary)) %>%
  filter(!grepl('VIIB', Tier)) %>% 
  ggplot(mapping = aes(y = Total,fill = Rank_Salary))+
  geom_boxplot()+facet_grid(~Tier)+theme_minimal()+
  scale_fill_discrete(name = "Rank", labels = c("Assist", "Assoc", "Full")) +
  labs(y = "Salary",x = "Rank") +theme(axis.text.x = element_text(angle = 45))

#build ANOVA
aov()



oil <- pivot_longer(oil, 11:33, names_to = "ChemicalID")



oil %>%
  ggplot(mapping = aes(x = YearsSinceBurn,y = value)) +
  geom_smooth(method = "loess") +
  facet_wrap(~ChemicalID, scales = "free") +
  theme_minimal() +
  labs(y = "Concentration")

