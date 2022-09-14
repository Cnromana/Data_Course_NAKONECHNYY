# finding files
1+1 #addition of two numbers

list.files()
?list.files
x <- list.files(recursive = TRUE, include.dirs = TRUE,
                full.names = TRUE, pattern = "ugly",ignore.case = TRUE)

#recursive looks into directories, include directories look into subdirectory names, pattern is a key word, full names is 

X <- list.files(pattern = ".csv", recursive = TRUE, full.names = TRUE) 
Y <- X[1]

?readLines
readLines(Y) 
# LIST THE NAMES IN COLOUMNS SEPARATED BY COMMAS

readLines(Y)[1:3]

#SQUAR BRACKET CAN BE USED TO GET SPECIFIC PARTS OF FILES, COLONS ARE USE TO CONNECT NUMBERS


?read.csv

Z <- read.csv(Y)

Z$IATA_CODE[3]
#SHOWS THE THRIE IN THAT FILE, SHOWS ONLY ONE COLOUMN

Z$IATA_CODE[C(1,3)]
# do not capitalize C

Z$IATA_CODE[c(1,3)]
# this function allows you to pull up only certain parts of data [c(number, number)]

grades <- read.csv("./Data/Fake_grade_data.csv")

list.files(recursive = TRUE, pattern = 'grade', ignore.case = TRUE,
           full.names = TRUE)

class("grades")

grades[2,2]

#always comes up in [row,coloumn]

grades[3,c(1,3,5)]

#to identify grades in row 3 and coloumns 1,3,5

grades$Assignment_1>15
#tell you location  of assignments over 15

grades$Student[grades$Assignment_1>15]
#list of students that have >15 on assign. 1

list.files(x)

csv_files <- list.files(recursive = TRUE, pattern =".csv", ignore.case = TRUE,full.names = TRUE,include.dirs = TRUE, path = "data" )
#this is us looking at all the files with .csv within the ./data/ directory.
#we then added a shortcut to csv_files

length(csv_files)
#this tells you how many things are in a vector

length(1:10)

wing <- list.files(path = "data",pattern = "wingspan_vs_mass.csv",recursive = TRUE, full.names = TRUE)
#we found the file for wingspan_vs_mass.csv and created a shortcut

df <- read.csv(file = wing)
#we read the files under wing and saved it under the short cut df

head(df,n = 5)
#this shows you the first 5 lines of a data set

x <- list.files(recursive = TRUE, full.names = TRUE, pattern = "^b",path = "Data")

length(x)

list.files(path = "Data",recursive = TRUE,full.names = TRUE,pattern = "^b")
# ^ means starts with
# $ menas ends with 
# menas 0-inf

list.files(path = "Data",recursive = TRUE,full.names = TRUE,pattern = "^b.*b$")
# .* will mean that there is something inbetween those 2 letters and that it stars and ends with "b"

readLines("data/data-shell/creatures/basilisk.dat", n=1)

readLines("data/data-shell/data/pdb/benzaldehyde.pdb",n=1)

readLines("data/Messy_Take2/b_df.csv" ,n=1)

#this is use looking at the first lines of the the documents

readLines(x[1],n=1)
readLines(x[2],n=1)
readLines(x[3],n=1)

#read lines can only read one file at a time
#this is the same as the previous part, but with an short cut for x. Depending on the order of files you will insert x[?]
# n=1 means that is the first line of the file


for (eachfile in x) {readLines(eachfile,n=1)
  
}

# for-loop, it reads the files, but does not show them

for (eachfile in x) {print(readLines(eachfile,n=1))
  
}
#to be able to see the results of the for-loop, we must put print

for (x in 1:10) {print(x+3)
  
}

#in this list we chose the first 10 data points and add 3 to the points

for (eachfile in csv_files) {print(readLines(eachfile, n = 1))
  
}
install.packages("tidyverse )

install.packages("tidyverse")

library(tidyverse)
df %>% 
  ggplot(aes(x=mass,y=wingspan,variety=color))
geom_point() + geom_smooth(color=black)

#this sets up a table with the information with the adjustments stated

praise::praise()