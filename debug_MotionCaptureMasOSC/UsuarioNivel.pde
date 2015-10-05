class UsuarioNivel {
  SimpleOpenNI context;
  int idUsuario;

  PVector piso, centroMasa;

  float umbralBajo, umbralAlto;
  float factorUmbralBajo, factorUmbralAlto;

  boolean bajoBruto, medioBruto, altoBruto;
  boolean entroBajoBruto, entroMedioBruto, entroAltoBruto;
  boolean salioBajoBruto, salioMedioBruto, salioAltoBruto;

  boolean bajo, medio, alto;
  boolean entroBajo, entroMedio, entroAlto;
  boolean salioBajo, salioMedio, salioAlto;

  //static final int BAJO = 0;
  //static final int MEDIO = 1;
  //static final int ALTO = 2;
  //int ESTABILIDAD = 20;
  int estabilidad, minimoEstabilidad;
  int actual, anterior, estable;

  UsuarioNivel(SimpleOpenNI context, int idUsuario, int minimoEstabilidad, float factorUmbralBajo, float factorUmbralAlto) {
    this.context = context;
    this.idUsuario = idUsuario;
    this.minimoEstabilidad = minimoEstabilidad;

    this.factorUmbralBajo = factorUmbralBajo;
    this.factorUmbralAlto = factorUmbralAlto;

    piso = new PVector();
    centroMasa = new PVector();
  }
  /*
  Nivel(int umbralBajo, int umbralMedio) {
   piso = new PVector();
   this.umbralBajo = umbralBajo;
   this.umbralMedio = umbralMedio;
   }
   
   Nivel(int umbralBajo, int umbralMedio, int estabilidad) {
   piso = new PVector();
   this.umbralBajo = umbralBajo;
   this.umbralMedio = umbralMedio;
   this.ESTABILIDAD = estabilidad;
   }
   */
  void actualizar() {
    context.getCoM(idUsuario, centroMasa);
    float alturaCentro = centroMasa.y - piso.y;

    boolean bBrutAnt = bajoBruto, mBrutAnt = medioBruto, aBrutAnt = altoBruto;
    boolean bAnt = bajo, mAnt = medio, aAnt = alto;

    entroBajo = entroMedio = entroAlto =
      salioBajo = salioMedio = salioAlto =
      entroBajoBruto = entroMedioBruto = entroAltoBruto =
      salioBajoBruto = salioMedioBruto = salioAltoBruto = false;

    if ( centroMasa.y < umbralBajo ) {
      bajoBruto = ! (medioBruto = altoBruto = false);
    } else if (centroMasa.y < umbralAlto) {
      medioBruto = ! (bajoBruto = altoBruto = false);
    } else {
      altoBruto = ! (bajoBruto = medioBruto = false);
    }

    entroBajoBruto = bajoBruto && !bBrutAnt;
    salioBajoBruto = !bajoBruto && bBrutAnt;
    entroMedioBruto = medioBruto && !mBrutAnt;
    salioMedioBruto = !medioBruto && mBrutAnt;
    entroAltoBruto = altoBruto && !aBrutAnt;
    salioAltoBruto = !altoBruto && aBrutAnt;

    if (entroBajoBruto || salioBajoBruto || entroMedioBruto || salioMedioBruto || entroAltoBruto || salioAltoBruto) {
      estabilidad = 0;
    } else {
      if (estabilidad < minimoEstabilidad) {
        estabilidad++;
      } else {
        bajo = bajoBruto;
        medio = medioBruto;
        alto = altoBruto;
      }
    }

    entroBajo = bajo && !bAnt;
    salioBajo = !bajo && bAnt;
    entroMedio = medio && !mAnt;
    salioMedio = !medio && mAnt;
    entroAlto = alto && !aAnt;
    salioAlto = !alto && aAnt;
  }

  /*void deteccion(int user, HashMap<Integer, PVector> joints) {  
   PVector torso = joints.get(SimpleOpenNI.SKEL_TORSO);
   float delTorsoAlPiso = abs(piso.y - torso.y);
   
   // inicializar eventos
   entroBajo = entroMedio = entroAlto = false;
   salioBajo = salioMedio = salioAlto = false;
   
   // estados
   alto = (delTorsoAlPiso > umbralMedio);
   medio = (delTorsoAlPiso < umbralMedio && delTorsoAlPiso > umbralBajo);
   bajo = (delTorsoAlPiso < umbralBajo);
   
   // estado actual
   if (alto) { actual = ALTO; } 
   else if (medio) { actual = MEDIO; }
   else if (bajo) { actual = BAJO; }
   
   // comprobar estabilidad
   if (actual == anterior && estable < ESTABILIDAD) {
   estable++;
   }
   
   // si hay un cambio de nivel y es estable, es un evento
   if (actual != anterior && estable >= ESTABILIDAD) {
   
   if (anterior == ALTO && actual == MEDIO) {
   entroMedio = true;
   salioAlto = true;
   }
   if (anterior == MEDIO && actual == BAJO) {
   entroBajo = true;
   salioMedio = true;
   }
   if (anterior == BAJO && actual == MEDIO) {
   entroMedio = true;
   salioBajo = true;
   }
   if (anterior == MEDIO && actual == ALTO) {
   entroAlto = true;
   salioMedio = true;
   }
   
   // guardar el anterior nivel
   anterior = actual;
   // resetear estabilidad
   estable = 0;
   }
   
   }*/

  void calcularPiso(int[] tiposJoint) {
    if (context.isTrackingSkeleton(idUsuario)) {
      context.getCoM(idUsuario, centroMasa);
      piso.set(centroMasa);

      // piso.y = el joint mas bajo
      PVector pos = new PVector();
      for (int tipoJoint : tiposJoint) {
        context.getJointPositionSkeleton(idUsuario, tipoJoint, pos);
        if (pos.y < piso.y) piso.y = pos.y;
      }

      umbralAlto = lerp(piso.y, centroMasa.y, factorUmbralAlto);
      umbralBajo = lerp(piso.y, centroMasa.y, factorUmbralBajo);
    }
    else {
      println("No se puede calcular piso hasta tener bien al esqueleto");
    }
  }

  /*boolean alto() { return alto; }
   boolean medio() { return medio; }
   boolean bajo() { return bajo; }
   boolean entroAlto() { return entroAlto; }
   boolean entroMedio() { return entroMedio; }
   boolean entroBajo() { return entroBajo; }
   boolean salioAlto() { return salioAlto; }
   boolean salioMedio() { return salioMedio; }
   boolean salioBajo() { return salioBajo; }
   int umbralBajo() { return umbralBajo; }
   int umbralMedio() { return umbralMedio; }*/
}

