# Grammar of the graphs

### Histograms

>A histogram is a graphical representation of a variable in the form of bars, where the area of ​​each bar is proportional to the frequency of the values ​​represented.

>Incluye el argumento bins para indicar el número de clases del histograma.

```r

qplot(mpg, data = mtcars, bins=5)

```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/t1U2.PNG)

>Although it is indicated by default, you can still include that the type of geometry of the graph to be drawn is histogram. The result will be the same as the previous graph.
Add vertical lines to show the mean and median.

```r
qplot(mpg, data = mtcars, bins=5, geom = "histogram") +
geom_vline(xintercept = mean(mtcars$mpg), color="red")+
geom_vline(xintercept = median(mtcars$mpg), color="blue")
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/T1U2 #2.PNG)

### Density

>Converts the histogram to a density graph.

```r

qplot(mpg, data = mtcars, bins=5, geom = "density", fill = as.factor(am))

```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/T1U2 #3.PNG)

```r

qplot(mpg, data = mtcars, bins=5, geom = "density", color = as.factor(am), linetype= as.factor(am))

```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/T1U2 #4.PNG)

### Graph separation

>Use the facets argument to split both density polygons into different charts. Look at the facets argument in the two examples. In the first they were graphed as columns and in the second as rows.

```r

qplot(mpg, data = mtcars, bins=5, geom = "density", color = as.factor(am), facets = .~ am)

```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/T1U2#5.PNG)

```r
qplot(mpg, data = mtcars, geom = "density",
      xlab = "galones por millas", ylab = "Densidas", 
      main = "Densidad de galones por millas")

```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/T1U2#6.PNG)

### Combining histogram and density

```r
a + geom_histogram(aes(y = ..density..),color = "black", fill = "white") + geom_density(alpha = 0.2, fill = "#FF6666") + theme_minimal()
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/T1U2#7.PNG)

###  Dispersion

>Adding two columns, mpg as the x-axis and wt as the y-axis, a scatterplot is drawn.
The geom argument is point, however that value can be replaced by line to graph lines.

```r
qplot(mpg, wt, data=mtcars, geom=c("point", "line"))
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/T1U2#8.PNG)

>The smooth value of graphical geom the fit and the standard error of LOESS (locally weighted scatterplot smoothing)

```r
qplot(mpg, wt, data = mtcars, geom = c("point", "smooth"))# standard error
## `geom_smooth()` using method = 'loess'

```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/T1U2#9.PNG)

```r
qplot(mpg, wt, data = mtcars, facets = .~factor(cyl), color = factor(cyl))+ geom_smooth(method = "lm") # metodo linear modeling, regresion lineal

```
![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/T1U2#10.PNG)

### Customize charts

>The following examples show that the variable c and l is continuous so, by default, a continuous color scale is selected. If we want to assign a discrete scale, it is necessary to transform cly to the factor data type.

```r
qplot(mpg, wt, data = mtcars, colour = cyl)
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/T1U2#11.PNG)

```r
qplot(mpg, wt, data = mtcars, shape = factor(cyl))
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/T1U2#12.PNG)

### Labels for points

```r
qplot(mpg, wt, data = mtcars, label = rownames(mtcars), 
      geom=c("point", "text"),
      hjust=0, vjust=0)
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/T1U2#13.PNG)

### Boxplots or box-and-whisker plots

```r
qplot(factor(am),mpg , data = mtcars, geom=c("boxplot", "jitter"))
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/T1U2#14.PNG)

```r
qplot(factor(am),mpg , data = mtcars, 
      geom = "dotplot", stackdir = "center", binaxis = "y",
      color = factor(am), fill = factor(am))
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/T1U2#15.PNG)

