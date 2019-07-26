static class Mouse{
  static float x, y;
  static float clickedX, clickedY;
  static boolean disparado, clicando;
  static boolean solto = true;
  static boolean soltado;
}

void mousePressed() {
  Mouse.clicando = true;
  Mouse.disparado = true;
  Mouse.solto = false;
  Mouse.clickedX = Mouse.x;
  Mouse.clickedY = Mouse.y;
}
void mouseReleased(){
  Mouse.clicando = false;
  Mouse.solto = true;
  Mouse.soltado = true;
  Mouse.disparado = false;
}
void mouseMoved() {
  Mouse.x = mouseX;
  Mouse.y = mouseY;
}
void mouseDragged() {
  Mouse.x = mouseX;
  Mouse.y = mouseY;
}