import processing.core.PApplet;
import java.util.HashMap;

interface Modificador {
  void modificar(Sistema s);
}

class Sistema {
  final PApplet p5;
  int cantidad = 100;
  HashMap<String,Atributo[]> atributos;
  
  //2 ArrayList Modificicador y Bool
  
  Sistema(PApplet p5, int cantidad) {
    this.p5 = p5;
    this.cantidad = cantidad;
    atributos = new HashMap();
  }
  
  Atributo[] incluir(Atributo semilla) {
    if (atributos.containsKey( semilla.getKey() )) {
      System.out.println("Esta llave ya está en uso"+semilla.getKey());
      p5.exit();
      return null;
    }
    else {
      Atributo[] nuevas = semilla.generarGrupo(this);
      atributos.put(semilla.getKey(),nuevas);
      return nuevas;
    }
  }
  
  Atributo[] getAtributos(String llave) {
    return atributos.get(llave);
  }
}
