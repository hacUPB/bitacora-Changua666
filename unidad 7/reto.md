# Reto 
## Explicacion del proyecto 
El proyecto es un cubo que al moverle el mouse encima, cambia de color y se deforma. 

El **Vertex Shader** se encarga de la geometría y la deformación del cubo. Su papel es recibir la posición original de cada vértice y, basándose en entradas externas (llamadas uniforms) como la posición del mouse o el tiempo, calcular una nueva posición para ese vértice en el espacio 3D. En este ejemplo interactivo, el código C++ en OpenFrameworks pasa la ubicación del mouse al shader, y el Vertex Shader utiliza esta información para desplazar o modificar los vértices de el cubo. El resultado de este paso es el movimiento o la forma que vemos en la pantalla.       

El **Fragment Shader**  se ocupa del color y el aspecto visual final de la superficie del objeto. Se ejecuta para cada píxel potencial del objeto (fragmento) después de que la geometría ha sido procesada por el Vertex Shader. Su función es determinar el color final de ese píxel. Aunque también podría usar la posición del mouse u otras variables para efectos de color (como cambiar el tono o aplicar un brillo), su tarea principal es aplicar texturas y sombreado para que el objeto se vea correctamente. Es lo que le da el look and feel al objeto, independientemente de cómo haya sido deformado.

## RAE1
Yo la aplicacion la construi cogiendo un ejemplo y modificando su codigo, ya que hacerlo desde 0 no me funciono y me quedo mas facil hacer ese proceso. 
La aplicacion crea un cubo tridimensional que cambia su aspecto segun la posicion del mouse, en el setup se carga el shader y se define el tamaño del cubo. En draw, el programa activa el shader y le envia informacion como la posicion del mouse, y un color que se mezcla entre rojo y verde a medida que movemos el mouse horizontalmente. 

# Codigos 
main.cpp
```
#include "ofMain.h"
#include "ofApp.h"

//========================================================================
int main( ){

#ifdef OF_TARGET_OPENGLES
	ofGLESWindowSettings settings;
	settings.glesVersion=2;
#else
	ofGLWindowSettings settings;
	settings.setGLVersion(3,2);
#endif

	auto window = ofCreateWindow(settings);

	ofRunApp(window, std::make_shared<ofApp>());
	ofRunMainLoop();
}
```

ofApp.cpp
```
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
	if(ofIsGLProgrammableRenderer()){
		shader.load("shadersGL3/shader");
	}else{
		shader.load("shadersGL2/shader");
	}

box.set(300); // tamaño de los lados
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
	
	shader.begin();
	

	float cx = ofGetWidth() / 2.0;
	float cy = ofGetHeight() / 2.0;
	
	
	float mx = mouseX - cx;
	float my = mouseY - cy;
	
	
	shader.setUniform1f("mouseRange", 150);
	
	
	shader.setUniform2f("mousePos", mx, my);
	
	
	float percentX = mouseX / (float)ofGetWidth();
	percentX = ofClamp(percentX, 0, 1);
	ofFloatColor colorLeft = ofColor::indianRed;
	ofFloatColor colorRight = ofColor::forestGreen;
	ofFloatColor colorMix = colorLeft.getLerped(colorRight, percentX);
	
	
	float mouseColor[4] = {colorMix.r, colorMix.g, colorMix.b, colorMix.a};
	
	
	shader.setUniform4fv("mouseColor", mouseColor);
	
	ofTranslate(cx, cy);

	box.drawWireframe();

	shader.end();
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){
	
}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y){
	
}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){ 

}
```

ofApp.h 
```
#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp{
	public:
		
	void setup();
	void update();
	void draw();
	
	void keyPressed(int key);
	void keyReleased(int key);
	void mouseMoved(int x, int y);
	void mouseDragged(int x, int y, int button);
	void mousePressed(int x, int y, int button);
	void mouseReleased(int x, int y, int button);
	void windowResized(int w, int h);
	void dragEvent(ofDragInfo dragInfo);
	void gotMessage(ofMessage msg);

	ofShader shader;
	ofBoxPrimitive box;
};
```
# Video 
[video](https://youtu.be/Veo2vkQG0C8)

## RAE2

# Como probe la aplicacion ofApp.cpp
Esa la probe de una manera muy sencilla, hice una checklist de todo lo que se supone que deberia aparecer al abrir la aplicacion y pues lo chequee. La chechklist es esta: 
- La aplicacion deberia mostrar un fondo gris
- Debe aparecer un cubo wireframe
- Si se mueve el mouse, se debe cambiar la forma del cubo y cambiar el color
y como se evidencia en el video, todo esta bien

# Como probe el vertex shader 
Ese tambien fue muy sencillo, ya que si el funcionamiento del mouse y del cubo funciona, pues significa que esta bien 

# Como probe el fragment shader 
Lo mismo, si el color cambia significa que funciona, aunque con ese cambie los colores nada mas por curiosidad y supongo que eso tambien funciona como prueba 


