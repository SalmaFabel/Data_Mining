## Exam U4 K-Means

getwd()
setwd("C:\\Users\\salmi\\OneDrive\\Documentos\\GitHub\\Mineria-de-datos\\Unit_4\\Evaluation")
getwd()

# Importing the dataset
dataset = read.csv('iris.csv')
dataset = dataset[1:4]

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
kmeans = kmeans(x = dataset, centers = 3, nstart=20)
kmeans
##Within cluster sum of squares by cluster:
##[1] 39.82097 15.24040 23.87947
##(between_SS / total_SS =  88.4 %)

y_kmeans = kmeans$cluster
y_kmeans

# Visualising the clusters
# install.packages('cluster')
library(cluster)
clusplot(dataset,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 0,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')


