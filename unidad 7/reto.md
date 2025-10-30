# Reto 
## Explicacion del proyecto 
El proyecto es una esfera con una imagen de ronaldinho que al moverle el mouse encima, se deforma. El proyecto tambien tiene una easycam que hace que sea mas facil ver toda la esfera

![fulbito](https://github.com/user-attachments/assets/9cf98339-ed02-4a13-84ac-17ad1bcca700)


## RAE1
Yo la aplicacion la construi cogiendo un ejemplo y modificando su codigo, ya que hacerlo desde 0 no me funciono y me quedo mas facil hacer ese proceso. 
La aplicacion crea una esfera tridimensional con una textura simple que cambia su aspecto segun la posicion del mouse y se puede ver libremente con una camara, en el setup se carga el shader, se define el radio de la esfera y se carga la textura. 

```
void ofApp::setup() {
	if (ofIsGLProgrammableRenderer()) {
		shader.load("shadersGL3/shader");
	} else {
		shader.load("shadersGL2/shader");
	}

	ofDisableArbTex();
	texture.load("fulbito.jpg"); 

	sphere.set(200, 32); 
}
```

En draw, el programa activa el shader, la textura y la camara, y aparte le envia informacion como la posicion del mouse, la textura, etc.

```
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

	shader.setUniformTexture("tex0", texture.getTexture(), 0);

	ofBackground(0);

	
	cam.begin();

	ofTranslate(0, 0, 0); 
	sphere.draw();

	cam.end();

	shader.end();
}
```


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
void ofApp::setup() {
	if (ofIsGLProgrammableRenderer()) {
		shader.load("shadersGL3/shader");
	} else {
		shader.load("shadersGL2/shader");
	}

	ofDisableArbTex();
	texture.load("fulbito.jpg"); 

	sphere.set(200, 32); 
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

	shader.setUniformTexture("tex0", texture.getTexture(), 0);

	ofBackground(0);

	
	cam.begin();

	ofTranslate(0, 0, 0); 
	sphere.draw();

	cam.end();

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
	ofSpherePrimitive sphere;
	ofImage texture;
	ofEasyCam cam;



};

```
# Video 
[FULBITO](https://youtu.be/kRpCNBqvJ_Q)

## RAE2

# Como probe la aplicacion ofApp.cpp
Para probar la aplicacion lo que hice primero fue revisar si todos los codigos estaban bien escritos (especialmente el de los shaders), ya despues me asegure de que compilara sin errores (que se abran los shaders, que no hayan errores y si habian pues solucionarlos), ya despues de eso ejecute la aplicacion y revise si se muestra lo que queria (en este caso una esfera con la foto de ronaldinho y una camara libre).

<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/32945ba1-480f-441b-b478-fe4dcece7551" />

Despues probe que todos los inputs funcionaran (que se pueda deformar la bola, que el mouse funcionara, que se pueda mover la camara libremente).

<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/0d34f1d5-2e66-4171-87ed-6c3abf70ebaa" />


# Como probe el vertex shader 
Lo primero que hice fue revisar el codigo del setup para ver si el shader se estaba cargando en la linea 
```
shader.load("shadersGL3/shader");
```
y obviamente revise si los shaders estaban en la direccion correcta.

Despues revise si el shader se activa antes de dibujar 
```
shader.begin();
sphere.draw(); // o box.draw();
shader.end();
```
ya despues de verificar eso, si me puse a revisar si la bola se deformaba cuando pasaba el mouse por encima de esta, para ver si el vertex shader estaba activo

# Como probe el fragment shader 
Lo primero que hice fue ejecutar la aplicacion y revisar si la textura se aplica bien (no hay deformaciones, si aparece, etc). 
Despues de eso, le cambie la textura a otra imagen simplemente para probar y ya 

<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/f728903e-19b1-4192-98f1-40b32eb9ba26" />

En el video adjunto de youtube se puede ver como pruebo todas la funcionalidades de la aplicacion