```r
qplot(factor(am),mpg , data = mtcars, 
      geom = "violin", stackdir = "center", binaxis = "y",
      color = factor(am), fill = factor(am))
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/T1U2#16.PNG)

### Pyramid

>They are generally used to compare the characteristics of two populations. These types of graphs are used especially in the area of ​​demography, for example, to show the distribution of the population of a country.

```r
# pop<-read.csv2("D:\\DriveW7\\2018\\Sabana\\Bioestadistica\\1. Razones, proporciones y tasas\\Datos 2015\\popcol2014.csv")

library(dplyr)
pop<-structure(list(Age = structure(c(1L, 2L, 3L, 4L, 5L, 6L, 7L, 
8L, 9L, 10L, 11L, 12L, 13L, 14L, 15L, 16L, 17L, 18L, 19L, 20L, 
21L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L, 12L, 13L, 
14L, 15L, 16L, 17L, 18L, 19L, 20L, 21L), .Label = c("0-4", "5-9", 
"10-14", "15-19", "20-24", "25-29", "30-34", "35-39", "40-44", 
"45-49", "50-54", "55-59", "60-64", "65-69", "70-74", "75-79", 
"80-84", "85-89", "90-94", "95-99", "100+"), class = "factor"), 
    Gender = structure(c(2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 
    2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 1L, 1L, 1L, 
    1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
    1L, 1L, 1L), .Label = c("Female", "Male"), class = "factor"), 
    Population = c(-1964756, -1994267, -2039622, -2124688, -2118563, 
    -1954437, -1698865, -1541366, -1528204, -1493985, -1298866, 
    -1042778, -753272, -502244, -351391, -237603, -132520, -53749, 
    -13703, -1915, -133, 1867368, 1900316, 1952545, 2042760, 
    2056539, 1915532, 1690376, 1570921, 1575225, 1570866, 1397974, 
    1162510, 889438, 660438, 474314, 329386, 203163, 99368, 32400, 
    6247, 684)), row.names = c(NA, -42L), class = "data.frame")


#pop$Population[pop$Gender=="Male"]<--1*pop$Population[pop$Gender=="Male"]

n1 <- ggplot(pop, aes(x = Age, y = Population, fill = Gender)) + 
  geom_bar(subset = (pop$Gender == "Female"), stat = "identity") + 
  geom_bar(subset = (pop$Gender == "Male"), stat = "identity") + 
  scale_y_continuous(breaks = seq(-15000000, 15000000, 5000000), 
                     labels = paste0(as.character(c(seq(15, 0, -5), seq(5, 15, 5))), "m")) + 
  coord_flip() + 
  scale_fill_brewer(palette = "Set1") + 
  theme_bw()
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/T1U2#17.PNG)

### Cake

>When a whole is divided into parts, this type of graph is useful since it allows representing the contribution of each part to the whole

```r
library(scales)
df <- data.frame(
  group = c("Male", "Female", "Child"),
  value = c(25, 25, 50)
  )
head(df)
```

```r
##    group value
## 1   Male     25
## 2 Female  25
## 3  Child      50
```

```r
bp<- ggplot(df, aes(x="", y=value, fill=group))+
geom_bar(width = 1, stat = "identity")
bp
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/T1U2#18.PNG)

```r
pie <- bp + coord_polar("y", start=0)
pie + scale_fill_brewer("Blues") + 
  theme(axis.text.x=element_blank())+
  geom_text(aes(y = value/3 + c(0, cumsum(value)[-length(value)]), 
                label = percent(value/100)), size=5)
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/T1U2#19.PNG)

##Sources

>Daniela Ballari. (2018). Función qplot() de ggplot2. 12/11/2020, de rpubs Sitio web: https://rpubs.com/daniballari/qplot

>Daniel Garavito. (--). Gráficas en R. 12/11/2020, de amazonaws Sitio web: https://rstudio-pubs-static.s3.amazonaws.com/415110_0f90425607e24bc2acf4f41f809633c7.html

>Juan Carlos Correa y Nelfi González. (2002). Gráficos Estadísticos con R. 12/11/2020, de Universidad Nacional-Sede Medellín Sitio web: https://cran.r-project.org/doc/contrib/grafi3.pdf







