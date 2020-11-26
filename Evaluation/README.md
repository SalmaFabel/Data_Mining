## Unit 1

### Exam 1

>First the package "ggplot2" must be installed so that the scatter plots can be made, then library () is used to load the package.

```r
install.packages("ggplot2")
library(ggplot2)
```

>We have to load our CSV file, for this we first specify the path of where the data source is, as follows is how it is done in windows, then the data is imported and then we make the data be displayed to see if everything is loaded successfully.

```r
setwd('C:\\Users\\salmi\\OneDrive\\Documentos\\GitHub\\Mineria-de-datos\\Evaluation')
stats <- read.csv("DataFramesEvaluation_Data.csv")
stats
```

>There are the following vectors that are the name of the countries, their code and the region.

```r
Countries_2012_Dataset <- c("Aruba","Afghanistan",......
Codes_2012_Dataset <- c("ABW","AFG","AGO","ALB","ARE",......
Regions_2012_Dataset <- c("The Americas","Asia","Africa",......
```

>After with the previous vectors, the dataframe is created with “data.frame ()” specifying that the vector “Countries_2012_Dataset” will be Country, etc. as follows.

```r
mydf1 <- data.frame(Country= Countries_2012_Dataset, Code= Codes_2012_Dataset,
                   Region= Regions_2012_Dataset)

head(mydf1)
tail(mydf1)
summary(mydf1)
```

>We have the following vectors, with the life expectancy data for the years 1960 and 2013.

```r
Country_Code <- c("ABW","AFG","AGO","ALB","ARE",......
Life_Expectancy_At_Birth_1960 <- c(65.5693658536586,.....
Life_Expectancy_At_Birth_2013 <- c(75.3286585365854,......
```

>As was done with the previous vectors, a dataframe 2 is made, being the vector “Country_Code” with the name of Code, etc.

```r
mydf2 <- data.frame(Code= Country_Code, Life_Expectancy1960= Life_Expectancy_At_Birth_1960,
                    Life_Expectancy2013= Life_Expectancy_At_Birth_2013)

head(mydf2)
tail(mydf2)
summary(mydf2)
```

>Then we use merge to combine the data frames, it is done as a join, first we specify the data frame that is "stats" with the data frame that was made, then we specify the columns that are going to be merged being the column " Country.Code ”which is similar to the“ Code ”of our dataframe.

```r
merged1 <- merge(stats, mydf1, by.x = "Country.Code", by.y = "Code")
head(merged1)

merged2 <- merge(stats, mydf2, by.x = "Country.Code", by.y = "Code")
head(merged2)
```

```r
merged1 <- merge(stats, mydf1, by.x = "Country.Code", by.y = "Code")
head(merged1)

merged2 <- merge(stats, mydf2, by.x = "Country.Code", by.y = "Code")
head(merged2)
```

#### Scatter plots

##### 1960

>To make the scatter graph as the instructions say the part of the graph, x will be the fertility that has the name "Fertility.Rate" and "y" will be "Life_Expectancy1960" and color will be the country code.

```r
qplot(data = merged2, x = Fertility.Rate, y = Life_Expectancy1960,
      color = Country.Code, size=I(3), shape=I(19), alpha =I(.4), 
      main = "Fertility.Rate vs Life_Expectancy1960")
```

>In the following graph it is the same as the previous one, only this time it is by region.

```r
qplot(data = merged2, x = Fertility.Rate, y = Life_Expectancy1960,
      color = Region, size=I(3), shape=I(19), alpha =I(.4), 
      main = "Fertility.Rate vs Life_Expectancy1960(Region)")
```
##### 2013

>Since it cannot be seen in the scatter charts by country code, a form was made to analyze the countries by region as follows:

```r
qplot(data = stats3, x = Fertility.Rate, y = Life_Expectancy2013,
      color = Country.Code, size=I(3), shape=I(19), alpha =I(.4), 
      main = "Fertility.Rate vs Life_Expectancy2013(Country)")

stats3<-merged2[merged2$Region=="Oceania",]
```

>By region.

```r
qplot(data = merged2, x = Fertility.Rate, y = Life_Expectancy2013,
      color = Region, size=I(3), shape=I(19), alpha =I(.4), 
      main = "Fertility.Rate vs Life_Expectancy2013(Region)")
```

