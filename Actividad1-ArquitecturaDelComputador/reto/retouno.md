## punto 8 
**Que hace este programa?**
el programa permite guardar 3 variables en la memoria ram, comenzando desde la direccion r16
**En qué posición de la memoria está var1, var2 y var3? ¿Por qué en esas posiciones?**
en r16, r17 y r18 respectivamente. Esta en esas posiciones porque de r0 a r15 esta ocupada la memoria

## punto 9 
**¿Qué hace este programa?**
1. i = 1 
asigna el valor 1 en i 

2. sum = 0 
asigna el valor 0 a la variable sum 

3. sum = sum + i 
suma el valor de i al valor actual de sum y guarda el resultado en sum. 

4. i = i + 1
Se incrementa el valor de i en 1. 

**¿En qué parte de la memoria RAM está la variable i y sum? ¿Por qué en esas posiciones?**
Las variables i y sum se almacenan en las posiciones de la RAM asignadas, empezando desde r16 

**Optimiza esta parte del código para que use solo dos instrucciones:**
@i
M=M+1

## punto 10 
Leer el valor de R0 en D
@R0
D=M

Calcular 2 * R0 = D + D
D=D+D

Guardar el resultado en R1
@R1
M=D

## punto 11
**¿Qué hace este programa?**
Este programa muestra un loop que le resta 1 a 1000 y se repite hasta que sea 0

**¿En qué memoria está almacenada la variable i? ¿En qué dirección de esa memoria?**
la variable i esta almacenada en la ram y en la direccion R16

**¿En qué memoria y en qué dirección de memoria está almacenado el comentario //i = 1000?**
Al ser un comentario no esta almacenado en la memoria y en ninguna direccion

**¿Cuál es la primera instrucción del programa anterior? ¿En qué memoria y en qué dirección de memoria está almacenada esa instrucción?**
La primera instruccion es **@1000**, esta carga el valor 1000 en A y esta en la direccion 0 

**¿Qué son CONT y LOOP?**   
CONT y LOOP  son etiquetas que señalan direcciones en la memoria ROM, estas permiten hacer saltos en posiciones del codigo 

**¿Cuál es la diferencia entre los símbolos i y CONT?**
i es una variable almacenada en la RAM que contiene un valor. esta se puede leer y modificar
CONT es una etiqueta de direccion almacenada en la ROM, y se usa para marcar una posicion en el codigo para hacer saltos condicionales e incondicionales.

## punto 12     
