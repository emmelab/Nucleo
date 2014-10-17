class Atr_Posicion extends Atributo {
  static String key = "Posicion";
  String getKey() {
    return key;
  }
  Atributo soloPonerNewX() {
    return new Atr_Posicion();
  }
  Atributo[] soloPonerNewArray(int tam) {
    return new Atr_Posicion[tam];
  }
  //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  float x,y;
  
  Atributo[] iniciar(Sistema s, Atributo[] nuevas) {
    int grilla = s.p5.ceil(s.p5.sqrt(nuevas.length));
    int grillaX = grilla;
    int grillaY = grilla;
    for (int i=0; i<nuevas.length; i++) {
      Atr_Posicion p = (Atr_Posicion)nuevas[i];
      p.x = (i%grillaX) * (s.p5.width / grillaX);
      p.y = (i/grillaY) * (s.p5.height / grillaY);
    }
    return nuevas;
  }
  /*Atributo[] iniciar(Sistema s, Atributo[] nuevas) {
    for (Posicion p : (Posicion[])nuevas) {
      p.x = s.p5.random(s.p5.width);
      p.y = s.p5.random(s.p5.height);
    }
    return nuevas;
  }*/
  
}
