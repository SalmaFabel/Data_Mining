# Unit 2

## Unit 2 Index

### Practice

- [Practice 1](https://github.com/SalmaFabel/Mineria_de_Datos/tree/Unit_2/Practices#practice-1)

### Research / Homework

- [Grammar of the graphs](https://github.com/SalmaFabel/Mineria_de_Datos/blob/Unit_2/Research%20-%20Homework/Grammar%20of%20the%20graphs.md#grammar-of-the-graphs)

### Exam 2

- [Exam 2](https://github.com/SalmaFabel/Mineria_de_Datos/tree/Unit_2/Evaluation#exam-2-1)

# Exam 2

>To begin with, the "ggplot2" library needs to be loaded, to make the graph that is requested.

```r

library(ggplot2)

```
>We have to load our CSV file, for this we first specify the path of where the source of the data is as follows is how it is done in windows, then the data is imported and then it shows us the first data to see if it was loaded correctly.


```r

setwd("C:\\Users\\salmi\\OneDrive\\Documentos\\GitHub\\Mineria-de-datos\\Evaluation")

movies <- read.csv("Project-Data.csv")
head(movies)

```

>The columns must be renamed since when specifying in the graph it marks an error for some symbols, for which we make it select the following columns, so as not to have to rename all, only the ones we need with a vector and the name of where we load the csv and then we rename those columns that we select and at the end it shows us how it looks, showing the first data.

```r

movies2<-(movies[,c(3,6,8,18)])

colnames(movies2) <- c("Genre","Studio","Budget", "Gross_US")
head(movies2)

```

```r
 Genre              Studio Budget Gross_US
1 action Buena Vista Studios    170     44.6
2 action Buena Vista Studios     66     21.4
3 action           Lionsgate    100     19.1
4 comedy                Sony     42     68.7
5 action                Sony    150     35.6
6 action                Sony     80     40.5

```

>Looking carefully at the graph we can see that it does not have all the data, so we have to filter the data of the columns "Studio" and "Genre", they can be done separately but with a single filter it is much easier with the symbol "|" To be able to add more elements and with "&" to change the column, it is important to separate between these two with parentheses, if not, the filter is not applied.

```r

movies3<-movies2[(movies2$Studio=="Buena Vista Studios" | movies2$Studio=="Fox" | movies2$Studio=="Paramount Pictures" | movies2$Studio=="Sony" | movies2$Studio=="Universal" | movies2$Studio=="WB") & 
(movies2$Genre=="action" | movies2$Genre=="adventure" | movies2$Genre=="animation" | movies2$Genre=="comedy" | movies2$Genre=="drama"),]

```
## Graph

>To start with the graph we specify that it is the filter of the data called "movies3", in the graph "x" will be the Genre column, "y" will be Gross_US, the color will be Studio and size will be the Budget column.

```r

A <- ggplot(movies3, aes(x=Genre, y=Gross_US,
                        color=Studio, size=Budget))

```

>In order to have the same font as in the graphic of the instructions, which is "Comic Sans MS", you have to install the "extrafont" package and then import the fonts from your system into the extrafont database. Then with "fonts ()" we can see the new available fonts that we have.

```r

install.packages("extrafont")
library("extrafont")
font_import()
loadfonts(device = "win")
fonts()

```

>Here we make our graph, with "geom_jitter" we can see the conditional distribution of the variables, inside we have "shape = 20" which is to specify the shape we want if it is made of squares, rectangles etc. in this case 20 is for a circle smaller than the one set by default. With "geom_boxplot" it is to make the graph of boxes which will have a size of 0.3, "alpha" for the aesthetics of the filling of the boxes that is 0.5 so that they are a bit transparent as in the graph of the instructions and that they have a black outline.
With "theme" we customize in a more detailed way the elements that are not from the graph, which would be the title, the text of the "x" which would be genre and the text of the "y" which is Gross_US. First we specify how the text in general of the graphic will be, since we have the new fonts it will be "Comic Sans MS" and that it has a size of 12, then there is our main title that is black, with a size of 20 and the Adjust its position of 0.5 so that it is in the center of the graph, then we have the titles of the two axes, they will have a size of 15 and they will be purple.
Then we have the area of ​​the scale which is renamed to "Budget $ M", we specify the title of the graph and with "ylab" we change the name of the y-axis title label.

```r
A + geom_jitter(shape=20) + geom_boxplot(size=0.3, alpha=0.5, color="Black") + 
  theme(text=element_text(family="Comic Sans MS",size=12),
    plot.title = element_text(color="Black", size=20, hjust = 0.5),
    axis.title.x = element_text(color="purple", size=15),
    axis.title.y = element_text(color="purple", size=15)) + 
  scale_size(name="Budget $M") + ggtitle("Domestic Gross % by Genre") + ylab("Gross % US")
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/imagen%20grafica%20mineria%20U2.PNG)

### Graph display

>This is the result of the graph, as you can see the action movies do very well but the drama movies not so much.

## Video defending the development of the exam

https://youtu.be/qNzREqsNI5I
