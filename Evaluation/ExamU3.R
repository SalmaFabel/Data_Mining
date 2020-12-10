## Exam U3

getwd()
setwd("C:\\Users\\salmi\\OneDrive\\Documentos\\GitHub\\Mineria-de-datos\\Evaluation")
getwd()


dataset = read.csv('Social_Network_Ads.csv')


library(e1071) 
library(caTools)

dataset = dataset[3:5]


dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))


set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])




classifier = naiveBayes(formula = Purchased ~ .,
                        data = training_set,
                        type = 'C-classification',
                        kernel = 'linear')
naiveBayes



