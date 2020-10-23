
# Unit 1

## Index

- [Practice GitFlow](https://github.com/SalmaFabel/Mineria_de_Datos/blob/Unit_1/Practicas/Practice%20GitFlow.md#practice-gitflow)
- [Practice 1](https://github.com/SalmaFabel/Mineria_de_Datos/tree/Unit_1/Practicas#practice-1)
- [Practice 2](https://github.com/SalmaFabel/Mineria_de_Datos/tree/Unit_1/Practicas#practice-2)
- [Practice 3](https://github.com/SalmaFabel/Mineria_de_Datos/tree/Unit_1/Practicas#practice-3)
- [Practice 4](https://github.com/SalmaFabel/Mineria_de_Datos/tree/Unit_1/Practicas#practice-4)

## Practice 1

>**Instructions:**

>Test the Law Of Large Numbers for N random normally distributed numbers with mean = 0, stdev=1:

>Create an R script that will count how many of these numbers fall between -1 and 1 and divide
by the total quantity of N

>You know that E(X) = 68.2%

>Check that Mean(Xn)->E(X) as you rerun your script while increasing N

>Hint:
>1. Initialize sample size
>2. Initialize counter
>3. loop for(i in rnorm(size))
>4. Check if the iterated variable falls
>5. Increase counter if the condition is true
>6. return a result <- counter / N

In this practice the law of large numbers was applied using rnorm, first as the instructions say, the sample size is declared, then there is the counter that starts from 0, then there is the creation of the (for) loop where mean would be the vector mean and sd would be the standard deviation vector, the vector with random numbers is generated. In part 3 of the instructions it explains how the for should be declared, in the size part since we are using rnorm it is used in the following way rnorm (10000, mean = 0, sd = 1) where N is the length of the sample .
Then there is the condition, as we want to know how many numbers there are between -1 to 1, the condition is written if i of the for loop that generates is within that range, the counter that was declared at the beginning will increase by 1, once the forum reaches the number of the sample of the times of the cycle, the result variable is declared which as the instructions say will be the counter between the sample number and then the result is printed which the times it was executed were 0.6818, 0.6788 and 0.6782. It was tested with 3 sample types of 10, 100 and 10000, but the one that was within the range was 1000

```r

Contador <-0

for(i in rnorm(10000, mean = 0, sd=1))
{
  if(i >= -1 && i <= 1){
    Contador<- Contador+1
  }
  else
  {
    
  }
}
resultado <- Contador/N

print(resultado)#[1] 0.6826

```

## Practice 2

In this practice, there are 20 more functions in R than had been explained in class and an example of each of them was made.

>**1st  function :** barplot().

Create a bar chart with vertical or horizontal bars.

```r
x <- c(1,2,3)
barplot(x)
```
![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/Funcion1.PNG)

>**2nd  function :** hist().

The generic function hist calculates a histogram of the given data values.

```r
hist ( x )
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/Funcion2.PNG)

>**3rd  function :** floor().

It is a mathematical function that returns the first smallest integer.

```r
floor(5.99)
```

>**4th  function :** trunc().

This math function removes the decimals from a number.

```r
x <- 56.13 
trunc(x)
##[1] 56
```
>**5th  function :** runif().

This function generates “n” random numbers between start and end, in this example it would be 20 numbers between 1 and 10 and adding the trunc function so that they are only integers.

```r
trunc(runif(20,1,10)) ## [1] 8 7 8 8 4 4 3 7 3 6 6 5 4 6 8 4 4 5 6 8
```
>**6th  function :** cat ().

Output the objects, concatenating the representations. cat performs much less conversion than print.

```r
f <- function() 
{
  cat("Hola Mundo")
}
f()##Hola Mundo
class(f) ##[1] "function"
```

>**7th  function :** cat ().

This function given a set of logical vectors, is at least one of the values ​​true?
 Returns if any element meets the condition.

```r
x <- runif(10, -10 ,100) # 10 random numbers between -10 and 100 are generated
if(any(x < 0)) cat("En x hay números negativos\n") # If any number of x is negative
#### In x there are negative numbers
```
>**8th  function :** sum().

It is a function of addition.

```r

sum(x=2,y=3)##[1] 5
sum(2,3)

```

>**9th  function :** abs().

It is a diverse mathematical function where abs (x) calculates the absolute value of x.

```r
abs(-3)
##[1] 3
```

>**Declaration of character** 

```r
cadena = "OpenWebinars"
```

>**10th  function :** substr().

This is a character function, which extracts or replaces substrings in a character vector.
Where the character vector is written first, then where it begins and where it must end.

```r

substr(cadena, start = 1, stop = 4) ##[1] "Open"

```
>**11th  function :** tolower().

The tolower () function passes a string to lowercase.

```r
tolower(cadena)##[1] "openwebinars"
```

>**Vector declaration**

```r
vector = c(5,6,7,8,9)
```

>**12th  function :** mean().

This is a statistical function for the arithmetic mean.

```r
mean(vector) ##[1] 7
```

>**13th  function :** median().

This function calculates the median of the sample.

```r
median(vector) ##[1] 7
```

>**14th  function :** max().

With this function we obtain the maximum value of the vector.

```r
max(vector) ##[1] 9
```

>**15th  function :** max().

This function shows the minimum value and maximum value of a vector.

```r
range(vector)##[1] 5 9
```

>**16th  function :** unique().

We can obtain the unique values ​​of a vector, eliminating the records that are duplicated with the unique () function.

```r
v1 = c(2,2,2,4,4,4)

unique(v1)##[1] 2  4
```

>**17th  function :** toupper().

This function returns an uppercase string.

```r
toupper(cadena) ##[1] "OPENWEBINARS"
```

>**18th  function :** sin().

It is a trigonometric function that calculates the sign of the given value.

```r
sin(-2*pi) ##[1] 2.449213e-16
```

>**19th  function :** mode().

With this function we can know or change the mode or type of the elements that make up the vector.

```r
y<-seq(from=3, to=11, by=2)
mode(y)##"numeric"
# We change the vector y, to components in the complexes
mode(y)<-"complex"
y ##[1]  3+0i  5+0i  7+0i  9+0i 11+0i
```
>**20th  function :** sort().

This function sorts (or orders) a vector or factor (partially) in ascending or descending order.

```r
sort(vector)##[1] 5 6 7 8 9
```
## Practice 3

>Scenario: You are a Data Scientist working for a consulting firm.

>One of your colleagues from the Auditing Department has asked you

>to help them assess the financial statement of organization X.

>You have been supplied with two vector of data: mounthly revenue and

>expenses for the financial year in quiestion. Your task is to calculate

>the following financial matrics:
  
>- profit for each mounth
>- profit after tax for each month (the tax rate is 30%)
>- profit margin for each month - equal to profit after tax divided by revenue
>- good months - where the profit after tax was greater than the mean for the year
>- bad months - where the profit after tax was less then the mean for years
>- the best month - where the profit after tax was max for the year
>- the worst month - where the profit after tax was min for the year

>All results need to be presented as vectors.

>Results for dollar values need to be calculate with $0.01 precision, but need to be presented in Units of $1,000(i.e. 1k) with no decimal point.

>Results for the profit margin ratio needed to be presented in units of % with no decimal points.

>Note: Your collegue has warned you that it is okay for tax for any given month to be negative (in accounting terms, negative tax translates into a deferred tax asset).

>Data

First we have the following vectors, one is income and the other is expenses.

```r
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)
```
### Solution
>Calculate Profit As The Differences Between Revenue And Expenses

The expenses will be subtracted from the income, the numerical variable "profit" will be saved within that variable the result.

```r
profit <- revenue - expenses
profit
```

>Calculate Tax As 30% Of Profit And Round To 2 Decimal Points

"Round" is used to round the result of the operation, within the function "profit" will be multiplied, which are the profits that were previously calculated and then we specify that the rounding of the result will be 2 decimal points, all this goes to save in the variable "tax".

```r
tax <- round(0.30 * profit, 2)
tax 
```

>Calculate Profit Remaining After Tax Is Deducted

Since the remaining earnings after taxes are calculated, "profit" is subtracted, which is the earnings, minus the taxes that were calculated in "tax".

```r
profit.after.tax <- profit - tax
profit.after.tax
```

>Calculate The Profit Margin As Profit After Tax Over Revenue

>Round To 2 Decimal Points, Then Multiply By 100 To Get %

In this part all the operation goes inside the round function so that it rounds the result the same as when the profit was calculated in 2 decimal points. As the instruction says it will be the profit margin, which would be the profit after taxes that were calculated above on income, and at the end it is multiplied by 100 to get the percentage of the result after rounding.

```r
profit.margin <- round(profit.after.tax/revenue, 2) * 100
profit.margin
```

>Calculate The Mean Profit After Tax For The 12 Months

In this part, we use the “mean” function to average the earnings after taxes.

```r
mean_pat <- mean(profit.after.tax)
mean_pat
```

>Find The Months With Above-Mean Profit After Tax

Here the result will give us "true" or "false" if there was a profit that month or not, for that is "mean_pat" which calculates the mean of a set of patterns.

```r
good.months <- profit.after.tax > mean_pat
good.months
```

>Bad Months Are The Opposite Of Good Months !

What is done here is that the "true" are now false and vice versa.

```r
bad.months <- !good.months
bad.months
```

>The Best Month Is Where Profit After Tax Was Equal To The Maximum

Now to know which was the best month will be the one where the profit after tax is equal to the maximum profit after tax and sandra is true in that month.

```r
best.month <- profit.after.tax == max(profit.after.tax)
best.month
```

>The Worst Month Is Where Profit After Tax Was Equal To The Minimum

Same as the previous one, only instead of using the max function to get the maximum profit after taxes, it would be the min to get the lowest of this and it will show true in the month that was worst.

```r
worst.month <- profit.after.tax == min(profit.after.tax)
worst.month
```

>Convert All Calculations To Units Of One Thousand Dollars

Finally, to see the results in units of one thousand dollars, dividing it by 1000 and at the end rounding the result.

```r
revenue.1000 <- round(revenue/1000,0)
expenses.1000 <- round(expenses/1000,0)
profit.1000 <- round(profit/1000,0)
profit.after.tax.1000 <- round(profit.after.tax/1000,0)
```
>Print Results

```r
revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month
```

>BONUS:

>Preview Of What's Coming In The Next Section

```r
M <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit.after.tax.1000,
  profit.margin,
  good.months,
  bad.months,
  best.month,
  worst.month
)
M
```

## Practice 4

>[Practice 4](https://docs.google.com/document/d/1bHfNwDUUhB2INAsmONEcNZl6nahIRc6T5l1LXDeIQ2M/edit?usp=sharing)
