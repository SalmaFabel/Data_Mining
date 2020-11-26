#Functions

#Practice 2, find 20 more functions in R and make an example of it.

# No.1 barplot(), bar chart with bars.

x <- c(1,2,3)
barplot(x)

# No.2 hist(), Histogram

hist ( x )

#No.3 floor()  

floor(5.99)  ##[1] 5

# No.4 trunc (), removes decimals from a number

x <- 56.13 
trunc(x)
##[1] 56

#Not. 5 runif (), generates n random numbers between start and end.

trunc(runif(20,1,10)) ## [1] 8 7 8 8 4 4 3 7 3 6 6 5 4 6 8 4 4 5 6 8

#No 6 cat (), this function writes text and variables to the output.

f <- function() 
{
  cat("Hola Mundo")
}
f()##Hola Mundo
class(f) ##[1] "function"

#No. 7 any()

x <- runif(10, -10 ,100) # Se generan 10 números aleatorios entre -10 y 100
if(any(x < 0)) cat("En x hay números negativos\n") # Si algún números de x es negativo
#### En x hay números negativos

#Not. 8 sum (), sum function

sum(x=2,y=3)##[1] 5
sum(2,3)

#No.9 abs(),Absolute value

abs(-3)
##[1] 3

#No.10 What the substr (x) function does is return a substring of the string that we have passed to it.

cadena = "OpenWebinars"

substr(cadena, start = 1, stop = 4) ##[1] "Open"

# No.11 The tolower () function passes a string to lowercase

tolower(cadena)##[1] "openwebinars"

#No. 12 mean () calculates the arithmetic mean or average of the vector

vector = c(5,6,7,8,9)
mean(vector) ##[1] 7

#No. 13 Median of vector

median(vector) ##[1] 7

#No. 14 the maximum value of the vector

max(vector) ##[1] 9

# No.15 shows the minimum value and maximum value

range(vector)##[1] 5 9


# No.16 unique (), We can get the unique values ??????of a vector

v1 = c(2,2,2,4,4,4)

unique(v1)##[1] 2  4


# No.17 This function returns an uppercase string

toupper(cadena) ##[1] "OPENWEBINARS"


# No.18 sin() Trigonometric function

sin(-2*pi) ##[1] 2.449213e-16


#Not. 19 we can know or change the mode or type of the elements that make up the vector using the mode function

y<-seq(from=3, to=11, by=2)
mode(y)##"numeric"
# We change the vector y, to components in the complexes
mode(y)<-"complex"
y ##[1]  3+0i  5+0i  7+0i  9+0i 11+0i


# No.20 A neat version of the Vector

sort(vector)##[1] 5 6 7 8 9