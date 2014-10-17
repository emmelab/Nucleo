Mod_Mover mMover = new Mod_Mover();

class Mod_Mover extends Modificador{
  Atr_Posicion[] posiciones;
  Atr_Velocidad[] velocidades;
  
  Mod_Mover(){
    
  }
  
  void atributosObligatorios(Sistema sistema){
    posiciones = (Atr_Posicion[])sistema.getAtributos(Atr_Posicion.key);
    if (posiciones == null) posiciones = (Atr_Posicion[])sistema.incluir(new Atr_Posicion());
    velocidades = (Atr_Velocidad[])sistema.getAtributos(Atr_Velocidad.key);
    if (velocidades == null) velocidades = (Atr_Velocidad[])sistema.incluir(new Atr_Velocidad());
  }
  
  void ejecutar(Sistema sistema){
      for (int i=0; i<sistema.tamano; i++) {
      Atr_Posicion p = posiciones[i];
      Atr_Velocidad v = velocidades[i]; 
      p.x += v.magnitud*cos(v.direccion);
      p.y += v.magnitud*sin(v.direccion);
    }
  }

}
