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

# Practice 1 Linear Regression

We make our workspace, with the path of where our csv is to be worked with.

```r

getwd()
setwd("C:\\Users\\salmi\\OneDrive\\Documentos\\GitHub\\DataMining\\MachineLearning\\SimpleLinearRegression")
getwd()

```
Then we load our dataset

```r

dataset <- read.csv('Salary_Data.csv')

```
We load the library "caTools", which will help us create our linear regression model. We use set.seed, which is a randomness factor to be able to split the information, so we can have a training and test dataset, with 20 I will train and with 10 I will test. All the training ones will be "true" and the test ones will be "false".

```r

install.packages('caTools')

library(caTools)
set.seed(123)
split <- sample.split(dataset$Salary, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

```

We have our model, it will show us the summary of the regressor that shows the mean, median, quartiles, minimum value and maximum value.

```r
regressor = lm(formula = Salary ~ YearsExperience,
               data = dataset)
summary(regressor)

##Call:
##lm(formula = Salary ~ YearsExperience, data = dataset)

##Residuals:
  ##  Min      1Q   Median      3Q     Max 
##-7958.0 -4088.5  -459.9  3372.6 11448.0 

##Coefficients:
    ##            Estimate Std. Error t value Pr(>|t|)    
##(Intercept)      25792.2     2273.1   11.35 5.51e-12 ***
##YearsExperience   9450.0      378.8   24.95  < 2e-16 ***
---
##Signif. codes:  
##0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

##Residual standard error: 5788 on 28 degrees of freedom
##Multiple R-squared:  0.957,	Adjusted R-squared:  0.9554 
##F-statistic: 622.5 on 1 and 28 DF,  p-value: < 2.2e-16
```

Here we tell you what we want to predict, which is the salary, we send the model that is “regressor” and the new data to be predicted is “test_set”.

```r

y_pred = predict(regressor, newdata = test_set)

##> y_pred
        2         4         5         8        11        16 
 38077.15  44692.12  46582.12  56032.08  62647.05  72097.02 
       20        21        24        26 
 82491.97  90051.94 103281.89 110841.86

```

## Graph 1

```r

library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Training Set)') +
  xlab('Years of experience') +
  ylab('Salary')

```

>In the first linear regression graph of the training data, which is 20, the "x" axis is the years of experience and the "y" is the salaries, the slope that estimates the average the rate of change between these two and The points would be our real data, as can be seen, the data is not so far from the slope, since it is a positive linear regression, the salary tends to increase for each unit of years of experience that increases, for example the one with 7.1 years of experience and win 98,273 is a little above average since it slightly touches the line.


![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/machine1.PNG)


## Graph 2

```r

ggplot() +
  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Test Set)') +
  xlab('Years of experience') +
  ylab('Salary')
```

>In this graph is the test data that is 10, it is observed in the graph that it is of positive linear regression and the same is applied as to the previous one, the salary increases if the years of experience increase. On the slope of the average salary with the years of experience, most of the points are far from the average, for example the data of 9 years of experience earns 105,582 but is below the average so you should earn more money for your years from experience.

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/machine2.PNG)

# Practice 2  Multiple linear regression

We make our workspace, with the path of where our csv is to be worked with.

```r
getwd()
setwd("C:\\Users\\salmi\\OneDrive\\Documentos\\GitHub\\DataMining\\MachineLearning\\MultipleLinearRegression")
getwd()
```

Then we load our dataset

```r
dataset <- read.csv('50_Startups.csv')
```

We transform our data to categorical. We use our factor function of the dataset, the column we want "State", we tell it our levels and we say what we want to represent it, which has to be numeric "1,2,3".

```r
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))

dataset
```

We load the library "caTtools". We have our seed of randomness, with "split" we divide the information by 80%, it will give us 40 for training and 10 for testing. All the training ones will be "true" and the test ones will be "false".

```r
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

```

We build the model, which has a formula for us to explain what we want to model and after which data that are "training_set". Then it will show us the summary that shows the mean, median, quartiles, minimum value and maximum value.

```r
regressor = lm(formula = Profit ~ .,
               data = training_set )

summary(regressor)

```
Then we are going to predict "y", which would be the profit portion.

```r
y_pred = predict(regressor, newdata = test_set)
y_pred

```

Build the optimal model using Backward Elimination.

```r
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset )
summary(regressor)

```

Generamos las nuevas predicciones.

```r
y_pred = predict(regressor, newdata = test_set)
y_pred

```

