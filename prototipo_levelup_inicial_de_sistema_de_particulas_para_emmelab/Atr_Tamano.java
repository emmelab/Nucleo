class Atr_Tamano extends Atributo {
  static String key = "Tamano";
  String getKey() {
    return key;
  }
  Atributo soloPonerNewX() {
    return new Atr_Tamano();
  }
  Atributo[] soloPonerNewArray(int tam) {
    return new Atr_Tamano[tam];
  }
  //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  float ancho,alto,diametro;
  
  Atributo[] iniciar(Sistema s, Atributo[] nuevas) {
    for (Atr_Tamano p : (Atr_Tamano[])nuevas) {
      p.ancho = p.alto = p.diametro = s.p5.random(5,10)+s.p5.random(5,10);
    }
    return nuevas;
  }
}
