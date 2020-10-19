
# Unit 1

## Index

- [Practice 1](https://github.com/SalmaFabel/Mineria_de_Datos/tree/Unit_1/Practicas#practice-1)
- [Practice 2](https://github.com/SalmaFabel/Mineria_de_Datos/tree/Unit_1/Practicas#practice-2)

## Practice 1

>**Instructions:**


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

```{r}
floor(5.99)
```

>**4th  function :** trunc().

This math function removes the decimals from a number.

```{r}
x <- 56.13 
trunc(x)
##[1] 56
```
>**5th  function :** runif().

This function generates “n” random numbers between start and end, in this example it would be 20 numbers between 1 and 10 and adding the trunc function so that they are only integers.

```{r}
trunc(runif(20,1,10)) ## [1] 8 7 8 8 4 4 3 7 3 6 6 5 4 6 8 4 4 5 6 8
```
>**6th  function :** cat ().

Output the objects, concatenating the representations. cat performs much less conversion than print.

```{r}
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

```{r}
x <- runif(10, -10 ,100) # 10 random numbers between -10 and 100 are generated
if(any(x < 0)) cat("En x hay números negativos\n") # If any number of x is negative
#### In x there are negative numbers
```
>**8th  function :** sum().

It is a function of addition.

```{r}

sum(x=2,y=3)##[1] 5
sum(2,3)

```

>**9th  function :** abs().

It is a diverse mathematical function where abs (x) calculates the absolute value of x.

```{r}
abs(-3)
##[1] 3
```

>**Declaration of character** 

```{r}
cadena = "OpenWebinars"
```

>**10th  function :** substr().

This is a character function, which extracts or replaces substrings in a character vector.
Where the character vector is written first, then where it begins and where it must end.

```{r,echo=true}

substr(cadena, start = 1, stop = 4) ##[1] "Open"

```
>**11th  function :** tolower().

The tolower () function passes a string to lowercase.

```{r}
tolower(cadena)##[1] "openwebinars"
```

>**Vector declaration**

```{r}
vector = c(5,6,7,8,9)
```

>**12th  function :** mean().

This is a statistical function for the arithmetic mean.

```{r}
mean(vector) ##[1] 7
```

>**13th  function :** median().

This function calculates the median of the sample.

```{r}
median(vector) ##[1] 7
```

>**14th  function :** max().

With this function we obtain the maximum value of the vector.

```{r}
max(vector) ##[1] 9
```

>**15th  function :** max().

This function shows the minimum value and maximum value of a vector.

```{r}
range(vector)##[1] 5 9
```

>**16th  function :** unique().

We can obtain the unique values ​​of a vector, eliminating the records that are duplicated with the unique () function.

```{r}
v1 = c(2,2,2,4,4,4)

unique(v1)##[1] 2  4
```

>**17th  function :** toupper().

This function returns an uppercase string.

```{r}
toupper(cadena) ##[1] "OPENWEBINARS"
```

>**18th  function :** sin().

It is a trigonometric function that calculates the sign of the given value.

```{r}
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