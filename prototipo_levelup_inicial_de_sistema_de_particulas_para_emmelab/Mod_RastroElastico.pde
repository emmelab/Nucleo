Mod_RastroElastico mRastroElastico = new Mod_RastroElastico();

class Mod_RastroElastico extends Modificador {
  Atr_Rastro[] rastro;
  Atr_Velocidad[] velocidades;
  float factor[];

  Mod_RastroElastico() {
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
        factor[i] = velocidades[i].magnitud*0.1;
      }
    }

    for (int i = 0; i < sistema.tamano; i++) {
      for (int j = 1; j < 10; j++) {
        rastro[i].hijos[j].set(lerp(rastro[i].hijos[j].x, rastro[i].hijos[j-1].x, factor[i]), lerp(rastro[i].hijos[j].y, rastro[i].hijos[j-1].y, factor[i]), 0);
      }
    }
  }
}

