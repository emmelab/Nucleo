class NivelBajo {
  float piso;
  boolean activo, entra, sale;
  int umbral;

  NivelBajo(int _umbral) {
    piso = 0;
    activo = false;
    umbral = _umbral;
  }

  void deteccion(int user, HashMap<Integer, PVector> joints) {
    entra = sale = false;

    //actualizo piso
    for (int tipoJoint : tiposJoint) {
      PVector pos = joints.get(tipoJoint);
      context.getJointPositionSkeleton(user, tipoJoint, pos);

      if (pos.y > piso) {
        piso = pos.y;
      }
    }

    PVector cabeza = joints.get(SimpleOpenNI.SKEL_HEAD); 

    if (!activo) {
      if (piso - cabeza.y < umbral) {
        activo = true;
        entra = true;
      }
    } else {
      if (piso - cabeza.y > umbral) {
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
