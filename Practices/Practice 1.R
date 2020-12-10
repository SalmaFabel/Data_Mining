#Practice 1
#Investigate 5 geometry functions that can be added to the ggplot2 () function.

#geom_bar()
library(plotly)

dat1 <- data.frame(
  sex = factor(c("Female","Female","Male","Male")),
  time = factor(c("Lunch","Dinner","Lunch","Dinner"), levels=c("Lunch","Dinner")),
  total_bill = c(13.53, 16.81, 16.24, 17.42)
)

head(dat1)

p <- ggplot(dat1, aes(x=time, y=total_bill, fill=sex)) +
  geom_bar(stat="identity", position=position_dodge())
fig <- ggplotly(p)
fig 

#geom_col()

setwd('C:\\Users\\salmi\\OneDrive\\Documentos\\GitHub')
stats <- read.csv("P2-Movie-Ratings.csv")
stats
head(stats)

library(ggplot2)

colnames(stats) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")

ggplot(stats, aes(x=CriticRating, y=AudienceRating,  fill=Genre, color=Genre)) + geom_col(alpha=0.6)

#geom_histogram()

ggplot(stats, aes(x=BudgetMillions, fill=Genre, color=Genre)) + geom_histogram(alpha=0.6)

#geom_errorbar()


df <- data.frame(
  trt = factor(c(1, 1, 2, 2)),
  resp = c(1, 5, 3, 4),
  group = factor(c(1, 2, 1, 2)),
  se = c(0.1, 0.3, 0.3, 0.2)
)
df

limits <- aes(ymax = resp + se, ymin=resp - se)

p <- ggplot(df, aes(colour=group, y=resp, x=trt))

p + geom_line(aes(group=group)) + geom_errorbar(limits, width=0.2)

#geom_area()

ggplot(stats, aes(x=BudgetMillions, fill=Genre)) + geom_area(stat ="bin", alpha=0.6)+facet_grid(Genre~Year)


