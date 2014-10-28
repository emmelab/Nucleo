import processing.core.PVector;
import processing.core.PApplet;

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

  /* PVector [] hijos = new PVector[10];
   
   Atributo[] iniciar(Sistema s, Atributo[] nuevas) {
   
   Atr_Posicion[] posiciones = (Atr_Posicion[])s.getAtributos(Atr_Posicion.key);
   if (posiciones == null) posiciones = (Atr_Posicion[])s.incluir(new Atr_Posicion());
   
   for (int i=0; i<nuevas.length; i++) {
   Atr_Rastro r = (Atr_Rastro)nuevas[i];
   r.hijos[0] = new PVector(posiciones[i].x, posiciones[i].y);
   for (int j=1; j<10; j++) {
   r.hijos[j] = r.hijos[j-1];
   }
   }
   return nuevas;
   }*/

  float [] hijosx = new float[10];
  float [] hijosy = new float[10];

  Atributo[] iniciar(Sistema s, Atributo[] nuevas) {
    Atr_Posicion[] posiciones = (Atr_Posicion[])s.getAtributos(Atr_Posicion.key);
    if (posiciones == null) posiciones = (Atr_Posicion[])s.incluir(new Atr_Posicion());

    for (int i=0; i<nuevas.length; i++) {
      Atr_Rastro r = (Atr_Rastro)nuevas[i];
      s.p5.println(posiciones[0].x);
      r.hijosx[0] = posiciones[i].x;
      r.hijosy[0] = posiciones[i].y;

      for (int j=1; j<10; j++) {
        r.hijosx[j] = r.hijosx[j-1];
        r.hijosy[j] = r.hijosy[j-1];
      }
    }
    return nuevas;
  }
}

