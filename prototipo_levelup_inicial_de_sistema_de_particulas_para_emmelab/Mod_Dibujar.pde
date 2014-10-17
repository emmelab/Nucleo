Mod_Dibujar mDibujar=new Mod_Dibujar();

class Mod_Dibujar extends Modificador{ 
  Posicion[] posiciones;
  Tamano[] tamanios;
  
  Mod_Dibujar(){
    
  }
  
  void atributosObligatorios(Sistema sistema){
    posiciones = (Posicion[])sistema.getAtributos(Posicion.key);
    if (posiciones == null) posiciones = (Posicion[])sistema.incluir(new Posicion()); 
    tamanios = (Tamano[])sistema.getAtributos(Tamano.key);
    if (tamanios == null) tamanios = (Tamano[])sistema.incluir(new Tamano());
    //Color[] colores = sistema.getAtributos(Color.key);
  }
  
  void ejecutar(Sistema sistema){
    for (int i=0; i<sistema.tamano; i++) {
      Posicion p = posiciones[i];
      Tamano t = tamanios[i]; 
      //ESTO ES PARA EL FUTURO
      //Color c = colores[i];
      //if (colores != null) {
        //fill(colores[i].color);
      //}
      
      ellipse(p.x,p.y,t.diametro,t.diametro);
    }   
  }
  
}
