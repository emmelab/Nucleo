Mod_Gravedad mGravedad = new Mod_Gravedad(HALF_PI,0.05);

class Mod_Gravedad extends Modificador{
  float direccion,magnitud;
  Atr_Velocidad[] velocidades;
  
  Mod_Gravedad(float d,float m){
    this.direccion=d;
    this.magnitud=m;
  }
  
  void atributosObligatorios(Sistema sistema){
    velocidades = (Atr_Velocidad[])sistema.getAtributos(Atr_Velocidad.key);
    if (velocidades == null) velocidades = (Atr_Velocidad[])sistema.incluir(new Atr_Velocidad());
  }
  
  void ejecutar(Sistema sistema){
    for(int i=0;i<sistema.tamano;i++){
      Atr_Velocidad v = velocidades[i];
      
      float componenteX = ( v.magnitud * cos(v.direccion) ) + ( magnitud * cos(direccion) );
      float componenteY = ( v.magnitud * sin(v.direccion) ) + ( magnitud * sin(direccion) );
      
      v.direccion = atan( componenteY / componenteX );
      if(componenteX < 0) v.direccion += PI;
      
      //nada mas ni nada menos que raiz cuadrada o dist() xD perdon u.u
      v.magnitud = sqrt( sq(componenteX) + sq(componenteY) );
    }
  }
  
}
