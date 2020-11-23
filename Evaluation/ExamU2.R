#Exam Unit 2

library(ggplot2)

setwd("C:\\Users\\salmi\\OneDrive\\Documentos\\GitHub\\Mineria-de-datos\\Evaluation")

movies <- read.csv("Project-Data.csv")
head(movies)

##Correcciones
movies2<-(movies[,c(3,6,8,18)])

colnames(movies2) <- c("Genre","Studio","Budget", "Gross_US")
head(movies2)

##
movies2[movies2$Studio=="Buena Vista Studios",]

##Grafica

p <- ggplot(movies2, aes(x=Genre, y=Gross_US,
                        color=Studio, size=Budget,
                        main = "Domestic Gross % by Genre"))

p  + geom_boxplot() 

