void dibujarDebugDesequilibrio (UsuarioDesequilibrio deseq, float x, float y, float w, float h) {
  pushStyle();
  
  PImage uMap = deseq.context.userImage();
  PVector offset = new PVector(uMap.width/2 - deseq.centroMasa2D.x , uMap.height/2 - deseq.centroMasa2D.y);
  
  uMap.copy(uMap, 0, 0, uMap.width, uMap.height,
  floor(offset.x) , floor(offset.y), uMap.width, uMap.height);
  
  image(uMap, x,y,w,h);
  
  noStroke();
  fill( deseq.izquierda || deseq.derecha ? 255:0 , deseq.izquierdaBruto || deseq.derechaBruto ? 255:0 , 255,110);
  rectMode(CORNERS);
  rect( x+w/2 ,y, x+w/2 -deseq.centroMasa2D.x+deseq.centroCaja.x ,y+h);
  
  stroke(#1FFF49);
  line(x + w/2, y , x+w/2, y+h);
  line(x , y+h/2 , x+w, y+h/2);
  
  stroke(#1D9534);
  float tamSegmento = 10;
  for (float offY = 0; offY < h; offY += tamSegmento*2) {
    line(x + w/2 - deseq.umbralMenor , y + offY , x + w/2 - deseq.umbralMenor , min(y + offY+tamSegmento, y+h));
    line(x + w/2 + deseq.umbralMenor , y + offY , x + w/2 + deseq.umbralMenor , min(y + offY+tamSegmento, y+h));
  }
  //line(x + w/2 - deseq.umbralMenor , y , x + w/2 - deseq.umbralMenor , y+ h);
  //line(x + w/2 + deseq.umbralMenor , y , x + w/2 + deseq.umbralMenor , y+ h);
  line(x + w/2 - deseq.umbralMaximo , y , x + w/2 - deseq.umbralMaximo , y+ h);
  line(x + w/2 + deseq.umbralMaximo , y , x + w/2 + deseq.umbralMaximo , y+ h);
  
  noStroke();
  if (g.is3D())  translate(0,0,1);
 fill(0);
 rectMode(CENTER);
 textAlign(CENTER,CENTER);
  rect(x + w/2 , y+h*.05 , w*.18 , h*.1);
  fill(0,255,0);
  textSize(h*.07);
  text(nfs(deseq.desequilibrio,1,2),x+w/2, y + h*.05);
  if (g.is3D())translate(0,0,-1);

  popStyle();
}
