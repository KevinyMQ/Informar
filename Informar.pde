
Botao btn;
Botao btn2;
Botao btn3;
Botao btn3_back;

Dropmenu dropmenu;

String[] list1 = {"1","2","3","4","5","6","7","8","9","10"};
String[] list2 = {"Janeiro","Fevereiro","Março","Abril","Maio","Junho","Julho","Agosto","Setembro","Outubro"};

RollingBtn horizontalRoller;
RollingBtn verticalRoller;

boolean tela;

int camada_ativa;

void setup(){
  size(500,500);
  colorMode(HSB, 360, 100, 100, 100); //Definindo formato de edicao de cores
  frameRate(60);
  
  btn = new Botao(100, 100, 100, 100, "", "Botão", 0);
  btn.fill = color(0,50,50);
  btn2 = new Botao(425, 20, 50, 50, "", "", 1);
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
  horizontalRoller = new RollingBtn(10, 30, 400, 50, 1, 50, 0, false, list1);
  verticalRoller = new RollingBtn(250, 100, 100, 300, 1, 25, 0, true, list2);

}

void draw(){
  background(255);
  btn.Mostrar(camada_ativa);

  horizontalRoller.Mostrar(camada_ativa);
  verticalRoller.Mostrar(camada_ativa);

  submenu();
  btn2.Mostrar(camada_ativa);
  dropmenu.Mostrar(camada_ativa);
  
  Functions();
  Mouse.disparado = false; //Quando o último frame da rotação é chamado Mouse.disparado volta a ser falso
  Mouse.soltado = false;
}

void submenu(){
  if(tela){
    btn3_back.Mostrar(camada_ativa);
    btn3.Mostrar(camada_ativa);

  }
}