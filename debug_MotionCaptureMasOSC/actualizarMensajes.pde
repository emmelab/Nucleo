void actualizarMensajes(int user) {
  UsuarioCerrado uCerrado = cerrados.get(user);
  UsuarioNivel uNivel = niveles.get(user);
  UsuarioDesequilibrio uDeseq = desequilibrios.get(user);
  
  if (uNivel.entroAlto) enviarMensaje("/nivel",0);
  else if (uNivel.entroMedio) enviarMensaje("/nivel",1);
  else if (uNivel.entroBajo) enviarMensaje("/nivel",2);
  if (uCerrado.abrio) enviarMensaje("/cerrado",0);
  else if (uCerrado.cerro)enviarMensaje("/cerrado",1);
  
  if (uDeseq.desequilibrio <= -1) enviarMensaje("/desequilibrio",0);
  else if (uDeseq.desequilibrio >= 1) enviarMensaje("/desequilibrio",4);
  else if (uDeseq.izquierda) enviarMensaje("/desequilibrio",1);
  else if (uDeseq.derecha) enviarMensaje("/desequilibrio",3);
  else if (uDeseq.salioDerecha || uDeseq.salioIzquierda) enviarMensaje("/desequilibrio",2);
  
  if (uNivel.entroMedio || uNivel.entroBajo) {
    if (uCerrado.cerrado) {
      enviarMensajes("/MenuQuitarModificador");
    }
    else {
      enviarMensajes("/MenuAgregarModificador");
    }
  }
  else if (uNivel.medio || uNivel.bajo) {
    if (uDeseq.entroIzquierda) {
      enviarMensajes("/MenuNavegarIzquierda");
    }
    else if (uDeseq.entroDerecha) {
      enviarMensajes("/MenuNavegarDerecha");
    }
    else if (abs(uDeseq.desequilibrio) >= 1) {
      if (frameCount % 12 == 0){
       if (uDeseq.desequilibrio > 0) enviarMensajes("/MenuNavegarDerecha");
       else enviarMensajes("/MenuNavegarIzquierda");
      }
    }
  }
  else if (uNivel.entroAlto) {
    if (uCerrado.cerrado) {
      enviarMensajes("/Cancelar");
    }
    else {
      enviarMensajes("/Aceptar");
    }
  }
}
