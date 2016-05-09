void petalo(PVector arriba, PVector[] abajo, boolean abierto, float Tam, 
float cX, float cY) {// punto del petalo arriba, arreglo de tres puntos del petalo abajo 0= izquierdo,1= derecho, 3= central, tamanio del petalo, centro donde convergen lso petalos
  noFill();
  float angulo;
  float xIAr1 = 0;
  float xDAr1 = 0;
  float yIAr1 = 0;
  float yDAr1 = 0;
  float xIAr2 = 0;
  float yIAr2 = 0;
  float xDAr2 = 0;
  float yDAr2 = 0;
  if (abierto) {  

    xIAr1 = arriba.x;
    xDAr1 = arriba.x;
    yIAr1 = arriba.y;
    yDAr1 = arriba.y;
    angulo = atan2(arriba.y-cY, arriba.x-cX)-HALF_PI-QUARTER_PI/8;
    xIAr2 = arriba.x+(Tam*2*cos(angulo));
    yIAr2 = arriba.y+(Tam*2*sin(angulo));
    angulo = atan2(arriba.y-cY, arriba.x-cX)+HALF_PI+QUARTER_PI/8;
    xDAr2 = arriba.x+(Tam*2*cos(angulo));
    yDAr2 = arriba.y+(Tam*2*sin(angulo));
  } else {
    xIAr1 = abajo[2].x;
    xDAr1 = abajo[2].x;
    yIAr1 = abajo[2].y;
    yDAr1 = abajo[2].y;
    angulo = atan2(abajo[2].y-cY, abajo[2].x-cX)-HALF_PI-QUARTER_PI/8;
    xIAr2 = abajo[2].x+(Tam/16*cos(angulo));
    yIAr2 = abajo[2].y+(Tam/16*sin(angulo));
    angulo = atan2(abajo[2].y-cY, abajo[2].x-cX)+HALF_PI+QUARTER_PI/8;
    xDAr2 = abajo[2].x+(Tam/16*cos(angulo));
    yDAr2 = abajo[2].y+(Tam/16*sin(angulo));
  }
  float xIAb1 = abajo[0].x;      
  float yIAb1 = abajo[0].y;
  float xDAb1 = abajo[1].x; 
  float yDAb1 = abajo[1].y;
  angulo = atan2(abajo[0].y-cY, abajo[0].x-cX)+HALF_PI;
  float xIAb2 = abajo[0].x+(Tam*cos(angulo));
  float yIAb2 = abajo[0].y+(Tam*sin(angulo));
  angulo = atan2(abajo[1].y-cY, abajo[1].x-cX)-HALF_PI;
  float xDAb2 = abajo[1].x+(Tam*cos(angulo));
  float yDAb2 = abajo[1].y+(Tam*sin(angulo));


  stroke(0, 255, 0);
  bezier(xIAr1, yIAr1, xIAr2, yIAr2, xIAb2, yIAb2, xIAb1, yIAb1);
  bezier(xDAr1, yDAr1, xDAr2, yDAr2, xDAb2, yDAb2, xDAb1, yDAb1);
  /* stroke( 255, 0, 0);
   line(xIAr1, yIAr1, xIAr2, yIAr2);
   line( xIAb2, yIAb2, xIAb1, yIAb1);
   line(xDAr1, yDAr1, xDAr2, yDAr2);
   line( xDAb2, yDAb2, xDAb1, yDAb1);*/
}

