# Unit 3

## Unit 3 Index

### Practice

- [Practice 1 : Linear Regression](https://github.com/SalmaFabel/Mineria_de_Datos/tree/Unit_3/Unit%203/Practices#practice-1-linear-regression)
- [Practice 2 : Multiple Linear Regression](https://github.com/SalmaFabel/Mineria_de_Datos/tree/Unit_3/Unit%203/Practices#practice-2--multiple-linear-regression)
- [Practice 3 : Logistic Regression]()

### Research / Homework

- [Machine Learning](https://github.com/SalmaFabel/Mineria_de_Datos/blob/Unit_3/Unit%203/Research%20-%20Homework/Machine%20Learning.md#machine-learning)
- [Scale function](https://github.com/SalmaFabel/Mineria_de_Datos/blob/Unit_3/Unit%203/Research%20-%20Homework/Scale.md#scale-function)


### Exam 3

- [Exam 3]()

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





# Practice 4  K-NN classification template




# Practice 5  Desicion Three




# Practice 6  Random Forest




# Practice 7 SVM




# Practice 8  K-Means

