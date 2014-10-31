class Atr_Fuerza extends Atributo{
  static String key = "Fuerza";
  String getKey() {
    return key;
  }
  Atributo soloPonerNewX() {
    return new Atr_Fuerza();
  }
  Atributo[] soloPonerNewArray(int tam) {
    return new Atr_Fuerza[tam];
  }
  //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  
  float direccion, magnitud;
  
  Atributo[] iniciar(Sistema s, Atributo[] nuevas) {
    for (Atr_Fuerza f : (Atr_Fuerza[])nuevas) {
        f.direccion = 0;
        f.magnitud = .0f;
    }
    return nuevas;
  }
  
}
