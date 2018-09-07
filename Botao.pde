class Botao {
  float x, y, larg, alt;
  float fill_hc;
  float fill_sc = 50;
  float fill_bc = 50;
  float color_txt = 100;
  String text = ""; 
  float x_text, y_text;
  int alin = CENTER;
  String img = "";
  int Action;
  boolean hover, click;
  boolean border_b, fill_b = true, invisivel, travar;
  boolean ativado;
  boolean solto = true;
  boolean disparado, clicando;
  MyImage img_obj;
  int camada;

  Botao(float x, float y, float larg, float alt, String img, String text) {
    this.img=img;
    this.x=x;
    this.y=y;
    this.larg=larg;
    this.alt=alt;
    this.text = text;
  }

  void MostrarBotao() {
    //int camada_ativa
    ConfiguracaoBotao();
    //camada_ativa == camadaif(){
    DetectarBotao();
    //}
  }
  void ConfiguracaoBotao() {
    if (!invisivel) {
      if (img == "") {
        if (fill_b) {
          fill(fill_hc, fill_sc, fill_bc);
          rect(x, y, larg, alt, 0);
        }
      } else {
        img_obj = new MyImage(this.img);
        img_obj.local = "";
        img_obj.x = this.x+this.larg/2;
        img_obj.y = this.y+this.alt/2;
        img_obj.largura = this.larg;
        img_obj.altura = this.alt;
        img_obj.ancora_x = img_obj.largura/2;
        img_obj.ancora_y =  img_obj.altura/2;

        img_obj.mostrar();
      }

      textAlign(alin);
      fill(0, 0, color_txt);
      text(text, this.x+this.larg/2+x_text, this.y+this.alt/2+y_text);
    }
  }


  void DetectarBotao() {
    if (!travar) {

      if (mouseX/0.5 >=x && mouseX/0.5<=x+larg&&mouseY/0.5>=y&&mouseY/0.5<=y+alt) {
        hover = true;
      } else {
        hover = false;
      }

      if (!hover) {
        click = false;
      }

      if (clicando) {
        if (solto) {
          solto = false;
          if (hover) {
            click = true;
          }
        }
      }
      if (disparado) {  
        if (click) {
          ativado=true;
          click=false;
        }
        disparado=false;
      }

      if (mousePressed) {
        clicando = true;
      } else {
        clicando = false;
        disparado = true;
        solto = true;
      }
    }
  }
}