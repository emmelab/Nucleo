Mod_Pozo mPozo = new Mod_Pozo(width/2, height/2, 400);

class Mod_Pozo extends Modificador{
  Atr_Color[] colores;
  Atr_Posicion[] posiciones;
  
  PVector pozo;
  float radio;
  
  Mod_Pozo(float x, float y, float _radio){
    pozo = new PVector(x, y);
    radio = _radio;
  }    
  
  void atributosObligatorios(Sistema sistema) {
    posiciones = (Atr_Posicion[])sistema.getAtributos(Atr_Posicion.key);
    if (posiciones == null) posiciones = (Atr_Posicion[])sistema.incluir(new Atr_Posicion());
    colores = (Atr_Color[])sistema.getAtributos(Atr_Color.key);
    if (colores == null) colores = (Atr_Color[])sistema.incluir(new Atr_Color());
  }
  
  void ejecutar(Sistema sistema){
    pozo.x = mouseX;
    pozo.y = mouseY;
    
    for(int i=0;i<sistema.tamano;i++){
      PVector p = posiciones[i].p;
      int c = colores[i].c;

      float alfa = map(dist(p.x, p.y, pozo.x, pozo.y), 0, radio, 0, 255);
      colores[i].c = color(red(c), green(c) , blue(c) , alfa);
    }
  }
  
}
