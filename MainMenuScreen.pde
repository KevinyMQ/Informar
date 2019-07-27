/*Elementos da tela de menu*/
MyImage backg_ceu_claro; //Fundo da tela do menu

MyImage topo_title; //Logo na tela de menu
Botao btn_tutorial_sol; //Botão do tutorial no sol
MyImage chao; //Chão da tela do menu
MyImage haste; //Haste das placas dos portos
Botao btn_mais_estados; //Botão para abrir a lista de estados
Botao btn_mais_portos; ////Botão para abrir a lista de portos
Botao btn_porto; //Botão do porto

Botao btn_voltar_p_menu; //Botão para voltar ao menu principal

boolean mostrando_mais_portos; //Mostrador das placas dos portos ativado/desativado
boolean mostrando_mais_estados; //Mostrador de todos os estados ativado/desativado
Botao[] btn_lista_portos; // Array de botões dos portos 
Botao[] btn_lista_estados; // Array de botões dos estados 

Botao btn_creditos; //Botão créditos

MyImage onda_ini_mainmenu; //Onda da tela de menu principal


void SettingMainMenuScreenVars(){
 //Variáveis da tela menu
  backg_ceu_claro = new MyImage("data/images/background_ceu_claro.jpg"); //Definindo arquivo do background(céu claro) da tela de menu
  
  topo_title = new MyImage("data/images/topo_title.png"); //Definindo arquivo do background(céu claro) da tela de menu
  topo_title.y = 20;
  
  btn_tutorial_sol = new Botao(240, 14, 125, 125, "data/images/topo_sol.png", "", 0); //Definindo botao que abre o tutorial(posicionado no sol da tela inicial)
  btn_tutorial_sol.travar = true;
  
  chao = new MyImage("data/images/chao1.png"); //Definindo arquivo do chão da tela menu
  chao.y  = height-chao.altura;
  
  haste = new MyImage("data/images/haste.png"); //Definindo arquivo da haste das placas(botões para os portos) da tela menu
  haste.x = 100;
  haste.y = 260;
  
  
  btn_mais_estados = new Botao(58,424,108,40,"data/images/placa_estado.png",estado_selecionado.name,0);
  btn_mais_estados.fontSize = 12;
  btn_mais_estados.y_text = -2;
  btn_mais_estados.txt_color = color(0,0,100);
  btn_mais_estados.travar = true;
  
  btn_mais_estados.func = new MyInterface(){
     public void MyFunction() {
       mostrando_mais_estados = true;
       camada_ativa = 1;
   }
  };

  
  btn_lista_estados = new Botao[estado.size()];
  
  for(int i = 0; i < btn_lista_estados.length; i++){
    btn_lista_estados[i] = new Botao(25+(i%3)*(108+4),182+(i/3*(36+2)),108,36,"data/images/placa_estado.png",estado.get(i).name,1);
    btn_lista_estados[i].fontSize = 10;
    btn_lista_estados[i].y_text = -2;
    btn_lista_estados[i].txt_color = color(0,0,100);
    
    final int id = i;
    btn_lista_estados[i].func = new MyInterface(){
     public void MyFunction() {
       estado_selecionado = estado.get(id);
       porto_selecionado = estado_selecionado.porto.get(0);
       btn_mais_estados.text = estado_selecionado.name;
       btn_porto.text = porto_selecionado.name;
       mostrando_mais_estados = false;
       camada_ativa = 0;     
     }
    };   
  }

  
  btn_mais_portos = new Botao(20,245,164,67,"data/images/placa_invertida.png","MAIS",0);
  btn_mais_portos.alin = LEFT;
  btn_mais_portos.fontSize = 14;
  btn_mais_portos.x_text = -27;
  btn_mais_portos.y_text = -2;
  btn_mais_portos.travar = true;

  btn_mais_portos.func = new MyInterface(){
     public void MyFunction() {
       mostrando_mais_portos = true;
       camada_ativa = 1;
   }
  };
 
 
  btn_lista_portos = new Botao[8];
  for(int i = 0; i < btn_lista_portos.length; i++){
    if(i % 2 == 0){
      btn_lista_portos[i] = new Botao(25+(i%2*(154+18)),182+(i/2*(56+2)),154,56,"data/images/placa.png","PORTO"+i,1);
      btn_lista_portos[i].x_text = -55;
    }else{
      btn_lista_portos[i] = new Botao(25+(i%2*(154+18)),182+(i/2*(56+2)),154,56,"data/images/placa_invertida.png","PORTO"+i,1);
      btn_lista_portos[i].x_text = -27;
    }
    btn_lista_portos[i].alin = LEFT;
    btn_lista_portos[i].fontSize = 14;
    btn_lista_portos[i].y_text = -2;
    btn_lista_portos[i].txt_color = color(0,0,0);

    final int id = i;
    btn_lista_portos[i].func = new MyInterface(){
     public void MyFunction() {
       porto_selecionado = estado_selecionado.porto.get(id);
       btn_porto.text = porto_selecionado.name;
       mostrando_mais_portos = false;
       camada_ativa = 0;     
     }
    };   
  }
  
  
  btn_porto = new Botao(50,330,164,67,"data/images/placa.png",porto_selecionado.name,0);
  btn_porto.alin = LEFT;
  btn_porto.fontSize = 14;
  btn_porto.x_text = -55;
  btn_porto.y_text = -2;
  btn_porto.travar = true;

  btn_porto.func = new MyInterface(){
     public void MyFunction() {
        print(porto_selecionado.name+"\n");
     }
  };
  
  
  btn_voltar_p_menu = new Botao(26,480,64,64,"data/images/btn_seta_voltar.png","",1);
  btn_voltar_p_menu.func = new MyInterface(){
     public void MyFunction() {
       mostrando_mais_estados = false;
       mostrando_mais_portos = false;
       camada_ativa = 0;
   }
  };
  
  
  btn_creditos = new Botao(275,375,89,80,"data/images/btn_creditos.png","Créditos",0);
  btn_creditos.fontSize = 16;
  btn_creditos.x_text = -65;
  btn_creditos.txt_color = color(0,0,100);
  btn_creditos.travar = true;
  
  onda_ini_mainmenu = new MyImage("data/images/onda.png"); //Definindo arquivo para a onda da tela de menu
  onda_ini_mainmenu.y = -105;

}

