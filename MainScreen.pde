/*Elementos da tela de menu*/
  
MyImage backg_ceu_claro_main; //Fundo da tela principal
MyImage chao_main; //Chão da tela principal
MyImage silhueta; //Silhueta da tela principal
MyImage regua; //Regua da tela principal
MyImage arco; //Arco da tela principal



/*Dados*/
Mes mes;
  
RollingBtn diasBtn; //Botão deslizante
Botao tglCallender; //Botão que abre o calendário
int daySelected; //Variável auxiliar do botão dia selecionado


void SettingMainScreenVars(){
 //Variáveis da tela principal
  backg_ceu_claro_main = new MyImage("data/images/background_ceu_claro.jpg"); //Definindo arquivo do background(céu claro) da tela principal
  chao_main = new MyImage("data/images/chao_r.png"); //Definindo arquivo do chão da tela principal
  chao_main.y  = height-chao_main.altura;
  silhueta = new MyImage("data/images/silhueta.png"); //Definindo arquivo da silhueta da tela principal
  silhueta.x  = silhueta.x + (width - silhueta.largura)/2;
  silhueta.y  = height-silhueta.altura-70;
  regua = new MyImage("data/images/medidas.png"); //Definindo arquivo da regua da tela principal
  regua.y  = 30;
  arco = new MyImage("data/images/arco.png"); //Definindo arquivo do arco da tela principal
  arco.y = 100;
  
  mes = new Mes("Janeiro", 30); //Declarando array do mes de Janeiro para testes
  
  diasBtn = new RollingBtn(0, 0, width, 36, 1, 50, 0, false, convertArrayIntToString(mes.getDays())); //Inicializando valores no botão deslizante transformando do slider de dias
  diasBtn.base_btn.botton_stroke = color(0,0,100);
  diasBtn.base_btn.fill = color(0,0,100);
  diasBtn.back_btn.botton_stroke = color(0,0,100);
  diasBtn.back_btn.fill = color(0,0,100);
  diasBtn.back_btn.txt_color = color(198,58,64);
  diasBtn.back_btn.text = "<";
  diasBtn.next_btn.botton_stroke = color(0,0,100);
  diasBtn.next_btn.fill = color(0,0,100);
  diasBtn.next_btn.txt_color = color(198,58,64);
  diasBtn.next_btn.text = ">";
  diasBtn.btnsStroke = color(0,0,100,0);
  diasBtn.btnsFill = color(0,0,100);
  diasBtn.btnsTxtColor = color(198,58,64);
  diasBtn.updateBtnsStyle();

  tglCallender = new Botao(0, diasBtn.base_btn.alt+4, width, 26, "", "", 0); //Inicializando botão calendário
  tglCallender.fill = color(0,0,100);  
  
}

void MostrarMainScreen(){
  daySelected = diasBtn.selectedBtn-1;
  backg_ceu_claro_main.mostrar();
  chao_main.mostrar();
  silhueta.mostrar();
  regua.mostrar();
  arco.mostrar();
  diasBtn.Mostrar(camada_ativa);
  tglCallender.Mostrar(camada_ativa);
  /*Detalhe azul do botão calendário*/
  fill(198,58,64);
  rect(0, tglCallender.y + tglCallender.alt, width, 5);
  
  diasBtnsDetail();
}


void diasBtnsDetail(){ //Função do detalhe que marca o dia selecionado
  fill(0,0,0,0);
  stroke(198,58,64);
  strokeWeight(3);
  rect(diasBtn.btn[daySelected].x,diasBtn.btn[daySelected].y,diasBtn.btn[daySelected].larg,diasBtn.btn[daySelected].alt);
  strokeWeight(0);
  fill(198,58,64);
  triangle(diasBtn.btn[daySelected].x, diasBtn.btn[daySelected].y+diasBtn.btn[daySelected].alt, diasBtn.btn[daySelected].x+diasBtn.btn[daySelected].larg/2, diasBtn.btn[daySelected].y+diasBtn.btn[daySelected].alt+8, diasBtn.btn[daySelected].x+diasBtn.btn[daySelected].larg, diasBtn.btn[daySelected].y+diasBtn.btn[daySelected].alt);
}
