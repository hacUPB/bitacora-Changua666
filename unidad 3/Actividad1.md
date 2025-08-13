# 1. ¿Cuál es el resultado que se obtiene al ejecutar este programa?
 Se puede observar una ventana negra con un punto blanco que sigue al cursor cuando este se mueve 

# Actividad 2

## ¿Qué fue lo que incluimos en el archivo .h?
incluimos un codigo para el funcionamiento del mouse 

## ¿Cómo funciona la aplicación?
Cuando se mueve el mouse aparecen varios circulos blancos que siguen al cursor, y cuando se da click estos cambian de color 

## ¿Qué hace la función mouseMoved?
Guarda la posicion de las particulas y hace que no aparezcan mas de 100 

## ¿Qué hace la función mousePressed?
Recibe la posicion del cursor y hace que cuando se haga click se cambie el color de el circulo 

## ¿Qué hace la función setup?
Define el valor de el Background (en este caso, negro) y el color inicial de la bola 

## ¿Qué hace la función update?
Actualiza el programa en base a los datos que se reciben

## ¿Qué hace la función draw?
Dibuja un circulo de radio 50 en cada posicion usando el color que le asignamos 

# Actividad 3
## ¿Qué hace cada función? ¿Qué hace cada línea de código?
Lo que hace cada funcion ya lo explique en la actividad anterior

le modifique al codigo la funcion setup y le puse esta linea que modifica el color de la figura, en este caso al color rosado

`particleColor = ofColor::pink;`

y cambie la funcion draw y le puse esta linea que cambia la forma de la figura, en este caso la convierte en un rectangulo

```
void ofApp::draw() {
    for (auto & pos : particles) {
        ofSetColor(particleColor);
        ofDrawRectangle(pos, 80, 80);
    }
}

<img width="1036" height="781" alt="Actividad3" src="https://github.com/user-attachments/assets/797e93cd-1823-4262-a2f1-ef179b87df80" />


