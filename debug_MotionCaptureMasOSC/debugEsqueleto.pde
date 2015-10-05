void dibujarDebugEsqueleto (SimpleOpenNI curContext, int userId, int[] tipos, int[][] pares, float tam) {
  noFill();
  stroke(#97F5F2);

  PVector pos = new PVector();
  for (int tipoDeJoint : tipos) {
    float confianza = curContext.getJointPositionSkeleton(userId, tipoDeJoint, pos);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);

    ellipse(0, 0, tam*5.6, tam*5.6);
    if (confianza >= .5) {
      line(-tam, +tam, +tam, -tam);
      line(+tam, +tam, -tam, -tam);
    }
    if (confianza == 1) {
      ellipse(0, 0, tam*4.8, tam*4.8);
      ellipse(0, 0, tam*4, tam*4);
    }
    popMatrix();
  }
  stroke(#97F5F2, 120);
  PVector pos2 = new PVector();
  for (int[] par : pares) {
    float confianza1 = curContext.getJointPositionSkeleton(userId, par[0], pos);
    float confianza2 = curContext.getJointPositionSkeleton(userId, par[1], pos2);
    float ang = atan2(pos.y-pos2.y, pos.x-pos2.x) + HALF_PI;
    pushMatrix();
    line(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z);
    if (confianza2 >= .5) {
      translate( tam*.5*5.6*cos(ang), tam*.5*5.6*sin(ang) );
      line(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z);
      translate( -tam*5.6*cos(ang), -tam*5.6*sin(ang) );
      line(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z);
    }
    popMatrix();
  }
}

