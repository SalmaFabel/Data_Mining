
# Unit 1
##Index

- [Practice 1](https://github.com/SalmaFabel/Mineria_de_Datos/tree/Unit_1/Practicas#practice-1)
- [Practice 2](https://github.com/SalmaFabel/Mineria_de_Datos/tree/Unit_1/Practicas#practice-2)

## Practice 1











## Practice 2

In this practice, there are 20 more functions in R than had been explained in class and an example of each of them was made.

>**1st  function :** barplot().

Create a bar chart with vertical or horizontal bars.

```{r,echo=true}
x <- c(1,2,3)
barplot(x)
```
![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/Funcion1.PNG)

>**2nd  function :** hist().

The generic function hist calculates a histogram of the given data values.

```{r,echo=true}
hist ( x )
```

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/Funcion2.PNG)

>**3rd  function :** floor().

It is a mathematical function that returns the first smallest integer.

```{r,echo=true}
floor(5.99)
```

>**4th  function :** trunc().

This math function removes the decimals from a number.

```{r,echo=true}
x <- 56.13 
trunc(x)
##[1] 56
```
>**5th  function :** runif().

This function generates “n” random numbers between start and end, in this example it would be 20 numbers between 1 and 10 and adding the trunc function so that they are only integers.

```{r,echo=true}
trunc(runif(20,1,10)) ## [1] 8 7 8 8 4 4 3 7 3 6 6 5 4 6 8 4 4 5 6 8
```
>**6th  function :** cat ().

Output the objects, concatenating the representations. cat performs much less conversion than print.

```{r,echo=true}
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

```{r,echo=true}
x <- runif(10, -10 ,100) # 10 random numbers between -10 and 100 are generated
if(any(x < 0)) cat("En x hay números negativos\n") # If any number of x is negative
#### In x there are negative numbers
```
>**8th  function :** sum().

It is a function of addition.

```{r,echo=true}
sum(x=2,y=3)##[1] 5
sum(2,3)
```

>**9th  function :** abs().

It is a diverse mathematical function where abs (x) calculates the absolute value of x.

```{r,echo=true}
abs(-3)
##[1] 3
```

>**Declaration of character** 

```{r,echo=true}
cadena = "OpenWebinars"
```

>**10th  function :** substr().

This is a character function, which extracts or replaces substrings in a character vector.
Where the character vector is written first, then where it begins and where it must end.

```{r,echo=true}
substr(cadena, start = 1, stop = 4) ##[1] "Open"
```

```{r,echo=true}

```