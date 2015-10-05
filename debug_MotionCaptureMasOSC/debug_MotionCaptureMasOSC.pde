import SimpleOpenNI.*;

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress suRemoteLocation;

SimpleOpenNI  context;

HashMap<Integer, UsuarioDesequilibrio> desequilibrios = new HashMap();
HashMap<Integer, UsuarioNivel> niveles = new HashMap();
HashMap<Integer, UsuarioCerrado> cerrados = new HashMap();

int switchKinet;
int estabilidadGeneral = 6;

int[] tiposDeJoint;
int[][] paresDeJoints;

void setup() {
  size(800, 600, P3D);
  context = new SimpleOpenNI(this);//,sketchPath("recorduno.oni"));  

  oscP5 = new OscP5(this, 12300); 
  suRemoteLocation = new NetAddress("192.168.1.108", 12000);

  if (context.isInit() == false)
  {
    println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
    exit();
    return;
  }

  context.enableDepth();
  context.enableUser();
  getJoints();
}

void draw() {
  //en cero poner una consola con texto con dibujos locos xD
  if (switchKinet == 1 || switchKinet == 0 ) {
    background(#903016);
    if (switchKinet == 0)image(context.userImage(), 0, 0);
  } else {
    background(#903016);
    image(context.userImage(), 0, 0, context.depthWidth()/3, context.depthHeight()/3);
    translate(width/2, height/2, 0);
    lights();
    rotateX(PI);
    translate(0, 0, -1000);
    translate(0, 0, width*2);
  }


  context.update();
  //image(context.userImage(),0,0);

  int[] userList = context.getUsers();
  for (int i=0; i<userList.length; i++)
  {
    desequilibrio(  userList[i], context, switchKinet, 1);

    nivel( userList[i], context, switchKinet, 2, tiposDeJoint, paresDeJoints, 20);

    cerrado( userList[i], context, switchKinet, 3, tiposDeJoint, paresDeJoints, 20);

    actualizarMensajes(userList[i]);
  }
}

void desequilibrio(  int usuario, SimpleOpenNI contexto, int switchK, int lugar) {  //un usuario desequilibrio, numero de usuario, context, numero del switch en el que esta, numero asignado para funcionar
  UsuarioDesequilibrio unUDesiq = desequilibrios.get(usuario);
  unUDesiq.actualizar();
  if (switchK == lugar) {
    dibujarDebugDesequilibrio(unUDesiq, 0, contexto.depthHeight()/4, 
    contexto.depthWidth(), contexto.depthHeight());
  }
}

void nivel(   int usuario, SimpleOpenNI contexto, //un usuario nivel, numero de usuario, context, numero del switch en el que esta, numero asignado para funcionar
int switchK, int lugar, int[] joints, int[][] pJoints, float tam) {//joints, paresDeJoints, tamanio de las esferas
  UsuarioNivel unUNivel = niveles.get(usuario);
  unUNivel.actualizar();
  if (contexto.isTrackingSkeleton(usuario))
  {
    if (key=='p' && keyPressed) {
      unUNivel.calcularPiso(joints);
    }
    if (switchK == lugar) {
      dibujarDebugNivel(unUNivel, 200);
      dibujarDebugEsqueleto(contexto, usuario, joints, pJoints, tam);
    }
  }
}


void cerrado(     int usuario, SimpleOpenNI contexto, //un usuario nivel, numero de usuario, context, numero del switch en el que esta, numero asignado para funcionar
int switchK, int lugar, int[] joints, int[][] pJoints, float tam) {//joints, paresDeJoints, tamanio de las esferas
  UsuarioCerrado unUCerrado = cerrados.get(usuario);
  unUCerrado.actualizar();
  if (contexto.isTrackingSkeleton(usuario))
  {

    if (switchK == lugar) {
      dibujarDebugCerrado(unUCerrado);
      dibujarDebugEsqueleto(contexto, usuario, joints, pJoints, tam);
    }
  }
}

void mousePressed() {
  if (mouseButton==LEFT)
    switchKinet = (switchKinet+1)%4;
  else if (mouseButton == RIGHT) {
    for (UsuarioNivel n : niveles.values ()) {
      n.calcularPiso(tiposDeJoint);
    }
  }
}

void keyPressed() {
  if (keyCode == RIGHT)switchKinet++;

  if (keyCode == LEFT)switchKinet--;

  if (switchKinet>3) {
    switchKinet = 0;
  } else if (switchKinet<0) {
    switchKinet = 3;
  }
}



void onNewUser(SimpleOpenNI curContext, int userId)
{
  println("onNewUser - userId: " + userId);
  println("\tstart tracking skeleton");

  curContext.startTrackingSkeleton(userId);
  //--------------------------------------------------------------------desequilibrio
  UsuarioDesequilibrio uD = new UsuarioDesequilibrio( curContext, userId, estabilidadGeneral, 20, 35 );
  desequilibrios.put( userId, uD );
  //--------------------------------------------------------------------niveles
  UsuarioNivel uN = new UsuarioNivel( curContext, userId, estabilidadGeneral, .5, .8 );
  niveles.put( userId, uN );
  //---------------------------------------------------------------------cerrado
  int [] extremidades = new int[] {
    SimpleOpenNI.SKEL_LEFT_HAND, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND, SimpleOpenNI.SKEL_RIGHT_ELBOW
  };
  int [] centro = new int[] {
    SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_SHOULDER
  };
  UsuarioCerrado uC = new UsuarioCerrado( curContext, userId, estabilidadGeneral, 1.9, extremidades, centro );
  cerrados.put( userId, uC );
}

void onLostUser(SimpleOpenNI curContext, int userId)
{
  println("onLostUser - userId: " + userId);
}

void onVisibleUser(SimpleOpenNI curContext, int userId)
{
}

void enviarMensajes(String addPat) {
  OscMessage myMessage = new OscMessage(addPat);  
  oscP5.send(myMessage, suRemoteLocation);
}
void enviarMensaje(String addPat, int data) {
  OscMessage myMessage = new OscMessage(addPat);
  myMessage.add(data);
  oscP5.send(myMessage, suRemoteLocation);
  oscP5.send(new OscMessage("/actualizarMovimiento"), suRemoteLocation);
}

