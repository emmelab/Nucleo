////-------------------- el nombre de netAddres y de oscP5 deberian ser especificados en el constructor para un futuro 

class IpManager {
  ControlP5 cp5;
  float alto = height/20;
  float margenSuperior = height/2-alto*5;

  float franjaW = width/10;
  float franjaH = height/10;

  boolean escondido;


  IpManager(ControlP5 cp5_) {
    cp5 = cp5_;

    cp5.addTextfield("IP")
      .setPosition(width-franjaW*3, margenSuperior)
        .setSize(int(franjaW*3.5), int(alto))
          //.setFont()
          //.setFocus(true)
          // .setColor(color(255, 0, 0))
          .setColor(color(255)) 
            .setColorActive(color(paleta[2]))
              .setColorBackground(color(paleta[2], 100 ))           
                .setColorForeground(color(paleta[3], 100)) 
                  // .setColorValueLabel(paletaDeColor[0]) 
                  ;

    cp5.addTextfield("Puerto Envio")
      .setPosition(width-franjaW*3, margenSuperior+alto*2)
        .setSize(int(franjaW*3.5), int(alto))
          //   .setFont(createFont("arial", 20))
          .setAutoClear(false)
            .setColor(color(255)) 
              .setColorActive(color(paleta[2]))
                .setColorBackground(color(paleta[2], 100 ))           
                  .setColorForeground(color(paleta[3], 100)) 
                    ;

    cp5.addBang("Conectar")
      .setPosition(width-franjaW*3, margenSuperior+alto*8)
        .setSize(int(franjaW*2.5), int(alto))
          .setColorActive(color(paleta[4], 100))
            .setColorBackground(color(paleta[1], 100 ))           
              .setColorForeground(color(paleta[1], 100)) 
                .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)

                  ;    

    cp5.addTextfield("Puerto Recivo")
      .setPosition(width-franjaW*3, margenSuperior+alto*4)
        .setSize(int(franjaW*3.5), int(alto))
          .setColor(color(255)) 
            .setColorActive(color(paleta[2]))
              .setColorBackground(color(paleta[2], 100 ))           
                .setColorForeground(color(paleta[3], 100)) 
                  // .setAutoClear(false)
                  ;
                  
                  hide();
  }

  void hide() {
    if (!escondido) {
      franjaW = -width;
      escondido=true;
    } else {
      franjaW = width/10;
      escondido=false;
    }

    cp5.get(Textfield.class, "IP") .setPosition(width-franjaW*3, margenSuperior);
    cp5.get(Textfield.class, "Puerto Envio")  .setPosition(width-franjaW*3, margenSuperior+alto*2);
    cp5.get(Textfield.class, "Puerto Recivo") .setPosition(width-franjaW*3, margenSuperior+alto*4);
    cp5.get(Bang.class, "Conectar")  .setPosition(width-franjaW*2.8, margenSuperior+alto*8);
  }

  void fondo() {
    if (!escondido) {
      pushStyle();
      rectMode(CORNER);
      fill(0, 100);
      noStroke();
      rect(width-franjaW*3-franjaW*0.1, 0, franjaW*4, height);
      popStyle();
    }
  }
}

