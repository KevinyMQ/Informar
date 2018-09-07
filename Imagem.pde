class MyImage
{
  PImage _image;
  String local;
  float x;
  float y;
  float largura;
  float altura;
  float angulo;
  // posição no eixo X da ancora da imagem
  float ancora_x;
  float ancora_y;

  MyImage(String pLocal)
  {
    local = pLocal;
    _image = loadImage(local); 
    largura = _image.width;
    altura = _image.height;
  }

  void mostrar()
  {
    pushMatrix();
    translate(x, y);
    float angle_rad = angulo*PI/180;
    rotate(angle_rad);
    image(_image, -ancora_x, -ancora_y, largura, altura);
    popMatrix();
  }

}