class Bolita {
  float x, y, radio;
  Boolean vivo = true;

  Bolita(float x, float y, float radio) {
    this.x = x;
    this.y = y;
    this.radio = radio;
  }

  void actualizar() {
    this.y--;
    if (this.y <= height) {
      vivo=false;
    }
  }

  void dibujar() {
    ellipse(x, y, radio, radio);
  }
}
