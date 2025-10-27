# Actividad 1 
### Que son los vertices ? 
En el contexto de los graficos 3D, un vertice representa un punto en el espacio tridimensional que define la forma de un objeto. Cada vertice tiene atributos asociados como: 
- Coordenadas 
- Color 
- Textura 

### Con que figura geometrica se dibuja en 3D ? 
Los triángulos son la unidad básica para representar superficies en un espacio tridimensional. Cada objeto 3D se descompone en una malla de triángulos que forman su geometría.

### Que es un shader ? 
Un shader es un programa que determina como se deben renderizar los objetos en una escena. Los shaders permiten controlar la apariencia de los graficos, manipulando cosas como la iluminacion, el color, la textura y otros efectos visuales. 

### ¿Cómo se le llaman a los grupos de píxeles de un mismo triángulo?
El grupo de pixeles de un mismo triangulo se denomina "fragmentos". 
Un fragmento es el resultado de la rasterizacion de un triangulo cuando se renderiza. Cada fragmento representa un pixel en la pantalla que corresponde a una parte del triangulo. 

### ¿Qué es un fragment shader? 
Un fragment shader es un tipo de programa que se encarga de determinar el color de los fragmentos generados durante el proceso de rasterizacion

### ¿Qué es un vertex shader?
Un vertex shader es un tipo de programa que se encarga de procesar los vertices de un modelo 3D antes de que se conviertan en fragmentos para el render. 

### ¿Al proceso de determinar qué pixels del display va a cubrir cada triángulo de una mesh se le llama?

A este proceso se le llama **Rasterizacion**. Esta es la etapa final de un renderizado donde las figuras geometricas se convierten en fragmentos.  
Durante la rasterizacion el sistema grafico evalua cada triangulo y determina que pixeles en la cuadricula de la pantalla estan dentro de los limites de este. 

### ¿Qué es el render pipeline?
El render pipeline es una serie de etapas que se siguen para convertir una escena en 3D en una imagen 2D que se pueda mostrar en una pantalla. Este proceso involucra varios componentes y tecnicas que trabajan juntas para poder lograr un render eficaz y de alta calidad.

### ¿Hay alguna diferencia entre aplicar un color a una superficie de una mesh o aplicar una textura?

Si hay varias diferencias entre aplicar un color a una superficie de una malla y aplicar una textura. 

**Aplicar color** 
Aplicar un color a una superficie implica asignar un valor de manera uniforme en toda esta, lo que significa que no hay variaciones basadas en la geometria o los detalles. 

El color es uniforme en toda la superficie, lo que significa que no hay variaciones basadas en la geometria o detalles de la superficie y tambien aplicar un color es un proceso menos "pesado" a comparacion de aplicar texturas, ya que no requiere de lectura de datos de textura. 

**Aplicacion de textura** 
Aplicar una textura implica mapear una imagen (o un conjunto de estas) sobre la superficie de la malla. Esta imagen puede contener detalles mas complejos como patrones, colores y variaciones que se aplican segun las coordenadas de estas texturas. 

### ¿Cuál es la diferencia entre una textura y un material?

La diferencia entre una textura y un material radica en su funcion y complejidad: Una textura es una imagen que se aplica sobre la superficie de un objeto para agregar detalles visuales, mientras que el material es una descripcion mas compleja que incluye propiedades fisicas y visuales de la superficie, como el color, reflectividad, y como interactua este con la luz. Ademas un material puede incorporar multiples texturas para lograr mejores efectos visuales. 

### ¿Qué transformaciones se requieren para mover un vértice del 3D world al View Screen?

Para mover un vértice del espacio 3D al View Screen, se requieren tres transformaciones clave: primero, la transformación de modelo que lleva los vértices del espacio local al espacio de mundo, aplicando operaciones como traslación, rotación y escalado; segundo, la transformación de vista, que posiciona y orienta la cámara en la escena, convirtiendo las coordenadas del espacio de mundo al espacio de vista; y finalmente, la transformación de proyección, que convierte las coordenadas 3D del espacio de vista en coordenadas 2D del espacio de clip, utilizando una matriz de proyección adecuada.

