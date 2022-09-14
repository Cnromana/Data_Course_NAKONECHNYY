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

ggplot(iris, aes(x = Sepal.Length)) + geom_density(fill="green")
+facet_wrap(~Species)

#this gives you s distribution

ggplot(data = iris, mapping= aes(x= Sepal.Width, y= Petal.Width, fill = Species)) + 
  geom_violin() + geom_jitter(width = .1, height = 0, alpha=.5) + theme_minimal()
