Botao btn;
Botao btn2;
Botao btn3;

Dropmenu dropmenu;

boolean disparado, clicando;
boolean solto = true;
boolean tela;

int camada_ativa;

void setup(){  
  size(500,500);
  colorMode(HSB, 360, 100, 100, 100); //Definindo formato de edicao de cores
  btn = new Botao(100, 100, 100, 100, "", "Botão", 0);
  btn.fill = color(0,50,50);
  btn2 = new Botao(425, 20, 50, 50, "", "Botão", 1);
  btn2.fill = color(0);
  btn3 = new Botao(0, 0, 300, 300, "", "Botão de camada", 1);
  btn3.fill = color(0,50,250);
  
  dropmenu = new Dropmenu(425, 425, 50, 50, "", "Drop", 3, 1);
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
  
  disparado = false;
}

void submenu(){
  if(tela){
    fill(0,0,0,70);
    rect(0,0, 400, 400);
    if(disparado && !btn3.hover){  
      tela = false;
      camada_ativa --;
    }
    btn3.Mostrar(camada_ativa);
  }
}

void mousePressed() {
  disparado = true;
  solto = false;
}
void mouseReleased(){
  solto = true;
  disparado = false;
}