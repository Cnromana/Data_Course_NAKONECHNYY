library(tidyverse)
#loads the package

data("iris")
glimpse(iris)
data("iris")
#loads the data

ggplot(iris,aes(x = Petal.length,y = Petal.width)
       
ggplot(data = iris, mapping = aes(x =Petal.Length,y = Petal.Width ))
#this will create a plot
#map aesthetics allows you to plot certain columns and set those colums aside from eachother by
#editing the color 
#aesthetics are referring to colums

ggplot(data = iris, mapping = aes(x =Petal.Length,y = Petal.Width,color = Species, 
                                  shape = Species, size = Sepal.Length)) +
geom_point() + geom_smooth(method = lm)

#adding things will smooth out the graph, point is not an exact 
#goems all you to modify how the aethetics are showm

ggplot(data = iris, mapping= aes(x= Sepal.Width, y= Petal.Width, color = Species)) + 
  geom_point(shape=0) + geom_smooth(method = lm, se = FALSE)


#this gives you a distribution

ggplot(data = iris, mapping= aes(x= Sepal.Width, y= Petal.Width, fill = Species)) + 
  geom_violin() + geom_jitter(width = .1, height = 0, alpha=.5) + theme_minimal()

#for colors you can look up the HEX code for the color and use that all the fill with the muber symbol


read_delim(("./Data/DatasaurusDozen.tsv")
# practice with mtcars

#labs to change labels

library(patchwork)
#this package helps combine information

p1 <- iris %>% 
ggplot(data = iris, mapping = aes(x =Sepal.Length,y = Sepal.Width,color = Species,)) +
  geom_point() + geom_smooth(method = lm,se = FALSE)

#this plot shows colored species data points, line and groups

p2 <- iris %>% 
ggplot(data = iris, mapping = aes(x =Sepal.Length,y = Sepal.Width)) +
  geom_point() + geom_smooth(aes(color=Species),method = lm,se = FALSE)

 
#this created a graph with dark points, colored best line fit and different lines for each species 

p1 + p2

#set the graphs to p1 and p2 objects and add them to gether under patchwork to pull up multiple graphs

p3 <- ggplot(iris, aes(x=Species, y=Sepal.Length)) + geom_boxplot()

p1+p2/p3

# this cause one graph on the side p1 and graph p2 to appear over p3 plot.
dir.create("Figures")

ggsave("./Figures/myfirstplot.png", plot=p3, width=6, height = 6, dpi=300)

#we saved the plot in a new folder (new directory) and added a new name from here of the file

p4 <- p3+ theme_minimal()+ labs(y="Sepal.Length", title="hello", subtitle = "hey", caption="data from iris")

#we created a new object that consists of p3 with differen labels

ggsave("./Figures/mysecondplot.png", plot=p4, width=4, height = 4, dpi=300)

#this saved the plot in the same folder(directory) but with a new title

p5 <- p4+
  theme(axis.text.x = element_text(face = "bold.italic", size=14, color="blue"), 
        plot.background = element_rect(fill="purple"))
#this function allows you to edit the graph aesthetics involving color, font and size, background color.
#labs stand for labels

p4+
  theme(axis.text.x = element_text(face = "bold.italic", size=14, color="blue"), 
        plot.background = element_rect(fill="purple"))

#family under element text allows you to choose a font, need a package for more fonts

remotes::install_github("wilkelab/cowplot")
install.packages("colorspace", repos = "http://R-Forge.R-project.org")


p6 <- ggplot(iris,aes(x=Species, y=Sepal.Length, fill=Species)) + geom_boxplot()

p6 +
  scale_fill_manual(values=pal)
#this allows you to change the colors used in a plot and pallets can be made for it in the manual scale fill



pal <-c("#8403fc","#e307b0","#2ab7eb")
#this created a color pallet that can be used the scale manual fill

p6 + scale_fill_viridis_d(option = "plasma")
#certain packages will have a theme of colors that they will use

ggplot(iris,aes(x=Sepal.Length, y=Sepal.Width, color=Sepal.Width))+ geom_point()+
  scale_color_viridis_c()

# for choosing the time of color you can have "C" for continuous
# "D" means discrete

viridis::mako(10)

viridis::inferno(100)

#this looks at the hew codes that are being used in this color pallete 
