# Como funciona la memoria en el programa ?
En esta aplicación, la memoria se organiza de la siguiente manera:

Heap:
Las variables miembro de la clase ofApp se almacenan en el heap, ya que la instancia de la aplicación se crea dinámicamente. Aquí están la cámara (ofEasyCam), los parámetros numéricos y el vector spherePositions. Este último gestiona dinámicamente las posiciones de las esferas, realocando memoria según sea necesario.

Stack (pila):
Las variables locales de cada función, como z, matrices (glm::mat4) o los rayos de selección, se almacenan en la pila y se liberan automáticamente al salir del método.

Gestión dinámica (STL):
spherePositions es clave: utiliza memoria dinámica para crecer o reducir según la cantidad de esferas generadas en setup() y update().

Datos estáticos:
No hay variables globales ni estáticas permanentes, lo que mantiene el programa ordenado y evita consumo fijo de memoria.

En conclusión, los datos clave (cámara, parámetros y esferas) residen en el heap, mientras que las variables temporales viven en la pila, garantizando un uso eficiente de la memoria.

# Link del video 
https://youtu.be/2CLP_iq1Qrk
