import processing.core.PVector;

class Atr_Rastro extends Atributo {
  static String key = "Rastro";
  String getKey() {
    return key;
  }
  Atributo soloPonerNewX() {
    return new Atr_Rastro();
  }
  Atributo[] soloPonerNewArray(int tam) {
    return new Atr_Rastro[tam];
  }


  //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  PVector [] hijos;
  Atributo[] iniciar(Sistema s, Atributo[] nuevas) {
    hijos = new PVector[10];
    Atr_Posicion[] posiciones = (Atr_Posicion[])s.getAtributos(Atr_Posicion.key);
    if (posiciones == null) posiciones = (Atr_Posicion[])s.incluir(new Atr_Posicion());

    for (int i=0; i<nuevas.length; i++) {
      Atr_Rastro r = (Atr_Rastro)nuevas[i];
      r.hijos[0] = new PVector(posiciones[i].x, posiciones[i].y);
      r.hijos[1] = r.hijos[0];
      r.hijos[2] = r.hijos[1];
      r.hijos[3] = r.hijos[2];
      r.hijos[4] = r.hijos[3];
      r.hijos[5] = r.hijos[4];
      r.hijos[6] = r.hijos[5];
      r.hijos[7] = r.hijos[6];
      r.hijos[8] = r.hijos[7];
      r.hijos[9] = r.hijos[8];
    }
    return nuevas;
  }
  
}

