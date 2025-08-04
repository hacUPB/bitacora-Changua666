1. Realizar el dibujo en el editor 
2. copiar el codigo que nos genera el editor para realizar el dibujo en nand2tetris
3. debemos buscar la linea final donde se deja de dibujar 
4. Realizamos un loop que haga que se eliminen los datos de la variable @SCREEN (o sea que todo quede en ceros)
5. el codigo genera un ciclo continuo que lee constantemente el registro (@KBD)
6. Si el valor es d (100 decimal) se dibuja la imagen
7. si el valor es 0 (ninguna tecla) se borra la imagen 