Mod_Dibujar mDibujar=new Mod_Dibujar();

class Mod_Dibujar extends Modificador{ 
  Posicion[] posiciones;
  Tamano[] tamanios;
  Color[] colores;
  
  Mod_Dibujar(){
    
  }
  
  void atributosObligatorios(Sistema sistema){
    posiciones = (Posicion[])sistema.getAtributos(Posicion.key);
    if (posiciones == null) posiciones = (Posicion[])sistema.incluir(new Posicion()); 
    tamanios = (Tamano[])sistema.getAtributos(Tamano.key);
    if (tamanios == null) tamanios = (Tamano[])sistema.incluir(new Tamano());
  }
  
  void atributosOpcionales(Sistema sistema){
    colores = (Color[])sistema.getAtributos(Color.key);
  }
  
  void ejecutar(Sistema sistema){
    for (int i=0; i<sistema.tamano; i++) {
      Posicion p = posiciones[i];
      Tamano t = tamanios[i];

      //ESTO ES PARA EL FUTURO
      if (colores != null) {
        fill(colores[i].col);
      }
      
      ellipse(p.x,p.y,t.diametro,t.diametro);
    }   
  }
  
}
