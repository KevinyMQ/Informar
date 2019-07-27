  
int Tela_Ativa = -1; //Tela inicial ativa
int camada_ativa;

Estado estado_selecionado;
Porto porto_selecionado;

void setup(){
  size(382, 567); //Definindo tamanho da tela
  colorMode(HSB, 360, 100, 100, 100); //Definindo formato de edicao de cores
  
  PFont font = createFont("font.ttf", 14); //Fonte  
  textFont(font); //Definindo fonte do programa usando variável anteriormente criada e inicializada
  text("", 0, 0); //Pré-carregando buffer de texto
  
  frameRate(60);
  WriteValores();
  
  estado_selecionado = estado.get(3);
  porto_selecionado = estado_selecionado.porto.get(0);
  SettingLogoScreenVars();
  SettingMainMenuScreenVars();
}

void draw(){
  background(255);
  
  if(Tela_Ativa == -1){
    MostrarLogoScreen();
  }else if(Tela_Ativa == 0){
    MostrarMainMenuScreen();
  }else if(Tela_Ativa == 1){
  
  }

  Functions();
  
  Mouse.disparado = false; //Quando o último frame da rotação é chamado Mouse.disparado volta a ser falso
  Mouse.soltado = false;
}
