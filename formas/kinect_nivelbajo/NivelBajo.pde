class NivelBajo {
  PVector piso;
  boolean activo, entra, sale;
  int umbral;

  NivelBajo(int _umbral) {
    piso = new PVector();
    activo = false;
    umbral = _umbral;
  }

  void deteccion(int user, HashMap<Integer, PVector> joints) {
    entra = sale = false;

    //actualizo piso
    for (int tipoJoint : tiposJoint) {
      PVector pos = joints.get(tipoJoint);
      context.getJointPositionSkeleton(user, tipoJoint, pos);

      PVector pos2d = new PVector();
      context.convertRealWorldToProjective(pos, pos2d);

      if (pos2d.y > piso.y) {
        piso.set(pos2d);
      }
    }

    PVector cabeza = joints.get(SimpleOpenNI.SKEL_HEAD); 
    PVector cabeza2d = new PVector();
    context.convertRealWorldToProjective(cabeza, cabeza2d);

    if (!activo) {
      if (cabeza2d.dist(piso) < umbral) {
        activo = true;
        entra = true;
      }
    } else {
      if (cabeza2d.dist(piso) > umbral) {
        activo = false;
        sale = true;
      }
    }
  }

  boolean activo() { 
    return activo;
  }
  boolean entra() { 
    return entra;
  }
  boolean sale() { 
    return sale;
  }
}

