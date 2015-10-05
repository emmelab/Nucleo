void getJoints(){
  tiposDeJoint = new int[] {
    SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND, 
    SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE, 
    SimpleOpenNI.SKEL_LEFT_FOOT, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT
  };
  paresDeJoints = new int[][] {
    {SimpleOpenNI.SKEL_HEAD,SimpleOpenNI.SKEL_NECK},
    {SimpleOpenNI.SKEL_NECK,SimpleOpenNI.SKEL_TORSO},
    {SimpleOpenNI.SKEL_LEFT_HAND,SimpleOpenNI.SKEL_LEFT_ELBOW},
    {SimpleOpenNI.SKEL_LEFT_ELBOW,SimpleOpenNI.SKEL_LEFT_SHOULDER},
    {SimpleOpenNI.SKEL_LEFT_SHOULDER,SimpleOpenNI.SKEL_NECK},
    {SimpleOpenNI.SKEL_TORSO,SimpleOpenNI.SKEL_LEFT_HIP},
    {SimpleOpenNI.SKEL_LEFT_HIP,SimpleOpenNI.SKEL_LEFT_KNEE},
    {SimpleOpenNI.SKEL_LEFT_KNEE,SimpleOpenNI.SKEL_LEFT_FOOT},
    {SimpleOpenNI.SKEL_RIGHT_HAND,SimpleOpenNI.SKEL_RIGHT_ELBOW},
    {SimpleOpenNI.SKEL_RIGHT_ELBOW,SimpleOpenNI.SKEL_RIGHT_SHOULDER},
    {SimpleOpenNI.SKEL_RIGHT_SHOULDER,SimpleOpenNI.SKEL_NECK},
    {SimpleOpenNI.SKEL_TORSO,SimpleOpenNI.SKEL_RIGHT_HIP},
    {SimpleOpenNI.SKEL_RIGHT_HIP,SimpleOpenNI.SKEL_RIGHT_KNEE},
    {SimpleOpenNI.SKEL_RIGHT_KNEE,SimpleOpenNI.SKEL_RIGHT_FOOT},
  };
}
