Mod_AtraccionORechazoPorSemejanza mAtraccionORechazoPorSemejanza = new Mod_AtraccionORechazoPorSemejanza();

class Mod_AtraccionORechazoPorSemejanza extends Modificador{
  Atr_Color[] colores;
  Atr_Fuerza[] fuerzas;
  Atr_Posicion[] posiciones;
  
  //la idea es que yo modifique la fuerza, pero es interesante llamar a velocidad y modificar la direccion ahi
  //Atr_Velocidad[] velocidades;
  
  void atributosObligatorios(Sistema sistema){
    colores = (Atr_Color[])sistema.getAtributos(Atr_Color.key);
    if (colores == null) colores = (Atr_Color[])sistema.incluir(new Atr_Color());
    fuerzas = (Atr_Fuerza[])sistema.getAtributos(Atr_Fuerza.key);
    if (fuerzas == null) fuerzas = (Atr_Fuerza[])sistema.incluir(new Atr_Fuerza());
    posiciones = (Atr_Posicion[])sistema.getAtributos(Atr_Posicion.key);
    if (posiciones == null) posiciones = (Atr_Posicion[])sistema.incluir(new Atr_Posicion()); 
    
    /*
    velocidades = (Atr_Velocidad[])sistema.getAtributos(Atr_Velocidad.key);
    if (velocidades == null) velocidades = (Atr_Velocidad[])sistema.incluir(new Atr_Velocidad());
    */
  }
  
  void ejecutar(Sistema sistema){
    
    //la version 1 era mas optima... pero..... no andaba visualmente como esperaba... por lo que creo que me estaba/estoy confundiendo
    //version1(sistema);
    
    //la version 2... es lo mismo pero no tan optimo, igual .......
    version2(sistema);
    
  }
  
  void version2(Sistema sistema){
    for(int i=0;i<sistema.tamano;i++){
      Atr_Posicion p=posiciones[i];
      Atr_Color c=colores[i];
      Atr_Fuerza f=fuerzas[i];
      PVector vector=new PVector();
      
      for(int j=0;j<sistema.tamano;j++){
        if(i!=j){
          
          Atr_Posicion pj = posiciones[j];
          Atr_Color cj = colores[j];
          
          //calculo la direccion entre la particula y la otra
          float angulo = atan( pj.y - p.y / pj.x - p.x );
          if(pj.x - p.x < 0) angulo += PI;
          
          if( c.col == cj.col){
            vector.add(PVector.fromAngle(angulo)); 
          }else{
            vector.add(PVector.fromAngle(angulo+PI));
          }
          
        }
      }
      
      float direccionVector = atan( vector.y / vector.x );
      if( vector.x < 0 ) direccionVector += PI;
      
      f.direccion = ( Float.isNaN(direccionVector) ) ? 0 : direccionVector;
      //println(direccionVector);
      f.magnitud=0.01;
      
      /* aca esta lo de la velocidad xD
      Atr_Velocidad v = velocidades[i];
      v.direccion = ( Float.isNaN(direccionVectorSuma) ) ? 0 : direccionVectorSuma;
      */
      
    }
  }


  void version1(Sistema sistema){
    //hago un vector de 2 dimensiones (matriz) donde voy a guardar vectores unitarios,
    //por cada particula del sistema guardo vectores apuntando a las otras particulas
    PVector[][] fvectores = new PVector[sistema.tamano][sistema.tamano];
    
    //recorro el sistema
    for(int i=0; i < sistema.tamano; i++){
      
      // me posiciono en una de las particulas
      Atr_Posicion p_i = posiciones[i];
      Atr_Color c_i = colores[i];
      Atr_Fuerza f = fuerzas[i];
            
      //recorro el resto de las particulas
      for(int j=i+1;j<sistema.tamano; j++){
        Atr_Posicion p_j = posiciones[j];
        Atr_Color c_j = colores[j];
        
        //calculo la direccion entre la particula y la otra
        float angulo = atan( p_j.y - p_i.y / p_j.x - p_i.x );
        if(p_j.x - p_i.x < 0) angulo += PI;
        
        //guardo dicha direccion para la particula y para la otra
        //debo saber si se atraen o si se rechazan
        if( c_i.col == c_j.col){
          fvectores[i][j] = PVector.fromAngle(angulo);
          fvectores[j][i] = PVector.fromAngle(angulo-PI);
        }else{
          fvectores[i][j] = PVector.fromAngle(angulo-PI);
          fvectores[j][i] = PVector.fromAngle(angulo);
        }
        
      }
      
      //calculo el vector resultante 
      PVector vectorResultado=new PVector();
      for(int j=0;j<sistema.tamano;j++){
        if(i!=j)vectorResultado.add(fvectores[i][j]);
      }
      
      //calculo el angulo resultante del vectorResultado
      float direccionFinal = atan( vectorResultado.y / vectorResultado.x );
      if(vectorResultado.x < 0) direccionFinal += PI;
      
      //aplico la direccion a mi particula
      f.direccion=( Float.isNaN(direccionFinal) )? 0 : direccionFinal;
      println(f.direccion);
      f.magnitud=0.01;
      
      
    }
  }
  
}



