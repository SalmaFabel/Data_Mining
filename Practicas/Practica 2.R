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

#No.3  Devuelve el primer entero más pequeño 
floor(5.99)  ##[1] 5

#No.4 Elimina los decimales de un número
x <- 56.13 
trunc(x)
##[1] 56

#No. 5 Genera n números al azar entre inicio y fin. "20 números enteros al azar entre 1 y 10"
trunc(runif(20,1,10)) ## [1] 8 7 8 8 4 4 3 7 3 6 6 5 4 6 8 4 4 5 6 8

#No 6 Esta función escribe texto y variables en la salida.

f <- function() 
{
  cat("Hola Mundo")
}
f()##Hola Mundo
class(f) ##[1] "function"

#No. 7 Devuelve T si algún elemento cumple la condición

x <- runif(10, -10 ,100) # Se generan 10 números aleatorios entre -10 y 100
if(any(x < 0)) cat("En x hay números negativos\n") # Si algún números de x es negativo
#### En x hay números negativos

#No. 8  Función suma
sum(x=2,y=3)##[1] 5
sum(2,3)

#No.9 Valor absoluto de x
abs(-3)
##[1] 3

#No.10  Lo que hace la función substr(x) es devolver una subcadena de la cadena que le hemos pasado.

cadena = "OpenWebinars"

substr(cadena, start = 1, stop = 4) ##[1] "Open"

#No.11 La función tolower() pasa una cadena a minúsculas

tolower(cadena)##[1] "openwebinars"

#No. 12 Para calcular la media aritmética o promedio del vector
vector = c(5,6,7,8,9)
mean(vector) ##[1] 7

#No. 13 Para obtener la mediana del vector
median(vector) ##[1] 7

#No. 14  obtenemos el valor máximo del vector 
max(vector) ##[1] 9

#No.15  muestra el valor mínimo y valor máximo en este caso del vector
range(vector)##[1] 5 9

#No.16 Podemos obtener los valores únicos de un vector, eliminando los registros que están duplicados 
v1 = c(2,2,2,4,4,4)

unique(v1)##[1] 2  4

#No.17 Esta función devuelve una cadena en mayúsculas
toupper(cadena) ##[1] "OPENWEBINARS"

#No.18 Funciones trigonométricas
sin(-2*pi) ##[1] 2.449213e-16

#No. 19 podemos conocer o cambiar el modo o tipo de los elementos que forman el vector mediante la función "mode" 
y<-seq(from=3, to=11, by=2)
mode(y)##"numeric"
# Cambiamos el vector y, a componentes en los complejos
mode(y)<-"complex"
y ##[1]  3+0i  5+0i  7+0i  9+0i 11+0i

#No.20 Una version ordenada del Vector
sort(vector)##[1] 5 6 7 8 9