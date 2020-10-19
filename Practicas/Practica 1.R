
# Pruebe la ley de los números grandes para N números aleatorios normalmente distribuidos con media = 0, stdev = 1:

# Cree un script R que contará cuántos de estos números se encuentran entre -1 y 1 y dividirá
# por la cantidad total de N

# Sabes que E (X) = 68,2%
# Verifique que Mean (Xn) -> E (X) mientras vuelve a ejecutar su script mientras aumenta N


# Pista:
# 1. Inicializar el tamaño de la muestra
# 2. Inicializar contador
# 3. bucle para (i en rnorm (tamaño))
# 4. Verifique si la variable iterada cae
# 5. Aumente el contador si la condición es verdadera
# 6. devuelve un resultado <- contador / N


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

print(Contador)#[1] 0.6826
