static class Mouse{
  static float x, y;
  static boolean disparado, clicando;
  static boolean solto = true;
}

void mousePressed() {
  Mouse.clicando = true;
  Mouse.disparado = true;
  Mouse.solto = false;
}
void mouseReleased(){
  Mouse.clicando = false;
  Mouse.solto = true;
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