There are 5 types of elimination, but the one that is used the most is "Backward Elimination".

Backward Elimination: Starts with all predictors in the model (full model), iteratively removes least contributing predictors, and stops when you have a model in which all predictors are statistically significant


First it is built, it begins by fitting a model with all the variables of interest. Then, the least significant variable is discarded, as long as it is not significant at our chosen critical level. We continue to successively readjust reduced models and apply the same rule until all the remaining variables are statistically significant.
This means that the independent variable with a P value greater than the chosen level of significance is iteratively eliminated until the most significant variable remains.

```r
backwardElimination <- function(x, sl) {
  numVars = length(x)
  for (i in c(1:numVars)){
    regressor = lm(formula = Profit ~ ., data = x)
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    numVars = numVars - 1
  }
  return(summary(regressor))
}

SL = 0.05

training_set
backwardElimination(training_set, SL)
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/multiple%20lineal.PNG)

# Practice 3  Logistic Regression

We make our workspace, with the path of where our csv is to be worked with.

```r
getwd()
setwd("C:\\Users\\salmi\\OneDrive\\Documentos\\GitHub\\DataMining\\MachineLearning\\LogisticRegression")
getwd()

```

Then we load our dataset. What we occupy in the dataset are only columns 3 to 5 (Age, Estimated Salary and Purchased).

```r
dataset <- read.csv('Social_Network_Ads.csv')
dataset <- dataset[, 3:5]

```

We load the library "caTtools". We have our randomness seed, We have our randomness seed, with "split" we divide the information by 75%, which are 300 training data and 100 test data.

```r
library(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

```

We use the Scale function, the data will be normalized between -1 and 1, which will be the Age and Estimated Salary columns.

```r

training_set[, 1:2] <- scale(training_set[, 1:2])
test_set[, 1:2] <- scale(test_set[, 1:2])

```

We make our classifier, using the function "glm" (Generalized linear models for binary data), our dependent variable is "Purchased" and our data will be "training_set".

```r

classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = training_set)
```

We are going to make a prediction, we enter our "classifier", which is our model, the response type will respond with the new data that would be our last column, which is the one we want to classify.
Then we have our ternary operator, where if the condition is fulfilled it will put 1 and if it is not fulfilled it will be 0.

```r

prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
prob_pred

y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred

```

We create our confusion matrix, where we tell it that we want column 3 from the test_set and against our prediction.

```r

cm = table(test_set[, 3], y_pred)
cm

```

From the above we can see the result through the following graphs of "ggplot2". We have our data that will be “training_set”, then we map the data (Estimated Salary and Purchased), with point geometry, we use the “glm” method, we use the arguments of that method with the binomial family.

```r

library(ggplot2)
ggplot(training_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/logistic%20regression1.PNG)

Here it is the same as in the previous one, only it is the mapping with age and purchased.

```r

ggplot(training_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)
```

>We have our linear regression

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/logistic%20regression2.PNG)

```r

ggplot(test_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/logistic%20regression3.PNG)

```r
ggplot(test_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/logistic%20regression4.PNG)

We installed the "ElemStatLearn" library, which is to see regions of different classes, which would be two purchases and no purchases. The graph will show the errors, the false negatives and their false positives, these with the training data. The green points that are on the red background would be the false positives and the negative points that are on the green side are the false negatives.

```r

library(ElemStatLearn)

set = training_set

X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)

grid_set = expand.grid(X1, X2)

colnames(grid_set) = c('Age', 'EstimatedSalary')

prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/logistic%20regression5.PNG)

In this graph it is the same as in the previous one, only with the test data.

```r
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))

points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/logistic%20regression6.PNG)


# Practice 4  K-NN classification template

We make our workspace, with the path of where our csv is to be worked with.

```r
getwd()
setwd("C:\\Users\\salmi\\OneDrive\\Documentos\\GitHub\\DataMining\\MachineLearning\\KNN")
getwd()

```

Then we load our dataset. What we occupy in the dataset are only columns 3 to 5 (Age, Estimated Salary and Purchased).

```r

dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

```

The following code is to have better correlation of the data.

```r
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

```

We load the library "caTtools". We have our randomness seed, We have our randomness seed, with "split" we divide the information by 75%, which are 300 training data and 100 test data.

