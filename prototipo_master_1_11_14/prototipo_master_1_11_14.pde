Sistema sistema;

boolean pausa, fondoAlfa;

int posModificadorMover;
int raizDeCantidad = 12;

void setup() {
  size(800, 600);
  sistema = new Sistema(this, raizDeCantidad*raizDeCantidad);

  noSmooth();
  noStroke();

  sistema.agregarModificador(mGravedad);
  sistema.agregarModificador(mFuerzasPorSemejanza);
  sistema.agregarModificador(mAtraccionAlCentro);
  sistema.agregarModificador(mAplicarFuerza);
  sistema.agregarModificador(mEspacioCerrado);

  posModificadorMover = sistema.modificadores.size();
  sistema.agregarModificador(mMover);
  sistema.agregarModificador(mColisionParticulasSimple);

  sistema.agregarModificador(mRastroElastico);
  sistema.agregarModificador(mDibujar);

  sistema.agregarModificador(mActualizarRastro);
}

void reset() {
  background(0);
  sistema = new Sistema(this, raizDeCantidad*raizDeCantidad);

  sistema.agregarModificador(mGravedad);
  sistema.agregarModificador(mFuerzasPorSemejanza);
  sistema.agregarModificador(mAtraccionAlCentro);
  sistema.agregarModificador(mAplicarFuerza);
  sistema.agregarModificador(mEspacioCerrado);

  sistema.agregarModificador(mMover);
  sistema.agregarModificador(mColisionParticulasSimple);

  sistema.agregarModificador(mRastroElastico);
  sistema.agregarModificador(mDibujar);

  sistema.agregarModificador(mActualizarRastro);
}

void draw() {
  if (!pausa) {
    ciclo();
  }
}

void ciclo() { 
  if (fondoAlfa) {
    fill(0, 1);
    rect(0, 0, width, height);
  } else
    background(0);

  sistema.actualizar();

  fill(255);
  text(frameRate, 5, 10);
}

void switchMover() {
  sistema.setEstadoModificador(posModificadorMover, !sistema.getEstadoModificador(posModificadorMover) );
}

void keyPressed() {
  if (key == ' ') pausa = !pausa;
  else if (keyCode == TAB) ciclo();
  else if (keyCode == BACKSPACE || keyCode == DELETE) reset();
  else if (key == 'f') fondoAlfa = !fondoAlfa;
  else if (key == 'm') switchMover();
  else if (key == 'd') sistema.debug = !sistema.debug;
}
