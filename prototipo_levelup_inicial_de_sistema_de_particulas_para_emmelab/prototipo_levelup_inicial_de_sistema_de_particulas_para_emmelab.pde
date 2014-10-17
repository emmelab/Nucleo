Sistema sistema;

void setup() {
  size(800,600);
  sistema = new Sistema(this,100);
  
}

void draw() {
  background(0);
  
  moverParticulas(sistema);
  dibujarParticulas(sistema);
}