```r
library(caTools)
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

We load the library "class". In this case we can do the classification and prediction in a single step, we use knn where with train we tell it to train with the data "training_set", we have "test", by putting the -3 is to tell it that I want all the columns except the The last one is 3 and the factor that would be our dependent variable, which is the one we want to classify, and we have K, which would be the number of neig

```r
library(class)
y_pred = knn(train = training_set[, -3],
             test = test_set[, -3],
             cl = training_set[, 3],
             k = 5)
y_pred
```

Then we have our confusion matrix.

```r
cm = table(test_set[, 3], y_pred)
cm
```

We import the library "ElemStatLearn". In X1 and X2 this section creates the red / green background region. What 'by' does is that each 0.01 is interpreted as 0 or 1 and is green or red. The -1 and +1 give us the space around the edges so that the points don't get stuck. Then we give a name to "x" and "y". Here the graph is separated by regions, since with "y_grid" we are sending the model. Already in the part of "plot" the background ends, it would already be the real data of the graph, in "contour" it creates the limits of the plotted values, it means that it creates the dividing line between red and green. Then in "Point" here we review all the data from y_pred and use ifelse to color the data points.

```r
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3],
             test = grid_set,
             cl = training_set[, 3],
             k = 5)
plot(set[, -3],
     main = 'K-NN Classifier (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

>Chart with training data.

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/knn1.PNG)

In this part it is the same as in the previous one only it is with the test data.

```r
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3],
             test = grid_set,
             cl = training_set[, 3],
             k = 5)
plot(set[, -3], main = 'K-NN Classifier (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/knn2.PNG)

# Practice 5  Desicion Three

We make our workspace, with the path of where our csv is to be worked with.

```r
getwd()
setwd("C:\\Users\\salmi\\OneDrive\\Documentos\\GitHub\\DataMining\\MachineLearning\\DesicionThree")
getwd()

```

Then we load our dataset. What we occupy in the dataset are only columns 3 to 5 (Age, Estimated Salary and Purchased).

```r

dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

```

The following code is to have better correlation of the data.

```r
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

```

We load the library "caTtools". We have our randomness seed, We have our randomness seed, with "split" we divide the information by 75%, which are 300 training data and 100 test data.

```r
library(caTools)
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

We install the "rpart" package, which will help us make the decision tree classifier. We make our formula and say what our data is, which would be "training_set"

```r
install.packages('rpart')
library(rpart)
classifier = rpart(formula = Purchased ~ .,
                   data = training_set)
```

We make our prediction, putting “type = 'class'” will give us the class we want to predict.

```r

y_pred = predict(classifier, newdata = test_set[-3], type = 'class')
y_pred

```

Then we have our confusion matrix.

```r

cm = table(test_set[, 3], y_pred)
cm

```
We import the library "ElemStatLearn". In X1 and X2 this section creates the red / green background region. What 'by' does is that each 0.01 is interpreted as 0 or 1 and is green or red. The -1 and +1 give us the space around the edges so that the points don't get stuck.
It is important to have "type = 'class'" because if not, it will send us two output columns and it has to be one, with class you get that.
Already in the part of "plot" the background ends, it would already be the real data of the graph, in "contour" it creates the limits of the plotted values, it means that it creates the dividing line between red and green. Then in "Point" here we review all the data from y_pred and use ifelse to color the data points.

```r

library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3],
     main = 'Decision Tree Classification (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

```

We have the graph of the training data. The graph shows the errors, the false negatives as their false positives. The green points that are on the red background would be the false positives and the negative points that are on the green side are the false negatives.

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/tree1.PNG)

It is the same as in the previous one only that it is the test data.

```r

library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3], main = 'Decision Tree Classification (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/tree2.PNG)


# Practice 6  Random Forest

We make our workspace, with the path of where our csv is to be worked with.

```r
getwd()
setwd("C:\\Users\\salmi\\OneDrive\\Documentos\\GitHub\\DataMining\\MachineLearning\\RandomForest")
getwd()

```

Then we load our dataset. What we occupy in the dataset are only columns 3 to 5 (Age, Estimated Salary and Purchased).

```r

dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

```

The following code is to have better correlation of the data.

```r
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

```

We load the library "caTtools". We have our randomness seed, We have our randomness seed, with "split" we divide the information by 75%, which are 300 training data and 100 test data.

```r
library(caTools)
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

We install the "randomFores" package, we have our classifier, where we want everything from the training_set except the last column, which is 3, and we tell it that we want 10 trees.

```r

install.packages('randomForest')
library(randomForest)
set.seed(123)
classifier = randomForest(x = training_set[-3],
                          y = training_set$Purchased,
                          ntree =10)

```

