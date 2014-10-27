Mod_Gravedad mGravedad = new Mod_Gravedad();

class Mod_Gravedad extends Modificador{
  Atr_Fuerza[] fuerzas;
  Atr_Velocidad[] velocidades;
  
  Mod_Gravedad(){
    
  }
  
  void atributosObligatorios(Sistema sistema){
    fuerzas = (Atr_Fuerza[])sistema.getAtributos(Atr_Fuerza.key);
    if (fuerzas == null) fuerzas = (Atr_Fuerza[])sistema.incluir(new Atr_Fuerza());
    velocidades = (Atr_Velocidad[])sistema.getAtributos(Atr_Velocidad.key);
    if (velocidades == null) velocidades = (Atr_Velocidad[])sistema.incluir(new Atr_Velocidad());
  }
  
  void ejecutar(Sistema sistema){
    for(int i=0;i<sistema.tamano;i++){
      Atr_Fuerza f = fuerzas[i];
      Atr_Velocidad v = velocidades[i];
      
      float componenteX = ( v.magnitud * cos(v.direccion) ) + ( f.magnitud * cos(f.direccion) );
      float componenteY = ( v.magnitud * sin(v.direccion) ) + ( f.magnitud * sin(f.direccion) );
      
      v.direccion = atan( componenteY / componenteX );
      if(componenteX < 0) v.direccion += PI;
      
      //nada mas ni nada menos que raiz cuadrada o dist() xD perdon u.u
      v.magnitud = sqrt( sq(componenteX) + sq(componenteY) );
    }
  }
  
}
