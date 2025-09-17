# Sesion 1
### ¿Qué representa la clase Particle?

Particle representa las posiciones en (x,y) de la particula  

### ¿Cómo interactúan sus atributos y métodos?

**Atributos** 
- X y Y guardan el estado del objeto, su posicion pues. 
- Cada objeto particle tiene sus propiso valores de posicion 

**Metodos (move)** 
- Actua sobre los atributos del objeto al que pertenece 

## Explorando la memoria 
### ¿Los atributos están almacenados de forma contigua?
Si estan almacenados de forma contigua porque se crean cada 4 bytes exactamente

### ¿Qué indica el tamaño del objeto sobre su estructura interna?
Nos indica cuantos bytes ocupa cada instancia de esta clase y revela como esta organizada

# Analisis de diferencias
### ¿Cómo afectan los datos estáticos al tamaño de la instancia?

Los datos estáticos no afectan el tamaño de una instancia porque no se almacenan dentro de cada objeto, sino en una única ubicación de memoria compartida por toda la clase. Esto significa que sizeof solo cuenta los atributos no estáticos, mientras que los estáticos existen una sola vez sin importar cuántas instancias se creen.

### ¿Qué diferencias hay entre datos estáticos y dinámicos en términos de memoria?
Los datos estáticos se almacenan en una zona fija de memoria y existen durante toda la ejecución del programa, compartidos por todas las instancias de la clase; en cambio, los datos dinámicos se reservan en el heap en tiempo de ejecución, pueden cambiar de dirección cada vez que se crean y requieren liberarse manualmente para no producir fugas de memoria.

### Prompt para ChatGPT: explícame cómo el uso de variables estáticas y dinámicas en una clase afecta el tamaño de sus instancias. ¿Las variables estáticas ocupan espacio en cada objeto?
Esto me respondio Chatgpt "Las variables estáticas de una clase no ocupan espacio dentro de cada objeto: se almacenan una sola vez, en una zona de memoria global, y todas las instancias comparten esa misma dirección.
En cambio, los miembros no estáticos (sean simples o punteros) sí forman parte del tamaño de cada instancia: sizeof los cuenta, porque cada objeto necesita su propia copia.
Si un miembro es un puntero que apunta a memoria dinámica, el puntero mismo (la dirección) sí ocupa espacio dentro de cada objeto, pero la memoria reservada con new o malloc vive fuera, en el heap, y no incrementa el valor que devuelve sizeof."

## Reflexion 
### ¿Qué es un objeto desde la perspectiva de la memoria?
un objeto visto desde la memoria es un bloque de direcciones donde el programa guarda todos los datos no estaticos que definen a esa instancia: los valores de los atributos y cualquier padding que el compilador agregue. 

### ¿Cómo influyen los atributos y métodos en el tamaño y estructura del objeto?
