x <- read.csv("./Data/lw.csv")

x$Area

x$Area <- x$length * x$width
#this created the calculation for area and labeled it as such

x$lastName <- "Smith"
#changed all last names to smith

x$FullName <- paste0(x$name," ",x$lastName)


x$FullName2 <- paste0(x$lastName,", ",x$name)
#this puts the names together and lists them in this order

plot(x$width,x$Area)

cor(x$length,x$Area)
#give correlation between two variables

x$lastName <- NULL
#this removes this line