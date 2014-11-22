import SimpleOpenNI.*;

SimpleOpenNI context;
HashMap<Integer, PVector> joints = new HashMap();
int[] tiposJoint;

NivelBajo nivelbajo;

void setup() {
  size(800, 600);

  //NivelBajo recibe el umbral
  nivelbajo = new NivelBajo(30);
  context = new SimpleOpenNI(this, "ml.oni");

  if (context.isInit() == false) {
    println("No esta conectada.");
    exit();
    return;
  }

  context.enableDepth();
  context.enableUser();

  inicializarJoints();
}

void draw() {
  background(0);

  //actualizo el contexto de la Kinect
  context.update();

  //debug provista por Kinect
  image(context.userImage(), 0, 0); 

  //lista de usuarios visibles
  int[] userList = context.getUsers();

  for (int i=0; i < userList.length; i++) {
    if (context.isTrackingSkeleton(userList[i]));
    {
      //deteccion de Nivel Bajo    
      nivelbajo.deteccion(userList[i], joints);

      if (nivelbajo.entra()) println("Usuario " + i + " ha entrado a NIVEL BAJO en el frame " + frameCount);
      if (nivelbajo.sale()) println("Usuario " + i + " ha salido de NIVEL BAJO en el frame " + frameCount);
      color colorJoints = nivelbajo.activo() ? color(0, 255, 0) : color(255, 0, 0);

      dibujarJoints(userList[i], colorJoints);
    }
  }
}

void dibujarJoints(int user, color colorJoints) {
  for (int tipoJoint : tiposJoint) {
    PVector pos = joints.get(tipoJoint);
    context.getJointPositionSkeleton(user, tipoJoint, pos);
    
    PVector pos2d = new PVector();
    context.convertRealWorldToProjective(pos, pos2d);
    
    noStroke();
    fill(colorJoints);
    ellipse(pos2d.x, pos2d.y, 10, 10);
  }
}

void inicializarJoints() { 
  tiposJoint = new int[] {
    SimpleOpenNI.SKEL_HEAD, 
    SimpleOpenNI.SKEL_NECK, 
    SimpleOpenNI.SKEL_LEFT_ELBOW, 
    SimpleOpenNI.SKEL_LEFT_HAND, 
    SimpleOpenNI.SKEL_RIGHT_SHOULDER, 
    SimpleOpenNI.SKEL_RIGHT_ELBOW, 
    SimpleOpenNI.SKEL_RIGHT_HAND, 
    SimpleOpenNI.SKEL_LEFT_SHOULDER, 
    SimpleOpenNI.SKEL_TORSO, 
    SimpleOpenNI.SKEL_LEFT_HIP, 
    SimpleOpenNI.SKEL_LEFT_KNEE, 
    SimpleOpenNI.SKEL_LEFT_FOOT, 
    SimpleOpenNI.SKEL_RIGHT_HIP, 
    SimpleOpenNI.SKEL_RIGHT_KNEE, 
    SimpleOpenNI.SKEL_RIGHT_FOOT
  };

  for (int tipoJoint : tiposJoint) {
    joints.put(tipoJoint, new PVector());
  }
}

void onNewUser(SimpleOpenNI curContext, int userId)
{
  println("onNewUser - userId: " + userId);
  println("\tstart tracking skeleton");

  curContext.startTrackingSkeleton(userId);
}

void onLostUser(SimpleOpenNI curContext, int userId)
{
  println("onLostUser - userId: " + userId);
}

void onVisibleUser(SimpleOpenNI curContext, int userId)
{
  //println("onVisibleUser - userId: " + userId);
}

