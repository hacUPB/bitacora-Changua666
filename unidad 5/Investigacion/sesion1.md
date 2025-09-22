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
El tamaño de un objeto está determinado por sus atributos no estáticos, ya que cada instancia debe guardar su propia copia de esos datos; el compilador además puede añadir relleno para mantener la alineación. Los métodos no influyen en el tamaño, porque su código se guarda una sola vez en la sección de instrucciones del programa y todas las instancias lo comparten; solo en casos de herencia con funciones virtuales se añade un puntero oculto (vptr) que sí ocupa espacio dentro del objeto.

### Conclusion 
En conclusión, el tamaño de un objeto depende únicamente de sus atributos no estáticos y del relleno que el compilador agregue para la alineación, mientras que los métodos no afectan ese tamaño y los miembros estáticos se almacenan aparte, compartidos por todas las instancias. Esto implica que, al diseñar clases, conviene distinguir entre lo que cada objeto debe llevar consigo y lo que puede compartirse globalmente, así como tener presente que la memoria dinámica no se refleja en sizeof sino que debe administrarse explícitamente. Comprender estas diferencias permite crear clases más eficientes y con un uso de memoria más predecible.

# Sesion 2
### Exploración de métodos virtuales
Esto me aparece en la memoria al ejecutar el codigo dado 
<img width="1920" height="1080" alt="Captura de pantalla 2025-09-22 130039" src="https://github.com/user-attachments/assets/d788588d-9c11-4ba7-933e-f3a36c86e5f7" />
esto me aparece en el desensamblado 
<img width="1920" height="1080" alt="Captura de pantalla 2025-09-22 130158" src="https://github.com/user-attachments/assets/7f6b0b9a-88d5-4e5a-9b13-5750ca7a23e1" />

### ¿Cómo afecta la presencia de métodos virtuales al tamaño del objeto?
Cuando una clase en C++ no tiene metodos virtuales, el tamaño de estos solo se ve afectado por los atributos que este mismo contiene, sin embargo, al declarar al menos un metodo virtual, el compilador agrega a cada objeto un puntero, que apunta a la vtable de la clase. Ese puntero ocupa el tamaño de un puntero del sistema y se convierte en la primera posicion de memoria del objeto. 

### ¿Qué papel juegan las vtables en el polimorfismo?
Las vtables cumplen el papel de enlazar en tiempo de ejecución las llamadas a métodos virtuales con la implementación correcta. Cada clase con métodos virtuales posee una vtable distinta, y cada objeto guarda un puntero oculto (vptr) que indica a qué tabla debe acudir. Así, cuando se invoca un método virtual a través de un puntero o referencia a la clase base, el programa consulta la vtable señalada por el vptr y ejecuta la versión del método correspondiente a la clase real del objeto, garantizando el polimorfismo dinámico.

