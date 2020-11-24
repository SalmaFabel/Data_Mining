#Exam Unit 2

library(ggplot2)

setwd("C:\\Users\\salmi\\OneDrive\\Documentos\\GitHub\\Mineria-de-datos\\Evaluation")

movies <- read.csv("Project-Data.csv")
head(movies)

##Correcciones gramaticales de las columnas
movies2<-(movies[,c(3,6,8,18)])

colnames(movies2) <- c("Genre","Studio","Budget", "Gross_US")
head(movies2)

##Filtro datos
movies2<-movies2[movies2$Studio=="Buena Vista Studios" | movies2$Studio=="Fox" | movies2$Studio=="Paramount Pictures" | movies2$Studio=="Sony" | movies2$Studio=="Universal" | movies2$Studio=="WB" & 
                   movies2$Genre=="action" | movies2$Genre=="adventure" | movies2$Genre=="animation" | movies2$Genre=="comedy" | movies2$Genre=="drama",]

##Grafica

p <- ggplot(movies2, aes(x=Genre, y=Gross_US,
                        color=Studio, size=Budget))

p +  geom_jitter() + geom_boxplot(size=0.3,color="Black") + ggtitle("Domestic Gross % by Genre")

## Estetica de la grafica
