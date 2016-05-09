//modificado 28/4/2016 -> se agrego estimulos

import processing.core.PVector;

class Mod_ResetLluvia extends Modificador {
  float umbralVelocidadMinima = 0.05f;
  float yResetMinima = 0, yResetMaxima = 200;
  float divisorLimiteInferior = 8;

  void ejecutar(Sistema s) {
    Atr_Posicion posiciones = s.requerir(Atr_Posicion.manager, Atributo.OBLIGATORIO);
    Atr_Velocidad velocidades = s.requerir(Atr_Velocidad.manager, Atributo.OBLIGATORIO);

    float limiteInferior;
    boolean usarUmbralVelocidad;
    
    //Calculo el limiteInferior respecto si hay estimulo o no
    if( s.claseEstimulos.getEstimulo() != null ){
      limiteInferior = s.claseEstimulos.getEstimulo().y;
      usarUmbralVelocidad = false;
    }else{
      limiteInferior = (divisorLimiteInferior-1f)*s.p5.height/divisorLimiteInferior;
      usarUmbralVelocidad = true;
    }
    
    for (int i=0; i<s.tamano; i++) {
      PVector v = velocidades.v[i];
      PVector p = posiciones.p[i];
      
      //pregunto si la particulo supero el limiteInferior
      if( p.y > limiteInferior ){
        
        //si no uso estimulos, solo voy a resetear las particulos si cuya velocidad es muy baja
        if( usarUmbralVelocidad ){
          if( v.magSq() < umbralVelocidadMinima ){
            p.y = s.p5.random(yResetMinima,yResetMaxima);
            //p.x= random(width);
          }
        }else{
          p.y = s.p5.random(yResetMinima,yResetMaxima);
          //p.x= random(width);
        }
        
      }
      
    }//end for
    
  }
                       
  static Registrador<Mod_ResetLluvia> registrador = new Registrador() {
    public String key() {
      return "Mod Reset Lluvia";
    }
     public String categoria() {return "Reset Lluvia";}
    public Mod_ResetLluvia generarInstancia() {
      return new Mod_ResetLluvia();
    }
  };
}
