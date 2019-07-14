class Botao {
  float x, y, larg, alt;
  color fill = color(0, 0, 0, 1);
  color botton_stroke = color(0, 0, 0, 1);
  color txt_color = color(0, 0, 0);
  
  
  
  String text = ""; 
  float x_text, y_text;
  int alin = CENTER;
  
  MyImage img_obj;
  String img = "";
  boolean invertido;
  boolean invisivel, travar;
  boolean focado;
  boolean hover;
  boolean ativado;
 
  int camada;
  
  MyInterface func;

  Botao(float x, float y, float larg, float alt, String img, final String text, int camada) {
    this.img=img;
    this.x=x;
    this.y=y;
    this.larg=larg;
    this.alt=alt;
    this.text = text;
    this.camada = camada;
    
    this.func = new MyInterface(){
     public void MyFunction() {
       if(text == ""){
         print("Button Pressed\n");
       }else{
         print(text+" Pressed\n");
       }
     }
    };
    
  }


  void Mostrar(int camada_ativa) {
    ConfiguracaoBotao();
    if(camada_ativa <= camada){
      DetectarBotao();
    }else{
      hover = false;
      focado = false;
    }
  }
  
  void txtConfigs(color txt_color, int alin, float x_text, float y_text){
    this.txt_color = txt_color;
    this.alin = alin;
    this.x_text = x_text;
    this.y_text = y_text;
  }
  
  void ConfiguracaoBotao() {
   if (!invisivel) {
      if (img == "") {
          fill(fill);
          stroke(botton_stroke);
          rect(x, y, larg, alt, 0);
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
      fill(txt_color);
      text(text, this.x+this.larg/2+x_text, this.y+this.alt/2+y_text);
    }
  }


  void DetectarBotao() {
    
    if (!travar) {
      if(invertido == false){
        if (Mouse.x>=x && Mouse.x<=x+larg&&Mouse.y>=y&&Mouse.y<=y+alt) {
          hover = true;
        } else {
          hover = false;
        }
      }else{
        if (Mouse.x>=x && Mouse.x<=x+larg&&Mouse.y>=y&&Mouse.y<=y+alt) {
          hover = false;
        } else {
          hover = true;
        }
      }

      if (!hover) { 
        focado = false;
      }
      
      if(Mouse.disparado){
        if(hover){
          focado = true;
        }
      }
        
      if(focado){
        if(Mouse.solto){
          ativado = true;
          focado = false;
        }
      }    
    }

    if(ativado == true){
      func.MyFunction();
      ativado = false;
    }
    
  }
 
}