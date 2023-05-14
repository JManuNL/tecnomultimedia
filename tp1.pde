void setup() {
 size(640, 480);
  textSize(32);
  background(0);
  fill(0, 255, 0);
  
  textoPrimeraPantalla = "Hace 35 años \n el transbordador Challenger se desintegró \n 73 segundos después de su despegue.";
  textoSegundaPantalla = "En la noche del 14 de abril de 1912, \n el Titanic chocó contra un iceberg y se hundió en medio del océano.\n Desde aquel día, se escribieron cientos de libros, \ndocumentales y películas basadas en los testimonios de los sobrevivientes \n y en las investigaciones que siguieron al accidente.";
  textoTerceraPantalla = "Aquel 17 de diciembre de 1903, \n el Flyer I (35 kilos de peso, \n un motor de 12 caballos y Orville a bordo) \n fue lanzado con una catapulta y \n mantenido durante 12 segundos cubriendo 36 metros \n sobre la bahía de Kitty Hawk en Ohio, \n todo un éxito para la época.";
  challenger = loadImage("challenger.jpg");
  titanic = loadImage("titanic.jpg");
  avion = loadImage("avion.jpg");
  botonreinicio = loadImage("botonreinicio.jpg");
  botonreinicio.resize((int)botonWidth, (int)botonHeight);  
  
  tiempoInicial = millis();  
  tiempoInicioSegundaPantalla = millis();
}

void draw() {
  miVariable = frameCount;
  background(0, 200, 200);
  
  if (primeraPantalla) {
    mostrarPrimeraPantalla();
    moverTextoPrimeraPantalla();
  } else if (segundaPantalla) {
    mostrarSegundaPantalla();
    moverTextoSegundaPantalla();
  } else if (terceraPantalla) {
    mostrarTerceraPantalla();
    moverTextoTerceraPantalla();
  }
  
  if (primeraPantalla && millis() - tiempoInicial >= 12500) {
    primeraPantalla = false;  
    segundaPantalla = true;  
  } else if (segundaPantalla && millis() - tiempoInicioSegundaPantalla >= tiempoSegundaPantalla)  {
    segundaPantalla = false;  
    terceraPantalla = true;
  }
}

void mostrarPrimeraPantalla() {
  image(challenger, 0, 0, 640, 480);
  fill(0 , 0 , 255);
  textSize(25);
  textLeading(35);  
  float textoY = 380;  
  text(textoPrimeraPantalla, posicionTextoX, textoY);
}

void moverTextoPrimeraPantalla() {
  posicionTextoX++;
  if (posicionTextoX > width) {
    posicionTextoX = -int(textWidth(textoPrimeraPantalla));
  }
}

void mostrarSegundaPantalla() {
  image(titanic, 0, 0, 640, 480);
  textAlign(CENTER, CENTER);
  fill(0, 255, 0);
  textSize(19);
  text(textoSegundaPantalla, width/2, posicionTextoY);
  
}

void moverTextoSegundaPantalla() {
  if (millis() - tiempoInicioSegundaPantalla < tiempoSegundaPantalla) {
    
    float velocidad = (float)(height + textAscent()) / tiempoSegundaPantalla;
    
    posicionTextoY = (int)(velocidad * (millis() - tiempoInicioSegundaPantalla));
  } else {
    
    posicionTextoY = height - int(textAscent());
  }
  
}

void mostrarTerceraPantalla() {
  image(avion, 0, 0, 640, 480);
  fill(0, 0 , 0);
  textSize(20);
  textAlign(CENTER, CENTER);  
  text(textoTerceraPantalla, width/2, posicionTextoY);
  botonX = width - botonWidth - 20;  
  botonY = height - botonHeight - 20;  
  image(botonreinicio, botonX, botonY);
}

void moverTextoTerceraPantalla() {
 posicionTextoY --;
  if (posicionTextoY < -textAscent()) {
    posicionTextoY = height;
    }
}   
    void mousePressed() {
  if (terceraPantalla && mouseX >= botonX && mouseX <= botonX + botonWidth && mouseY >= botonY && mouseY <= botonY + botonHeight) {
    reiniciarPresentacion();
  }
}
void reiniciarPresentacion() {
  
  primeraPantalla = true;
  segundaPantalla = false;
  terceraPantalla = false;
  tiempoInicial = millis();
  tiempoInicioSegundaPantalla = millis();
  posicionTextoX = 0;
  posicionTextoY = height;
  
}

  
