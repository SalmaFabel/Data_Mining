# Unit 4

## Exam 4

### K-Means

>K-Means clustering is one of the simplest and most popular unsupervised machine learning algorithms. The goal of this algorithm is to find clusters in the data, with the number of clusters / clusters represented by variable K. The K-Means algorithm iteratively assigns each data point to the closest cluster based on characteristics.


We make our workspace, with the path of where our csv is located with which we are going to work.

```r
getwd()
setwd("C:\\Users\\salmi\\OneDrive\\Documentos\\GitHub\\Mineria-de-datos\\Unit_4\\Evaluation")
getwd()
```

Then we load our dataset which is "iris.csv".

```r
dataset = read.csv('iris.csv')
dataset = dataset[1:4]
head(dataset)
```

#### Select number of clusters

>The k-means algorithm assumes the number of clusters as part of the input. Knowing the number of clusters in advance makes it easier to configure the number of clusters. However, if you do not know the number of clusters and need to determine it, you will need to run the algorithm several times, each time with a different number of clusters. From this, you can see how a measure of model quality changes with the number of clusters. What you do is run kmeans () multiple times to see how the quality of the model changes as the number of clusters changes. Graphs showing this information help determine the number of clusters

We have our seed of randomness, we are going to save the sum of the vector in the variable "wcss" and make a for that will be between 1 to 10, where in the first element I am going to put the sum of "kmeans", which is the sum of the squares. Then the plot is made, where the curve is made will be the number of points we want.

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


As can be seen in the graph, it alters between 2 and 4, which is what we are looking for the breaking point of the graph.

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/KM2.PNG)

In the kmeans function, it is necessary to establish the center, which is the number of groups that we want to group, and we already know that there will be 3.

We have the randomness seed of 29, we call "kmeans", where "x" represents the dataset with its four columns and "centers" which are the 3 groups.

88.4% is a measure of the total variance in your data set that is explained by clustering. k-means minimize intra-group dispersion and maximize inter-group dispersion. By assigning the samples to k clusters instead of n (number of samples) clusters, a reduction in the sums of squares of 88.4% was achieved.

```r
set.seed(29)
kmeans = kmeans(x = dataset, centers = 3)
kmeans

##Within cluster sum of squares by cluster:
##[1] 39.82097 15.24040 23.87947
##(between_SS / total_SS =  88.4 %)
```

Then we do the cluster kmeans prediction.


```r
y_kmeans = kmeans$cluster
y_kmeans
```

We import the “cluster” library, with clusplot we send our dataset, we do not occupy lines, it stays at 0 and we have parameters for the aesthetics of the graph.

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

In the graph you can see the 3 groups where the first and second have an insertion between one and two, it could be said that group two is the highest, the third is the next and the lowest would be group 1 These two components explain 95.8 of the point variability.

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/KM1.PNG)

Second data display

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/KM3.PNG)

### Conclusion

In conclusion, it was easier for me to understand this model and its results since in R it allows you to see graphically, since we are more visual. k-Means is useful for exploring, describing, and summarizing data in a different way. It can also help us discover patterns and relationships that we don't know about.


[Video defending the development of the exam](https://youtu.be/9ifXjA9QqLo)
