# Unit 2


# Practice 1

*Instructions:* Investigate 5 geometry functions that can be added to the ggplot2 () function.

### Development

#### geom_bar()

To make a bar graph in ggplot2, use geom_bar (), in this example they are bars that are grouped, to be able to do this you need to have the “plotly” library that allows you to create various types of interactive graphs.

```r

library(plotly)

```

We have the following small dataframe, which has information about sex, time if it is lunch or dinner, and the account.

```r

dat1 <- data.frame(
  sex = factor(c("Female","Female","Male","Male")),
  time = factor(c("Lunch","Dinner","Lunch","Dinner"), levels=c("Lunch","Dinner")),
  total_bill = c(13.53, 16.81, 16.24, 17.42)
)

head(dat1)

```

```r

dat1 <- data.frame(
  sex = factor(c("Female","Female","Male","Male")),
  time = factor(c("Lunch","Dinner","Lunch","Dinner"), levels=c("Lunch","Dinner")),
  total_bill = c(13.53, 16.81, 16.24, 17.42)
)

head(dat1)

```

```r

     sex   time total_bill
1 Female  Lunch      13.53
2 Female Dinner      16.81
3   Male  Lunch      16.24
4   Male Dinner      17.42

```

We create our graph which stores the information in the variable "p", the previous data frame is specified, we say that "x" will be the time column if it is dinner or lunch, "y" will be the total of the account, " fill "will be the if it is male or female, then we have the geometric function" geom_bar "we specify that its position dodge so that these graphs are grouped by sex, then we convert the ggplot2 into a graphical object with" ggplotly ".

```r
p <- ggplot(dat1, aes(x=time, y=total_bill, fill=sex)) +
  geom_bar(stat="identity", position=position_dodge())
fig <- ggplotly(p)
fig

```

>Visualización de la gráfica 

As can be seen in the graph, they were grouped by sex, the information that the graph gives us is that men spend more at lunchtime, with dinner being where they spend the most for both sexes.

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/p1u1.PNG)

#### geom_col()

This function is also a bar graph, the difference is that the heights of the bars represent values ​​in the data, the csv that was seen in class is taken as an example, which has information on the movie genre.

```r
setwd('C:\\Users\\salmi\\OneDrive\\Documentos\\GitHub')
stats <- read.csv("P2-Movie-Ratings.csv")
stats
head(stats)

```

For this graph it is required to have the "ggplot2" library.

```r
library(ggplot2)

```

We rename the columns to make them shorter and easier to view.

```r
colnames(stats) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")

```

To create the graph you have to specify the csv, where "x" will be the critical rating, "y" will be the audience rating, "fill" will be the genre of the films and the color will be that of the movies. genres, then we use "geom_col", with alpha we can modify the aesthetics and the color fill.

```r
ggplot(stats, aes(x=CriticRating, y=AudienceRating,  fill=Genre, color=Genre)) + geom_col(alpha=0.6)

```

>Graph display

As can be seen in the graph, between the audience and the critics that the genres of the movies have in the form of graphs but it is not very feasible to use this type of graph for this it would be better with a scatter graph since it is a bit difficult interpret the information.

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/p1u1%202.PNG)

#### geom_histogram()

To make a histogram this function is the most indicated, taking up the csv of the class, the column of the budget of the genre of the films is taken.

```r
ggplot(stats, aes(x=BudgetMillions, fill=Genre, color=Genre)) + geom_histogram(alpha=0.6)
```

>Graph display

In the histogram we can see that in action movies they are the ones that require the most budget.

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/p1u1%203.PNG)

#### geom_errorbar()

The error graphs, these help us to see the error or the uncertainty of a value, this function is error bar graphs, for this a small dataframe is made.

```r
df <- data.frame(
  trt = factor(c(1, 1, 2, 2)),
  resp = c(1, 5, 3, 4),
  group = factor(c(1, 2, 1, 2)),
  se = c(0.1, 0.3, 0.3, 0.2)
)
df

```

```r
trt resp group  se
1   1    1     1 0.1
2   1    5     2 0.3
3   2    3     1 0.3
4   2    4     2 0.2
```

We take the limit, where the maximum would be the column "resp" adding that of "se" and the minimum would be the same but it is subtracted.

```r
limits <- aes(ymax = resp + se, ymin=resp - se)
```

The graph is made where the dataframe is specified, the color will be the "group" column, "x" will be the trt column, "y" will be "resp"

```r
p <- ggplot(df, aes(colour=group, y=resp, x=trt))
```

We specify with the “geom_line” function that the lines will be “group” and with the error bars they will be the limit, we specify the width of the objects that are going to be erroneous.

```r
p + geom_line(aes(group=group)) + geom_errorbar(limits, width=0.2)
```

>Graph display

In the graph we can see that we have two groups, with their line of how they behave between “resp” and “trt”, the maximum and minimum limits being the error.

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/p1u1%204.PNG)

#### geom_area()

The area function, the csv that was seen in class is retaken, which will have the budget in "x" and in "fill" it will be the genre of the film, the information is similar to the histogram only that here we will show it per year With the function “geom_area” we specify how the graph will be and with “facet_grid” so that it divides them by gender by year.

```r
ggplot(stats, aes(x=BudgetMillions, fill=Genre)) + geom_area(stat ="bin", alpha=0.6)+facet_grid(Genre~Year)
```

>Graph display

In the graph you can see separately the genres with their budget per year, with the naked eye you can see that action and comedy films have a high budget in the years and romance and thriller are very low in all years.

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/p1u1%205.PNG)