void petalo(PVector arriba, PVector[] abajo, boolean abierto, float Tam, 
float cX, float cY, PVector vacioAnimacion) {// punto del petalo arriba, arreglo de tres puntos del petalo abajo 0= izquierdo,1= derecho, 3= central, tamanio del petalo, centro donde convergen lso petalos
  noFill();
  float angulo;
  float f = 0.05;
  float xIAr1 = 0;
  float xDAr1 = 0;
  float yIAr1 = 0;
  float yDAr1 = 0;
  float xIAr2 = 0;
  float yIAr2 = 0;
  float xDAr2 = 0;
  float yDAr2 = 0;
  float Tm = Tam*2;
  float tm = Tam/2;
  float tAb = 0;


  if (abierto) {
    tAb = Tm/2.2;
    float x = lerp(vacioAnimacion.x, arriba.x, f);
    float y = lerp(vacioAnimacion.y, arriba.y, f);
    vacioAnimacion.set(x, y);
    xIAr1 = x;
    xDAr1 = xIAr1;
    yIAr1 = y;
    yDAr1 = yIAr1;
    angulo = atan2(yIAr1-cY, xIAr1-cX)-HALF_PI-QUARTER_PI/8;
    xIAr2 = arriba.x+(Tm*cos(angulo));
    yIAr2 = arriba.y+(Tm*sin(angulo));
    angulo = atan2(yDAr1-cY, xDAr1-cX)+HALF_PI+QUARTER_PI/8;
    xDAr2 = arriba.x+(Tm*cos(angulo));
    yDAr2 = arriba.y+(Tm*sin(angulo));
  } else { 
    tAb = tm;   
    float x = lerp(vacioAnimacion.x, abajo[2].x, f);
    float y = lerp(vacioAnimacion.y, abajo[2].y, f);
    vacioAnimacion.set(x, y);
    xIAr1 =x;
    xDAr1 =xIAr1;
    yIAr1 = y;
    yDAr1 = yIAr1;
    angulo = atan2(yIAr1-cY, xIAr1-cX)-HALF_PI;
    xIAr2 = abajo[2].x+((tm)*cos(angulo));
    yIAr2 = abajo[2].y+((tm)*sin(angulo));
    angulo = atan2(yDAr1-cY, xDAr1-cX)+HALF_PI;
    xDAr2 = abajo[2].x+((tm)*cos(angulo));
    yDAr2 = abajo[2].y+((tm)*sin(angulo));
  }
  float xIAb1 = abajo[0].x;      
  float yIAb1 = abajo[0].y;
  float xDAb1 = abajo[1].x; 
  float yDAb1 = abajo[1].y;
  angulo = atan2(abajo[0].y-cY, abajo[0].x-cX)+HALF_PI;
  float xIAb2 = abajo[0].x+(tAb*cos(angulo));
  float yIAb2 = abajo[0].y+(tAb*sin(angulo));
  angulo = atan2(abajo[1].y-cY, abajo[1].x-cX)-HALF_PI;
  float xDAb2 = abajo[1].x+(tAb*cos(angulo));
  float yDAb2 = abajo[1].y+(tAb*sin(angulo));


  stroke(0, 255, 0);
  strokeWeight(2);
  bezier(xIAr1, yIAr1, xIAr2, yIAr2, xIAb2, yIAb2, xIAb1, yIAb1);
  bezier(xDAr1, yDAr1, xDAr2, yDAr2, xDAb2, yDAb2, xDAb1, yDAb1);
  noStroke();
  /* stroke( 255, 0, 0);
   line(xIAr1, yIAr1, xIAr2, yIAr2);
   line( xIAb2, yIAb2, xIAb1, yIAb1);
   line(xDAr1, yDAr1, xDAr2, yDAr2);
   line( xDAb2, yDAb2, xDAb1, yDAb1);*/
}

