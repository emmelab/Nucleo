Mod_Mover mMover = new Mod_Mover();

class Mod_Mover extends Modificador {
  Atr_Posicion[] posiciones;
  Atr_Velocidad[] velocidades;
  PVector[] lasPosiciones;

  Mod_Mover() {
  }

  void atributosObligatorios(Sistema sistema) {
    posiciones = (Atr_Posicion[])sistema.getAtributos(Atr_Posicion.key);
    if (posiciones == null) posiciones = (Atr_Posicion[])sistema.incluir(new Atr_Posicion());
    velocidades = (Atr_Velocidad[])sistema.getAtributos(Atr_Velocidad.key);
    if (velocidades == null) velocidades = (Atr_Velocidad[])sistema.incluir(new Atr_Velocidad());
  }

  void ejecutar(Sistema sistema) {
    lasPosiciones = new PVector[sistema.tamano];
    for (int i=0; i<sistema.tamano; i++) {
      Atr_Posicion p = posiciones[i];      
      Atr_Velocidad v = velocidades[i]; 
      float direccion = random(v.direccion-radians(90),v.direccion+radians(90));
      p.x += v.magnitud*cos(direccion);
      p.y += v.magnitud*sin(direccion);
      lasPosiciones[i] = new PVector(p.x, p.y);
    }
  }

  PVector[] posiciones(Sistema sistema) {     
    return  lasPosiciones;
}
}
