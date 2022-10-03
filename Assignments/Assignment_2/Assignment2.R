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