void petalo(PVector arriba, PVector[] abajo, boolean abierto, float Tam, 
float cX, float cY, PVector vacioAnimacion, color c) {// punto del petalo arriba, arreglo de tres puntos del petalo abajo 0= izquierdo,1= derecho, 3= central, tamanio del petalo, centro donde convergen lso petalos
  noFill();
  float angulo;
  float f = 0.05;
  float xIAr1 = 0;
  float xDAr1 = 0;
  float yIAr1 = 0;
  float yDAr1 = 0;
  float xIAr2 = 0;
  float yIAr2 = 0;
  float xDAr2 = 0;
  float yDAr2 = 0;
  float Tm = Tam*2;
  float tm = Tam/2;
  float tAb = 0;


  if (abierto) {
    tAb = Tm/2.2;
    float x = lerp(vacioAnimacion.x, arriba.x, f);
    float y = lerp(vacioAnimacion.y, arriba.y, f);
    vacioAnimacion.set(x, y);
    xIAr1 = x;
    xDAr1 = xIAr1;
    yIAr1 = y;
    yDAr1 = yIAr1;

    angulo = atan2(yIAr1-cY, xIAr1-cX)-HALF_PI-QUARTER_PI/8;
    xIAr2 = arriba.x+(Tm*cos(angulo));
    yIAr2 = arriba.y+(Tm*sin(angulo));
    angulo = atan2(yDAr1-cY, xDAr1-cX)+HALF_PI+QUARTER_PI/8;
    xDAr2 = arriba.x+(Tm*cos(angulo));
    yDAr2 = arriba.y+(Tm*sin(angulo));
  } else { 
    tAb = tm/2;   
    float x = lerp(vacioAnimacion.x, abajo[2].x, f);
    float y = lerp(vacioAnimacion.y, abajo[2].y, f);
    vacioAnimacion.set(x, y);
    xIAr1 =x;
    xDAr1 =xIAr1;
    yIAr1 = y;
    yDAr1 = yIAr1;
    angulo = atan2(yIAr1-cY, xIAr1-cX)-HALF_PI;
    xIAr2 = abajo[2].x+((tm)*cos(angulo));
    yIAr2 = abajo[2].y+((tm)*sin(angulo));
    angulo = atan2(yDAr1-cY, xDAr1-cX)+HALF_PI;
    xDAr2 = abajo[2].x+((tm)*cos(angulo));
    yDAr2 = abajo[2].y+((tm)*sin(angulo));
  }
  float xIAb1 = abajo[0].x;      
  float yIAb1 = abajo[0].y;
  float xDAb1 = abajo[1].x; 
  float yDAb1 = abajo[1].y;
  angulo = atan2(abajo[0].y-cY, abajo[0].x-cX)+HALF_PI;
  float xIAb2 = abajo[0].x+(tAb*cos(angulo));
  float yIAb2 = abajo[0].y+(tAb*sin(angulo));
  angulo = atan2(abajo[1].y-cY, abajo[1].x-cX)-HALF_PI;
  float xDAb2 = abajo[1].x+(tAb*cos(angulo));
  float yDAb2 = abajo[1].y+(tAb*sin(angulo));


  stroke(c);
  strokeWeight(4);
  bezier(xIAr1, yIAr1, xIAr2, yIAr2, xIAb2, yIAb2, xIAb1, yIAb1);
  bezier(xDAr1, yDAr1, xDAr2, yDAr2, xDAb2, yDAb2, xDAb1, yDAb1);
}

void lineas(PVector arriba, PVector[] abajo, boolean abierto, float Tam, 
float cX, float cY, PVector vacioAnimacion, color c) {
  noFill();
  float f = 0.05;
  float dista = 0;
  float nX = 0; 
  float nY = 0;
  float angulo = 0;
  float xIAr = 0;
  float yIAr = 0;
  float xIAb = 0;
  float yIAb = 0;
  float xDAr = 0;
  float yDAr = 0;
  float xDAb = 0;
  float yDAb = 0;
  float tm = Tam/2;

  if (abierto) {
    dista = dist(cX, cY, arriba.x, arriba.y);
    nX =  arriba.x;
    nY =  arriba.y;
  } else {
    dista = 0;
    nX = cX; 
    nY = cY;
  }

  float x = lerp(vacioAnimacion.x, nX, f);
  float y = lerp(vacioAnimacion.y, nY, f);
  vacioAnimacion.set(x, y);

  angulo = atan2(cY-y, cX-x)+HALF_PI;
  xIAr = x+(tm)*cos(angulo);
  yIAr = y+(tm)*sin(angulo);
  xIAb = cX+(tm)*cos(angulo);
  yIAb = cY+(tm)*sin(angulo);
  angulo = atan2(cY-y, cX-x)-HALF_PI;
  xDAr = x+(tm)*cos(angulo);
  yDAr = y+(tm)*sin(angulo);
  xDAb = cX+(tm)*cos(angulo);
  yDAb = cY+(tm)*sin(angulo);

  stroke(c);
  strokeWeight(0.5f);

  line(xIAr, yIAr, xIAb, yIAb);
  line(xDAr, yDAr, xDAb, yDAb);
}

