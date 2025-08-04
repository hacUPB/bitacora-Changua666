# Actividad 1
```
section .data
sum dd 0
i dd 1
limit dd 100

section .text
global _start

_start:
mov ecx,[i]
mov eax,[sum]
loop_start:
cmp ecx,[limit]
jg end_loop
add eax,ecx
inc ecx
jmp loop_start

end_loop:
mov [sum],eax
mov eax,1
mov ebx,0
int 0x80
```

### ¿Cómo están implementadas las variables i y sum?

En ensamblador, las variables son simplemente espacios de memoria reservados con un tamaño específico.
En el programa:

sum dd 0
i dd 1

dd significa “define doubleword” (4 bytes en x86).
sum ocupa 4 bytes en memoria para almacenar el entero de la suma.
i ocupa 4 bytes en memoria para almacenar el contador del bucle.

### ¿En qué direcciones de memoria están estas variables?

Las variables están en la sección .data, que el sistema operativo ubica en la memoria de datos del programa.
La dirección exacta depende de dónde cargue el programa el sistema operativo, así que no es fija a menos que uses un depurador para verlo (por ejemplo, con gdb o objdump -t).

### ¿Cómo está implementado el ciclo while?

while(i <= 100) está implementado con etiquetas y saltos condicionales:

loop_start:
cmp ecx,[limit]  ; compara i con 100
jg end_loop      ; si i > 100, salir
add eax,ecx      ; sum += i
inc ecx          ; i++
jmp loop_start   ; repetir

###  ¿Cómo se implementa la variable i?

i está reservada en memoria (i dd 1).

En el bucle, su valor se copia a un registro (ecx) para trabajar más rápido.

inc ecx incrementa el contador.

Al final no es necesario escribirlo de nuevo en memoria porque solo usamos el valor en el registro para la comparación y la suma.

### ¿En qué parte de la memoria se almacena la variable i?

Está en la sección .data del programa.

Esa sección normalmente reside en el segmento de datos de la memoria de un proceso.

Es memoria estática, no se libera hasta que el programa termina.

### Después de todo lo que has hecho, ¿Qué es entonces una variable?

Una variable es como un nombre que se le asigna a una poisicion de la memoria donde se guarda un valor 

### ¿Qué es la dirección de una variable?

Es la posicion de la memoria donde empieza una variable 

###  ¿Qué es el contenido de una variable?

Es el valor almacenado en la direccion de la memoria de la variable

# Actividad 2 
´´´
int sum = 0;

for(int i = 1; i <= 100; i++) 
{
    sum += i;
}

´´´

# Actividad 3

´´´
@1
D=A
@0
M=D
@1
M=0
(LOOP)
@0
D=M
@101
D=D-A
@END
D;JGE
@0
D=M
@1
M=D+M
@0
M=M+1
@LOOP
0;JMP
(END)
@END
0;JMP

´´´

# Actvidad 4

***como se declara un puntero en c++*** 
int *punt;

***Como se define (o inicializa) un puntero en C++?***
punt  = &var; 

***¿Cómo se almacena en C++ la dirección de memoria de una variable?***
punt = &var; 

***¿Cómo se escribe el contenido de la variable a la que apunta un puntero?***
*punt = 20; 

# Actividad 5
´´´
@10
D=A
@0
M=D
@0
D=A
@1
M=D
@1
A=M
M=20

´´´

# Actvidad 6/7

´´´

@10
D=A
@0
M=D       
@5
D=A
@1
M=D       
@0
D=A
@2
M=D      
@2
A=M
D=M      
@1
M=D       

´´´

# Actividad 8
- ¿Qué hace esto `int *pvar;`?
Declara el puntero 
- ¿Qué hace esto `pvar = var;`?
Esta mal escrito, pero si estuviera correcto declararia la direccion de la variable
- ¿Qué hace esto `var2 = *pvar`?
Lee el valor de la varible y lo declara en var2
- ¿Qué hace esto `pvar = &var3`?
Guarda lo que haya en el puntero en la variable 