void MostrarMainMenuScreen(){
  backg_ceu_claro.mostrar();
 
  if(mostrando_mais_estados||mostrando_mais_portos){
    if(mostrando_mais_estados){
      SubMenuEstados();
    }
    if(mostrando_mais_portos){
      SubMenuPortos();
    }
  }else{
  chao.mostrar();
  haste.mostrar();
  btn_mais_estados.Mostrar(camada_ativa);
  btn_mais_portos.Mostrar(camada_ativa);
  btn_porto.Mostrar(camada_ativa);
  btn_creditos.Mostrar(camada_ativa);
  }
  topo_title.mostrar();
  btn_tutorial_sol.Mostrar(camada_ativa);
  
  if(onda_ini_mainmenu.y < height){
    onda_ini_mainmenu.y += 5;
    onda_ini_mainmenu.mostrar();
  }else{
    btn_mais_estados.travar = false;
    btn_mais_portos.travar = false;
    btn_porto.travar = false;
    btn_creditos.travar = false;
    btn_tutorial_sol.travar = false;
  }
  
}


void SubMenuEstados(){
  fill(166,25,95);
  noStroke();
  quad(0, 150, 0, 175, 320, 175, 250, 150);
  fill(0,0,100);
  rect(0,175,width,height-170);
  textAlign(LEFT);
  textSize(14);
  fill(193,23,24);
  text("SELECIONE O ESTADO",24,168);

  chao.mostrar();
   for(int i = 0; i < btn_lista_estados.length; i++){
    btn_lista_estados[i].Mostrar(camada_ativa);
  }
  btn_voltar_p_menu.Mostrar(camada_ativa);
}

void SubMenuPortos(){
  fill(166,25,95);
  noStroke();
  quad(0, 150, 0, 175, 320, 175, 250, 150);
  fill(0,0,100);
  rect(0,175,width,height-170);
  textAlign(LEFT);
  textSize(14);
  fill(193,23,24);
  text("SELECIONE A UNIDADE",24,168);

  chao.mostrar();
   for(int i = 0; i < estado_selecionado.porto.size(); i++){
    btn_lista_portos[i].text = estado_selecionado.porto.get(i).name;
    btn_lista_portos[i].Mostrar(camada_ativa);
  }
  btn_voltar_p_menu.Mostrar(camada_ativa);
}
