## Exam U4 K-Means

getwd()
setwd("C:\\Users\\salmi\\OneDrive\\Documentos\\GitHub\\Mineria-de-datos\\Unit_4\\Evaluation")
getwd()

# Importing the dataset
dataset = read.csv('iris.csv')
dataset = dataset[1:4]
head(dataset)

##sepal_length sepal_width petal_length petal_width
##1          5.1         3.5          1.4         0.2
##2          4.9         3.0          1.4         0.2
##3          4.7         3.2          1.3         0.2
##4          4.6         3.1          1.5         0.2
##5          5.0         3.6          1.4         0.2
##6          5.4         3.9          1.7         0.4


# Using the elbow method to find the optimal number of clusters
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')


# Fitting K-Means to the dataset
set.seed(29)
kmeans = kmeans(x = dataset, centers = 3)
kmeans

##Within cluster sum of squares by cluster:
##[1] 39.82097 15.24040 23.87947
##(between_SS / total_SS =  88.4 %)

y_kmeans = kmeans$cluster
y_kmeans

##[1] 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
##[30] 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 1 1 2 1 1 1 1 1
##[59] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 1 1 1 1 1 1 1 1 1
##[88] 1 1 1 1 1 1 1 1 1 1 1 1 1 2 1 2 2 2 2 1 2 2 2 2 2 2 1 1 2
##[117] 2 2 2 1 2 1 2 1 2 2 1 1 2 2 2 2 2 1 2 2 2 2 1 2 2 2 1 2 2
##[146] 2 1 2 2 1


# Visualising the clusters
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


