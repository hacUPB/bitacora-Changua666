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

## Uso de punteros y referencias 
### Analizar el impacto en memoria
Cuando se agrega un puntero a una función como miembro de una clase, cada instancia reserva espacio para almacenar ese puntero, por lo que el tamaño del objeto aumenta en la cantidad de bytes que ocupa un puntero en la arquitectura usada (4 bytes en 32 bits o 8 bytes en 64 bits). El valor guardado en ese campo es simplemente la dirección de la función, que vive en el segmento de código del programa; el puntero mismo reside dentro del bloque de memoria del objeto, ya sea en el stack o en el heap según cómo lo hayas creado. A diferencia de los métodos virtuales, que usan un vptr para acceder a una vtable compartida, este puntero apunta de forma directa a una función específica, sin necesidad de una tabla intermedia.

### Reflexión Guiada
**- ¿Cuál es la relación entre los punteros a métodos y la vtable?**
**- ¿Cómo afectan estos mecanismos al rendimiento del programa?**
Los punteros a métodos y las vtables comparten la idea de almacenar direcciones de funciones para permitir llamadas indirectas, pero mientras los primeros son gestionados explícitamente por el programador y apuntan de manera directa a una función concreta, las vtables son creadas automáticamente por el compilador para soportar el polimorfismo dinámico y permiten elegir en tiempo de ejecución la versión correcta de un método virtual. En cuanto al rendimiento, ambos mecanismos introducen un leve costo frente a una llamada directa, ya que requieren al menos una indirection en memoria, pero en la práctica esa diferencia suele ser mínima y solo se vuelve relevante en contextos críticos de desempeño como bucles muy intensivos en cálculos.

### Reflexion Individual 
**¿Dónde residen los datos y métodos de una clase en la memoria?** 
Los atributos residen en la memoria reservada para cada objeto, mientras que los metodos y los vtables se almacenan una sola vez en en el codigo del programa. 

**¿Cómo interactúan las diferentes partes en tiempo de ejecución?**
En tiempo de ejecución, los atributos de cada objeto se acceden directamente desde su bloque de memoria, mientras que los métodos residen en el segmento de código y se comparten entre instancias. Las llamadas a funciones normales se hacen con saltos directos, pero las virtuales requieren que el programa consulte el vptr del objeto y de allí su vtable para obtener la dirección correcta, lo que habilita el polimorfismo dinámico. Si se usan punteros a funciones, cada objeto guarda explícitamente la dirección de la función y el salto se hace en un solo paso, sin tabla intermedia.

**Conclusión: cómo esta comprensión afecta el diseño de sistemas.** 
Entender cómo se organizan los datos, métodos y vtables en memoria ayuda a decidir mejor en el diseño de sistemas: usar polimorfismo virtual cuando aporta flexibilidad, evitarlo en rutas críticas si el costo extra importa, y tener en cuenta el tamaño real de los objetos para estructuras grandes. En síntesis, permite equilibrar eficiencia y extensibilidad al construir aplicaciones en C++.

# Sesion 3 
### Reflexion 
**¿Qué es el encapsulamiento y cuál es su propósito en la programación orientada a objetos?**
El encapsulamiento es un principio de la programacion orientada a objetos que consiste en agrupar en una misma clase los datos y los metodos que operan en este, y al mismo tiempo restringir el acceso directo a ciertos detalles internos.
Su proposito es proteger los datos, y hacer que el codigo sea mas seguro, claro y facil de entender. 

**¿Por qué es importante proteger los datos de una clase y restringir el acceso desde fuera de la misma?** 
Es importante proteger los datos de una clase porque si cualquier parte del programa se puede modificar se perderia el control de la consistencia del programa, y podrian aparecer errores mas dificiles de detectar. Al restringir el acceso desde fuera de la clase, solo se permite interactuar con los atributos a través de métodos públicos controlados, lo que garantiza que los valores siempre se mantengan en un estado válido y bajo ciertas reglas. 

**¿Qué significa reinterpret_cast y cómo afecta la seguridad del programa?** 
reinterpret_cast permite reinterpretar la memoria de un objeto como otro tipo, pero es muy peligroso porque el compilador deja de protegerte. Su uso puede vulnerar la seguridad del programa, romper la portabilidad y generar errores difíciles de depurar, por lo que debe usarse solo en casos muy específicos y justificados (como trabajar con APIs de bajo nivel o hardware).

**¿Por qué crees que se pudo acceder a los miembros privados de MyClass en este experimento, a pesar de que el compilador normalmente lo impediría?** 
Se pudo acceder a los miembros privados de la clase porque en C++ la encapsulación no impone barreras físicas en memoria, sino que funciona como una regla de compilación. El compilador detecta y prohíbe en el código fuente el acceso a miembros privados desde fuera de la clase, pero en el programa ya compilado esos atributos siguen estando en la memoria del objeto, ubicados en un offset definido. Al usar conversiones como reinterpret_cast o manipulación de punteros, es posible saltarse la verificación del compilador y leer o modificar directamente esos bytes, lo que demuestra que la privacidad en C++ depende del compilador y no de mecanismos de protección en tiempo de ejecución.
