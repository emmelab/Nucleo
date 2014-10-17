class Atr_Velocidad extends Atributo {
  static String key = "Velocidad";
  String getKey() {
    return key;
  }
  Atributo soloPonerNewX() {
    return new Atr_Velocidad();
  }
  Atributo[] soloPonerNewArray(int tam) {
    return new Atr_Velocidad[tam];
  }
  //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  float direccion,magnitud;
  
  Atributo[] iniciar(Sistema s, Atributo[] nuevas) {
    for (Atr_Velocidad p : (Atr_Velocidad[])nuevas) {
      p.direccion = s.p5.random(s.p5.TWO_PI);
      p.magnitud = s.p5.random(.05f,1);
    }
    return nuevas;
  }
  
}
