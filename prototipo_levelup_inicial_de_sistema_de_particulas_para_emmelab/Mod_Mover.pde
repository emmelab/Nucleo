Mod_Mover mMover = new Mod_Mover();

class Mod_Mover extends Modificador{
  Posicion[] posiciones;
  Velocidad[] velocidades;
  
  Mod_Mover(){
    
  }
  
  void atributosObligatorios(Sistema sistema){
    posiciones = (Posicion[])sistema.getAtributos(Posicion.key);
    if (posiciones == null) posiciones = (Posicion[])sistema.incluir(new Posicion());
    velocidades = (Velocidad[])sistema.getAtributos(Velocidad.key);
    if (velocidades == null) velocidades = (Velocidad[])sistema.incluir(new Velocidad());
  }
  
  void ejecutar(Sistema sistema){
      for (int i=0; i<sistema.tamano; i++) {
      Posicion p = posiciones[i];
      Velocidad v = velocidades[i]; 
      p.x += v.magnitud*cos(v.direccion);
      p.y += v.magnitud*sin(v.direccion);
    }
  }

}
