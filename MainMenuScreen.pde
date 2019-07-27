/*Elementos da tela de menu*/
MyImage backg_ceu_claro; //Fundo da tela do menu

MyImage topo_title; //Logo na tela de menu
Botao topo_sol; //Botão do tutorial no sol
MyImage chao; //Chão da tela do menu
MyImage haste; //Haste das placas dos portos
Botao btn_porto; //Botão do porto
Botao btn_mais_portos; //Botão mais portos
Botao btn_estado; //Botão do estado
boolean mostrando_mais_placas; //Mostrador das placas dos portos ativado/desativado
boolean mostrando_mais_estados; //Mostrador de todos os estados ativado/desativado
Botao[] btn_lista_portos; // Array de botões dos portos 
Botao[] btn_lista_estados; // Array de botões dos estados 

Botao btn_creditos; //Botão créditos

MyImage onda_ini_mainmenu; //Onda da tela de menu principal


void SettingMainMenuScreenVars(){
 //Variáveis da tela menu
  backg_ceu_claro = new MyImage("data/images/background_ceu_claro.jpg"); //Definindo arquivo do background(céu claro) da tela de menu
  
  onda_ini_mainmenu = new MyImage("data/images/onda.png"); //Definindo arquivo para a onda da tela de menu
  onda_ini_mainmenu.y = -105;
  
  topo_title = new MyImage("data/images/topo_title.png"); //Definindo arquivo do background(céu claro) da tela de menu
  topo_title.y = 20;
  
  topo_sol = new Botao(240, 14, 125, 125, "data/images/topo_sol.png", "", 0); //Definindo botao que abre o tutorial(posicionado no sol da tela inicial)
  
  chao = new MyImage("data/images/chao1.png"); //Definindo arquivo do chão da tela menu
  chao.y  = height-chao.altura;
  
  haste = new MyImage("data/images/haste.png"); //Definindo arquivo da haste das placas(botões para os portos) da tela menu
  haste.x = 100;
  haste.y = 260;
  
  btn_porto = new Botao(50,330,164,67,"data/images/placa.png","PORTO SEL",0);
  btn_porto.alin = LEFT;
  btn_porto.fontSize = 14;
  btn_porto.x_text = -55;
  btn_porto.y_text = -2;
  
  btn_mais_portos = new Botao(20,245,164,67,"data/images/placa_invertida.png","MAIS",0);
  btn_mais_portos.alin = LEFT;
  btn_mais_portos.fontSize = 14;
  btn_mais_portos.x_text = -27;
  btn_mais_portos.y_text = -2;
  
  btn_estado = new Botao(58,424,108,40,"data/images/placa_estado.png","ESTADO",0);
  btn_estado.fontSize = 14;
  btn_estado.y_text = -2;
  btn_estado.txt_color = color(0,0,100);
  
  btn_creditos = new Botao(275,375,89,80,"data/images/btn_creditos.png","Créditos",0);
  btn_creditos.fontSize = 16;
  btn_creditos.x_text = -65;
  btn_creditos.txt_color = color(0,0,100);

}

void MostrarMainMenuScreen(){
  backg_ceu_claro.mostrar();
  
  topo_title.mostrar();
  topo_sol.Mostrar(camada_ativa);
  chao.mostrar();
  haste.mostrar();
  btn_porto.Mostrar(camada_ativa);
  btn_mais_portos.Mostrar(camada_ativa);
  btn_estado.Mostrar(camada_ativa);
  btn_creditos.Mostrar(camada_ativa);

  if(onda_ini_mainmenu.y < height){
    onda_ini_mainmenu.y += 5;
    onda_ini_mainmenu.mostrar();
  }
;
}