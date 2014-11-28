Mod_TripleRastro mTripleRastro = new Mod_TripleRastro();

class Mod_TripleRastro extends Modificador{
  Atr_Rastro[] rastro;
  Atr_Posicion[] posiciones;
  
  
  Mod_TripleRastro(){
    
  }
  
  void atributosObligatorios(Sistema sistema){
    posiciones = (Atr_Posicion[])sistema.getAtributos(Atr_Posicion.key);
    if (posiciones == null) posiciones = (Atr_Posicion[])sistema.incluir(new Atr_Posicion()); 
    rastro = (Atr_Rastro[])sistema.getAtributos(Atr_Rastro.key);
    if (rastro == null) rastro = (Atr_Rastro[])sistema.incluir(new Atr_Rastro());
  }
  
  void ejecutar(Sistema sistema){
      for (int i=0; i<sistema.tamano; i++) {
        Atr_Rastro r = rastro[i];
        //Atr_Posicion p = posiciones[i];
          noFill();
        beginShape();
        for(int j=0; j<10; j++){
          vertex(r.hijos[j].x, r.hijos[j].y);
        }
        endShape();
    }
  }
}
