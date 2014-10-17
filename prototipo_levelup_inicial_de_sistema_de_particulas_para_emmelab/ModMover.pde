Mod_Mover mMover = new Mod_Mover();

class Mod_Mover implements Modificador{
  Mod_Mover(){
    
  }
  
  void modificar(Sistema sistema){
    Posicion[] posiciones = (Posicion[])sistema.getAtributos(Posicion.key);
    if (posiciones == null) posiciones = (Posicion[])sistema.incluir(new Posicion());
    Velocidad[] velocidades = (Velocidad[])sistema.getAtributos(Velocidad.key);
    if (velocidades == null) velocidades = (Velocidad[])sistema.incluir(new Velocidad());
    
    for (int i=0; i<sistema.tamano; i++) {
      Posicion p = posiciones[i];
      Velocidad v = velocidades[i]; 
      p.x += v.magnitud*cos(v.direccion);
      p.y += v.magnitud*sin(v.direccion);
    }
  }
}
