# Unit 3

## Unit 3 Index

### Practice

- [Practice 1 : Linear Regression](https://github.com/SalmaFabel/Mineria_de_Datos/tree/Unit_3/Unit%203/Practices#practice-1-linear-regression)
- [Practice 2 : Multiple Linear Regression](https://github.com/SalmaFabel/Mineria_de_Datos/tree/Unit_3/Unit%203/Practices#practice-2--multiple-linear-regression)
- [Practice 3 : Logistic Regression](https://github.com/SalmaFabel/Mineria_de_Datos/tree/Unit_3/Unit%203/Practices#practice-3--logistic-regression)
- [Practice 4 : K-NN classification template](https://github.com/SalmaFabel/Mineria_de_Datos/tree/Unit_3/Unit%203/Practices#practice-4--k-nn-classification-template)
- [Practice 5 : Desicion Three](https://github.com/SalmaFabel/Mineria_de_Datos/tree/Unit_3/Unit%203/Practices#practice-5--desicion-three)
- [Practice 6 : Random Forest](https://github.com/SalmaFabel/Mineria_de_Datos/tree/Unit_3/Unit%203/Practices#practice-6--random-forest)
- [Practice 7 : SVM](https://github.com/SalmaFabel/Mineria_de_Datos/tree/Unit_3/Unit%203/Practices#practice-7-svm)
- [Practice 8 : K-Means](https://github.com/SalmaFabel/Mineria_de_Datos/tree/Unit_3/Unit%203/Practices#practice-8--k-means)

### Research / Homework

- [Machine Learning](https://github.com/SalmaFabel/Mineria_de_Datos/blob/Unit_3/Unit%203/Research%20-%20Homework/Machine%20Learning.md#machine-learning)
- [Scale function](https://github.com/SalmaFabel/Mineria_de_Datos/blob/Unit_3/Unit%203/Research%20-%20Homework/Scale.md#scale-function)


### Exam 3

- [Exam 3](https://github.com/SalmaFabel/Mineria_de_Datos/tree/Unit_3/Unit%203/Evaluation#exam-3)

# Exam 3

#### Naive Bayes 

>Naïve Bayes' idea is simple, but effective. We use the conditional probabilities of words in a text to determine which category it belongs to, these are calculated with Bayes' theorem.

>For example, if we want to classify reviews of a service into two categories, "positive" and "negative", we have to determine which words are most likely to be found in each of them. We can imagine that a review is more likely to fall into the 'positive' category if it contains words like 'good' or 'excellent', and less likely if it contains words like 'bad' or 'poor'.

>They assume that the predictor variables are independent of each other. In other words, that the presence of a certain feature in a data set is not at all related to the presence of any other feature.

>In other words, this type of algorithm treats its variables separately, completely ignoring any relationship rule that may exist between variables, for example, a certain logical order, a certain structure, some special characteristic, etc. In short, each variable is independent.

##### Explanation of the code


We make our workspace, with the path of where our csv is located with which we are going to work.

```r

getwd()
setwd("C:\\Users\\salmi\\OneDrive\\Documentos\\GitHub\\Mineria-de-datos\\Unit 3\\Evaluation")
getwd()

```

Then we load our dataset which is "Social_Network_Ads".

```r

dataset = read.csv('Social_Network_Ads.csv')

```

We load the following libraries that we are going to use, which are "e1071" and "caTools", which are the ones we have been working with.

```r

library(e1071) 
library(caTools)

```

What we occupy in the dataset are only columns 3 to 5 (Age, Estimated Salary and Purchased).

```r
dataset = dataset[3:5]
head(dataset)

##   Age EstimatedSalary Purchased
## 1  19           19000         0
## 2  35           20000         0
## 3  26           43000         0
## 4  27           57000         0
## 5  19           76000         0
## 6  27           58000         0

```

The following code is to have better correlation of the data.

```r
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

```

We have our seed of randomness, with "split" we divide the information by 75%, which is 300 training data and 100 test data.

```r
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

```

We use the Scale function, the data will be normalized between -1 and 1, which will be the Age and Estimated Salary columns.

```r
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

```

We build the naive bayes classifier, we don't need formulas and other functions we only need "x" and "y", where x will be the independent variable, minus the last column (-3) and "y" will be the dependent one.

```r
classifier = naiveBayes(x = training_set[-3],
                        y = training_set$Purchased)
naiveBayes
```

We have the prediction with the test data, without the last column.

```r
y_pred = predict(classifier, newdata = test_set[-3])
y_pred
```

Then we have our confusion matrix, where we tell it that we want column 3 from the test_set and against our prediction.

```r
cm = table(test_set[, 3], y_pred)
cm

#correct predictions 86
# 14 incorrect predictions
#y_pred
#0  1
#0 57  7
#1  7 29

```

We import the library "ElemStatLearn". In X1 and X2 this section creates the red / green background region. What 'by' does is that each 0.01 is interpreted as 0 or 1 and is green or red. The -1 and +1 give us the space around the edges so that the points don't get stuck.
"Y_grid", here we use the classifier to predict the result of each of the data. Already in the part of "plot" the background ends, it would already be the real data of the graph, in "contour" it creates the limits of the plotted values, it means that it creates the dividing line between red and green. Then in "Point" here we review all the data from y_pred and use ifelse to color the data points.


```r
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'Naive Bayes(Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

```
>Training data

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/naivebayesR1.PNG)

```r
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'Naive Bayes(Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

```

>Test data.

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/naivebayesR2.PNG)

## conclusion

In conclusion, the graphs show that our model has classified the set of tests with a perfect non-linear decision limit.
The classifier has created a Gaussian curve to divide the variables. There are some incorrect predictions that we have calculated in the Confusion Matrix, where 86 predictions are correct and 14 are not. But it's still a pretty good  classifier.