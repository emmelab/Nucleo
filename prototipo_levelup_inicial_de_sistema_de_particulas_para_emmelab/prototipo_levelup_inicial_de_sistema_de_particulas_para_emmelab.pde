Sistema sistema;

boolean gravedadAlPiso=false;

void setup() {
  size(800,600);
  sistema = new Sistema(this,100);
  
  if(gravedadAlPiso){
    sistema.agregarModificador(mGravedad);
  }else{
    sistema.agregarModificador(mAtraccionORechazoPorSemejanza);
    sistema.agregarModificador(mAplicarFuerza);
  }
  sistema.agregarModificador(mMover);
  sistema.agregarModificador(mEspacioCerrado);
  sistema.agregarModificador(mDibujar);
  
  
}

void draw() {
  background(0);
  
  sistema.actualizar();
}
