class Velocidad extends Atributo {
  static String key = "Velocidad";
  String getKey() {
    return key;
  }
  Atributo soloPonerNewX() {
    return new Velocidad();
  }
  Atributo[] soloPonerNewArray(int tam) {
    return new Velocidad[tam];
  }
  //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  float direccion,magnitud;
  
  Atributo[] iniciar(Sistema s, Atributo[] nuevas) {
    for (Velocidad p : (Velocidad[])nuevas) {
      p.direccion = s.p5.random(s.p5.TWO_PI);
      p.magnitud = s.p5.random(.05f,1);
    }
    return nuevas;
  }
  
}
