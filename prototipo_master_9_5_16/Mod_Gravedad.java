//modificado 28/4/2016 -> se agrego estimulos

import processing.core.PVector;

class Mod_Gravedad extends Modificador {
  float fuerza = .05f;
  PVector direccion = PVector.fromAngle(processing.core.PApplet.HALF_PI);

  void ejecutar(Sistema s) {
    Atr_Posicion posiciones = s.requerir(Atr_Posicion.manager, Atributo.OBLIGATORIO);
    Atr_Velocidad velocidades = s.requerir(Atr_Velocidad.manager, Atributo.OPCIONAL);
    Atr_Aceleracion aceleracion = s.requerir(Atr_Aceleracion.manager, Atributo.OPCIONAL);

    PVector gravedad = new PVector();
    
    if( s.claseEstimulos.getEstimulo() != null ){
      
      PVector estimulo = s.claseEstimulos.getEstimulo();
      gravedad = PVector.fromAngle( s.p5.atan2( estimulo.y - s.p5.height*.5f, estimulo.x - s.p5.width*.5f ) );
      
    }else{
      gravedad = direccion.get();
    }
      
    gravedad.mult(fuerza);
    PVector[] lista = null;
    
    if (aceleracion != null) lista = aceleracion.a;
    else if (velocidades != null) lista = velocidades.v;
    else lista = posiciones.p;
    for (int i=0; i<s.tamano; i++) {
      lista[i].add(gravedad);
    }
  }
                
  static Registrador<Mod_Gravedad> registrador = new Registrador() {
    public String key() {
      return "Gravedad";
    }
     public String categoria() {return "Aplicar Fuerza";}
    public Mod_Gravedad generarInstancia() {
      return new Mod_Gravedad();
    }
  };
}
