#Funciones

#Practica encontrar 20 funciones más en R y haz un ejemplo de ello.

#No.1 Definir una funcion "Los argumentos son los valores que se pasan a la función, son variables."

inverso <- function(x) {
  x <- 1 / x
  return(x)
}
inverso(8)

## [1] 0.125

inverso(1:4) ## [1] 1.0000000 0.5000000 0.3333333 0.2500000


#No.2 Esta función permite concatenar (unir) objetos: variables, texto, números, etc.

x <- c(1,2,3)
t <- c("uno","dos","tres")
x; t

##[1] 1 2 3
##[1] "uno"  "dos"  "tres"

#No.3  Calcula la raíz cuadrada de un número
sqrt(9) ##[1] 3

#No.4 Elimina los decimales de un número
x <- 56.13 
trunc(x)
##[1] 56

#No. 5 Genera n números al azar entre inicio y fin. "20 números enteros al azar entre 1 y 10"
trunc(runif(20,1,10)) ## [1] 8 7 8 8 4 4 3 7 3 6 6 5 4 6 8 4 4 5 6 8