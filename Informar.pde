
Botao btn;
Botao btn2;
Botao btn3;
Botao btn3_back;

Dropmenu dropmenu;

//boolean disparado, clicando;
//boolean solto = true;
boolean tela;

int camada_ativa;



void setup(){  
  size(500,500);
  colorMode(HSB, 360, 100, 100, 100); //Definindo formato de edicao de cores
  frameRate(60);
  
  btn = new Botao(100, 100, 100, 100, "", "Botão", 0);
  btn.fill = color(0,50,50);
  btn2 = new Botao(425, 20, 50, 50, "", "Botão", 1);
  btn2.fill = color(0);
  
  btn3 = new Botao(0, 0, 300, 300, "", "Botão de camada", 1);
  btn3.fill = color(0,50,250);
  btn3_back = new Botao(0, 0, 400, 400, "", "", 1);
  btn3_back.fill = color(0,0,0,70);
  btn3_back.invertido = true;
  
  dropmenu = new Dropmenu(425, 425, 50, 50, "", "Drop", 3, 0);
  dropmenu.principal.fill = color(0,0,100);
  dropmenu.btn_subdrop[0].fill = color(0,0,30);
  dropmenu.btn_subdrop[1].fill = color(0,0,30);
  dropmenu.btn_subdrop[2].fill = color(0,0,30);
}

void draw(){
  background(255);

  btn.Mostrar(camada_ativa);
  btn2.Mostrar(camada_ativa);
  submenu();
  dropmenu.Mostrar(camada_ativa);
  
  if(btn.ativado){
    background(100);
    btn.ativado = false;
  }

  if(btn2.ativado){
    tela = true;
    camada_ativa ++;
    btn2.ativado = false;
  }
  
  Mouse.disparado = false;
}

void submenu(){
  if(tela){
    btn3_back.Mostrar(camada_ativa);
    btn3.Mostrar(camada_ativa);
    if(btn3_back.ativado){  
      tela = false;
      camada_ativa --;
      btn3_back.ativado = false;
    } 
  }
}

 /* void mousePressed() {
  print(Mouse.disparado);
  Mouse.disparado = true;
  Mouse.solto = false;
}
void mouseReleased(){
  Mouse.solto = true;
  Mouse.disparado = false;
}*/