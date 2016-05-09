import java.util.Map;


void recibirUnEstimulo(String nombre, float x, float y) {
  sistema.claseEstimulos.recibirUnEstimulo_CLASE(nombre, x, y);
  //println("recibo bien -------------------------------------"+nombre+"__||__"+x+"__||__"+y+"__||__"+frameCount);
}

void enviarEstimulos() { 
     String[] e = sistema.claseEstimulos.getNombreDeEstimulos();
   mensaje_CANTIDAD("/estimulos/totales", e.length);
  for (int i=0; i<e.length; i++) {
    mensaje_NOMBRE_ESTADO("/estimulos/totales", e[i], 0);
  }
  mensaje("/estimulos/listo");
  println("estoy enviando todos los estimulos sin problema...... te llegan?");
} 

void seleccionarEstimulo(String cual) { 
  sistema.claseEstimulos.seleccionarEstimulo_CLASE(cual);
} 

