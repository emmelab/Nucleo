//importamos la biblioteca Simple-OpenNI
import SimpleOpenNI.*;

//creamos un contexto SimpleOpenNI
SimpleOpenNI  context;

//los joints están numerados, guardamos su numeración en un Array
int[] tiposDeJoint;
ArrayList<Bolita> bolitas;

//Creamos un diccionario (HashMap) capaz de recorrer los joints más fácilmente
//accedemos a ellos por medio de su numeración
HashMap<Integer, PVector> joints = new HashMap();

void setup() {
  size(800, 600, P3D);
  bolitas = new ArrayList<Bolita>();

  //inicializamos el contexto
  context = new SimpleOpenNI(this);

  //Preguntamos si SimpleOpenNI inicio con éxito
  if (context.isInit() == false)
  {
    println("No se pudo iniciar SimpleOpenNI, quizas la camara no esta conectada!"); 
    exit();
    return;
  }

  tiposDeJoint = new int[] {
    SimpleOpenNI.SKEL_HEAD, 
    SimpleOpenNI.SKEL_NECK, 
    SimpleOpenNI.SKEL_TORSO, 
    SimpleOpenNI.SKEL_LEFT_SHOULDER, 
    SimpleOpenNI.SKEL_LEFT_ELBOW, 
    SimpleOpenNI.SKEL_LEFT_HAND, 
    SimpleOpenNI.SKEL_RIGHT_SHOULDER, 
    SimpleOpenNI.SKEL_RIGHT_ELBOW, 
    SimpleOpenNI.SKEL_RIGHT_HAND, 
    SimpleOpenNI.SKEL_LEFT_HIP, 
    SimpleOpenNI.SKEL_LEFT_KNEE, 
    SimpleOpenNI.SKEL_LEFT_FOOT, 
    SimpleOpenNI.SKEL_RIGHT_HIP, 
    SimpleOpenNI.SKEL_RIGHT_KNEE, 
    SimpleOpenNI.SKEL_RIGHT_FOOT,
  };

  //función encargada de iniciar el HashMap
  inicializarJoints();  

  //activamos el canal de captura de profundidad
  context.enableDepth();

  //activamos el canal de captura RGB
  //context.enableRGB();

  //activamos el canal de seguimiento del esqueleto de los usuarios
  context.enableUser();

  color colorEsqueleto = color(250, 183, 38);
  fill(colorEsqueleto);
  noStroke();
}

void inicializarJoints() {
  for (int tipoDeJoint : tiposDeJoint) {
    joints.put(tipoDeJoint, new PVector());
  }
}

void draw() {
  hint(DISABLE_DEPTH_TEST);
  background(0);

  //actualizamos la captura de la Kinect
  context.update();

  image(context.userImage(), 0, 0);  

  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(PI);
  translate(0, 0, -1000);

  //tomamos la lista de todos los usuarios
  int[] userList = context.getUsers();

  //recorremos cada usuario
  for (int i=0; i<userList.length; i++)
  {
    //preguntamos si se esta haciendo el seguimiento del esqueleto
    if (context.isTrackingSkeleton(userList[i]))
    {

      //recorremos cada joint
      for (int tipoDeJoint : tiposDeJoint) {

        PVector pos = joints.get(tipoDeJoint);
        float confianza = context.getJointPositionSkeleton(userList[i], tipoDeJoint, pos );
        //context.convertRealWorldToProjective(pos,pos);println(pos);

        translate( pos.x, pos.y, pos.z );
        sphere(80);

        //agrega una bolita en la posicion de la mano derecha (joint nro. 8) a la lista de bolitas
        if (tipoDeJoint == 8) {
          bolitas.add(new Bolita(pos.x, pos.y, random(5, 10)));
        }
      }
    }
  }

  for (Bolita bolita : bolitas) {
    bolita.actualizar();
    if (bolita.vivo == false) {
      bolitas.remove(bolita);
    }
  }

  fill(255);
  for (Bolita bolita : bolitas) {
    bolita.dibujar();
  }

  popMatrix();
} 

// -----------------------------------------------------------------
// SimpleOpenNI events

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
