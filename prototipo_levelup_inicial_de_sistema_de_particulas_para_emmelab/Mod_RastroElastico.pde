Mod_Mover mRastroElastico = new Mod_RastroElastico();

class Mod_RastroElastico extends Modificador {
  Atr_Rastro[] rastro;
  Atr_Velocidad[] velocidades;
  float factor[];

  Mod_Mover() {
  }

  void atributosObligatorios(Sistema sistema) {
    rastro = (Atr_Rastro[])sistema.getAtributos(Atr_Rastro.key);
    if (rastro == null) rastro = (Atr_Rastro[])sistema.incluir(new Atr_Rastro());
    factor = new float[sistema.tamano];
    for (int i=0; i<sistema.tamano; i++) {
      factor[i] = 0.2;
    }
  }

  void atributosOpcionales(Sistema sistema) {
    velocidades = (Atr_Velocidad[])sistema.getAtributos(Atr_Velocidad.key);
  }


  void ejecutar(Sistema sistema) {
    if (velocidades != null) {
      for (int i=0; i<sistema.tamano; i++) {
        factor[i] = velocidades[i]*0.1;
      }
    }

    for (int i = 1; i < sistema.tamano; i++) {
      rastro[i].set(lerp(rastro[i].x, rastro[i-1].x, factor), lerp(rastro[i].y, rasatro[i-1].y, factor), 0);
    }
  }
}

