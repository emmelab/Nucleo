void dibujarDebugNivel (UsuarioNivel nivel, int tam) {
  fill(#4D5CF0,150);
  //stroke(#2731A0);
  noStroke();
  //hint(DISABLE_DEPTH_MASK);
  
  pushMatrix();
  translate(nivel.centroMasa.x,nivel.piso.y,nivel.centroMasa.z);
  rect(-tam/16, nivel.centroMasa.y - nivel.piso.y, tam/8, - nivel.centroMasa.y + nivel.piso.y);
  rotateX(-HALF_PI);
  fill(#4D5CF0);
  ellipse(0,0,tam*2,tam*2);
  translate(0,0,+nivel.umbralBajo -nivel.piso.y);
  fill(nivel.bajoBruto? 255:0 , nivel.bajo? 255:0, 255);
  box(tam,tam,tam/10);//ellipse(0,0,tam,tam);
  translate(0,0,+nivel.umbralAlto -nivel.umbralBajo);
  fill(nivel.bajoBruto || nivel.medioBruto ? 255:0 , nivel.bajo || nivel.medio ? 255:0, 255);
  box(tam,tam,tam/10);//ellipse(0,0,tam,tam);
  popMatrix();
  
  //hint(ENABLE_DEPTH_MASK);
}
