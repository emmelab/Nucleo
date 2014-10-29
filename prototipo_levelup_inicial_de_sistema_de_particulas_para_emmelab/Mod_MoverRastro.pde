Mod_MoverRastro mMoverRastro = new Mod_MoverRastro();

class Mod_MoverRastro extends Modificador {
  Atr_Rastro[] rastros;
  Atr_Velocidad[] velocidades;
  Atr_Posicion[] posiciones;

  Mod_MoverRastro() {
  }

  void atributosObligatorios(Sistema sistema) {
    rastros = (Atr_Rastro[])sistema.getAtributos(Atr_Rastro.key);
    if (rastros == null) rastros = (Atr_Rastro[])sistema.incluir(new Atr_Rastro());
    velocidades = (Atr_Velocidad[])sistema.getAtributos(Atr_Velocidad.key);
    if (velocidades == null) velocidades = (Atr_Velocidad[])sistema.incluir(new Atr_Velocidad());
    posiciones = (Atr_Posicion[])sistema.getAtributos(Atr_Posicion.key);
    if (posiciones == null) posiciones = (Atr_Posicion[])sistema.incluir(new Atr_Posicion());
  }

  void ejecutar(Sistema sistema) {
    for (int i=0; i<sistema.tamano; i++) {
      rastros[i].hijosx[0] = posiciones[i].x;
      rastros[i].hijosy[0] = posiciones[i].y;
      //rastros[i].hijos[0] = posiciones[i];
    }
  }
}

