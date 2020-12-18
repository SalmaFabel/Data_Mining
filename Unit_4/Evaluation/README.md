# Unit 4

## Exam 4


```r
getwd()
setwd("C:\\Users\\salmi\\OneDrive\\Documentos\\GitHub\\Mineria-de-datos\\Unit_4\\Evaluation")
getwd()
```



```r
dataset = read.csv('iris.csv')
dataset = dataset[1:4]
head(dataset)
```


```r
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')
```



```r
set.seed(29)
kmeans = kmeans(x = dataset, centers = 3)
kmeans
```


```r
y_kmeans = kmeans$cluster
y_kmeans
```

```r
library(cluster)
clusplot(dataset,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 0,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of Iris'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')
```
