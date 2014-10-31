Mod_AplicarFuerza mAplicarFuerza = new Mod_AplicarFuerza();

class Mod_AplicarFuerza extends Modificador{
  Atr_Fuerza[] fuerzas;
  Atr_Velocidad[] velocidades;
  
  Mod_AplicarFuerza(){
    
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
      
      v.magnitud = sqrt( sq(componenteX) + sq(componenteY) );
    }
  }
  
}