We have the prediction with the test data, without the last column.

```r

y_pred = predict(classifier, newdata = test_set[-3])
y_pred

```

Then we have our confusion matrix.

```r

cm = table(test_set[, 3], y_pred)
cm

```

We import the library "ElemStatLearn". In X1 and X2 this section creates the red / green background region. What 'by' does is that each 0.01 is interpreted as 0 or 1 and is green or red. The -1 and +1 give us the space around the edges so that the points don't get stuck. Already in the part of "plot" the background ends, it would already be the real data of the graph, in "contour" it creates the limits of the plotted values, it means that it creates the dividing line between red and green. Then in "Point" here we review all the data from y_pred and use ifelse to color the data points.

```r

library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, grid_set)
plot(set[, -3],
     main = 'Random Forest Classification (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

```

You can see in the graphs that there are some errors, in the green region there are some false negatives.

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/random1.PNG)

Here is the test data and the graph shows the regions with their respective errors.

```r

library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, grid_set)
plot(set[, -3], main = 'Random Forest Classification (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/random2.PNG)


It puts us all the trees that are below the threshold, it shows us graphically how the error convergence is.

```r
plot(classifier)
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/random3.PNG)


# Practice 7 SVM

We make our workspace, with the path of where our csv is to be worked with.

```r
getwd()
setwd("C:\\Users\\salmi\\OneDrive\\Documentos\\GitHub\\DataMining\\MachineLearning\\SVM")
getwd()

```

Then we load our dataset. What we occupy in the dataset are only columns 3 to 5 (Age, Estimated Salary and Purchased).

```r

dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

```

The following code is to have better correlation of the data.

```r
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

```

We load the library "caTtools". We have our randomness seed, We have our randomness seed, with "split" we divide the information by 75%, which are 300 training data and 100 test data.

```r
library(caTools)
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

We install the package "e1071", the classifier is built with the svm function.

```r

library(e1071)
classifier = svm(formula = Purchased ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')
svm

```


We have the prediction with the test data, without the last column.

```r

y_pred = predict(classifier, newdata = test_set[-3])
y_pred

```

Then we have our confusion matrix.

```r

cm = table(test_set[, 3], y_pred)
cm

```

We import the library "ElemStatLearn". In X1 and X2 this section creates the red / green background region. What 'by' does is that each 0.01 is interpreted as 0 or 1 and is green or red. The -1 and +1 give us the space around the edges so that the points don't get stuck. Already in the part of "plot" the background ends, it would already be the real data of the graph, in "contour" it creates the limits of the plotted values, it means that it creates the dividing line between red and green. Then in "Point" here we review all the data from y_pred and use ifelse to color the data points.

```r

library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'SVM (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

```

In this graph, unlike the others, the regions are separated by a line, there are 20 errors that can be seen in the graph of the training data.

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/svm1.PNG)

Here it is the same as in the previous graph only with the test data.

```r

library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'SVM (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/svm2.PNG)


# Practice 8  K-Means


We make our workspace, with the path of where our csv is to be worked with.

```r
getwd()
setwd("C:\\Users\\salmi\\OneDrive\\Documentos\\GitHub\\DataMining\\MachineLearning\\K-Means")
getwd()

```

Then we load our dataset. What we occupy in the dataset are only the columns 4 and 5.

```r
dataset = read.csv('Mall_Customers.csv')
dataset = dataset[4:5]

```

We have our seed of randomness, we are going to save the sum of the vector in the variable "wcss" and make a for that will be between 1 to 10, where in the first element I am going to put the sum of "kmeans", which is the sum of the squares. Then the plot is made, where the curve is made will be the number of points we wa

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

In the graph it alters between the number 4 and 5, which is what you are looking for (breaking point).

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/k%20means1.PNG)

We have the randomness seed of 29, we call "kmeans", where "x" represents the dataset with its two columns and "centers" which are the 5 groups.
Then we do the cluster kmeans prediction.

```r
set.seed(29)
kmeans = kmeans(x = dataset, centers = 5)
y_kmeans = kmeans$cluster

```

We import the “cluster” library, with clusplot we send our dataset, we do not occupy lines, it stays at 0 and we have parameters for the aesthetics of the graph.

```r
library(cluster)
clusplot(dataset,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')

```

>In the graph you can see the 5 groups, where 1 spends a lot, group 3 would be the normal group, group 4 spends but does not earn it would be compulsive buyers, 2 spends little and 5 earns but does not buy.


![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/k%20means2.PNG)