### ¿Al proceso de convertir los triángulos en fragmentos se le llama?

Al proceso de convertir los triángulos en fragmentos se le llama Rasterización. Durante la rasterización, los triángulos definidos en el espacio de clip se convierten en fragmentos (o píxeles) que representan la superficie visible en la pantalla. Este proceso implica determinar qué píxeles de la pantalla están dentro del área cubierta por el triángulo y calcular los atributos de color y textura correspondientes para cada fragmento antes de pasarlos al siguiente paso del pipeline de renderizado, que es la fase de fragment shading.

### Qué es el framebuffer?

El framebuffer es una región de memoria que almacena los datos de píxeles que se mostrarán en la pantalla, y es esencial en el proceso de renderizado gráfico. Contiene información sobre cada píxel, incluyendo su color (RGB y canal alfa para la transparencia), y su resolución coincide con la de la pantalla. Existen diferentes tipos de framebuffers, como el de color, profundidad y stencil, que permiten gestionar aspectos como la visibilidad y el enmascarado. Durante el renderizado, los fragmentos generados se escriben en el framebuffer, y al finalizar el proceso, su contenido se envía a la pantalla para ser visualizado por el usuario, convirtiéndolo en un componente crucial para la representación visual en gráficos por computadora.

### ¿Para qué se usa el Z-buffer o depth buffer en el render pipeline?

El Z-buffer o depth buffer se utiliza en el render pipeline para gestionar la visibilidad de los objetos en una escena 3D y resolver problemas de superposición. Su función principal es almacenar la información de profundidad de cada píxel renderizado, permitiendo determinar qué objetos son visibles y cuáles están ocultos detrás de otros. Cuando se procesa un nuevo fragmento, su valor de profundidad se compara con el almacenado en el Z-buffer; si el nuevo fragmento está más cerca de la cámara, se actualiza el framebuffer y el Z-buffer, asegurando así una correcta representación de la escena. Esto facilita el renderizado de escenas complejas y mejora la eficiencia al permitir que los objetos se dibujen en cualquier orden, ya que la visibilidad se resuelve durante la rasterización.

# Actividad 2 
Al modificar el metodo draw me sale esto 
<img width="1050" height="815" alt="image" src="https://github.com/user-attachments/assets/76106636-3365-44a1-9aee-9a15383d8a26" />
La modificacion que le hice fue poner el coso de color de negro (0) 

y al ejecutar el codigo original me aparece esto 
<img width="1036" height="809" alt="image" src="https://github.com/user-attachments/assets/7f817c2d-1ee6-47c3-b4b5-f8781497af3e" />

### ¿Cómo funciona?
En openframeworks se carga un shader. En el setup se cargan los archivos del shader y en el draw se "activan" estos con shader begin y se dibuja un rectangulo que cubre toda la ventana. 
Cada vértice del rectángulo pasa por el vertex shader, que calcula su posición en pantalla usando una matriz de transformación (modelViewProjectionMatrix). Luego, cada píxel del rectángulo pasa por el fragment shader, que calcula su color según su posición (gl_FragCoord): el valor rojo depende de la coordenada X y el verde de la Y, mientras que el azul es constante. Así, al dividir las coordenadas por el tamaño de la ventana, se obtiene un gradiente de colores que cambia del azul al blanco según la posición de cada píxel en la pantalla.

### ¿Qué resultados obtuviste?
Los resultados ya los mostre al principio de la actividad 

### ¿Estás usando un vertex shader?
Si, en el ejemplo se usa un vertex shader pero de manera muy sencilla, este solo se encarga de posicionar los vertices del triangulo en la pantalla. 

### ¿Estás usando un fragment shader?
Si, tambien se usa un fragment shader y este ya si se encarga de calcular los colores y generar esa gradiente. 

### Analiza el código de los shaders. ¿Qué hace cada uno?

# Actividad 3 


