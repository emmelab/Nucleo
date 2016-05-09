import java.util.Map;
import processing.core.PVector;
import java.util.HashMap;
import java.util.ArrayList;

//import processing.core.PApplet;

class ClaseEstimulos {
  HashMap<String, PVector> estimulos = new HashMap<String, PVector>();
  PVector estimuloActual;
  Sistema s;

  ClaseEstimulos(Sistema s_) {
    s = s_;    
  }

  void recibirUnEstimulo_CLASE(String nombre, float x, float y) {
    PVector posActual = new PVector(x*s.p5.width, y*s.p5.height); 
   // PVector posActual = new PVector(x, y); 

    boolean existe = false;
    for (String n : estimulos.keySet ()) {
      if (n.equals(nombre))
        existe = true;
    }

    if (!existe) {
      estimulos.put(nombre, posActual);
    } else {
      PVector posicion = estimulos.get(nombre);
      posicion.set(posActual);
    }
  }

  void seleccionarEstimulo_CLASE(String cual) { 
    estimuloActual = estimulos.get(cual);
  }

  HashMap getEstimulos() {
    return estimulos;
  }

  String[] getNombreDeEstimulos() {
    String[] nE = new String[estimulos.size()];
    int contador = 0;
    for (String n : estimulos.keySet ()) {
      nE[contador] = n;
      contador++;
    }
    return nE;
  }
  
  ArrayList getPosicionDeEstimulos() {
  ArrayList pE = new ArrayList();
    int contador = 0;
    for (String n : estimulos.keySet ()) {
      pE.add(estimulos.get(n));
      contador++;
    }
    return pE;
  }

  PVector getEstimulo() {
    return estimuloActual;
  }
}

