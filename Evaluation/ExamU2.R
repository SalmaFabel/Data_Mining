#Exam Unit 2

library(ggplot2)

setwd("C:\\Users\\salmi\\OneDrive\\Documentos\\GitHub\\Mineria-de-datos\\Evaluation")

movies <- read.csv("Project-Data.csv")
head(movies)

## Column grammar corrections

movies2<-(movies[,c(3,6,8,18)])

colnames(movies2) <- c("Genre","Studio","Budget", "Gross_US")
head(movies2)

##Data filter

movies3<-movies2[(movies2$Studio=="Buena Vista Studios" | movies2$Studio=="Fox" | movies2$Studio=="Paramount Pictures" | movies2$Studio=="Sony" | movies2$Studio=="Universal" | movies2$Studio=="WB") & 
                   (movies2$Genre=="action" | movies2$Genre=="adventure" | movies2$Genre=="animation" | movies2$Genre=="comedy" | movies2$Genre=="drama"),]

##Graph

A <- ggplot(movies3, aes(x=Genre, y=Gross_US,
                        color=Studio, size=Budget))

install.packages("extrafont")
library("extrafont")
font_import()
loadfonts(device = "win")

A + geom_jitter(shape=20) + geom_boxplot(size=0.3, alpha=0.5, color="Black") + 
  theme(text=element_text(family="Comic Sans MS",size=12),
    plot.title = element_text(color="Black", size=20, hjust = 0.5),
    axis.title.x = element_text(color="purple", size=15),
    axis.title.y = element_text(color="purple", size=15)) + 
  scale_size(name="Budget $M") + ggtitle("Domestic Gross % by Genre") + ylab("Gross % US")


