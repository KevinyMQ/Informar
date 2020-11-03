/*Elementos da tela de menu*/

MyImage backg_ceu_claro_main; //Fundo da tela principal
MyImage chao_main; //Chão da tela principal
MyImage silhueta; //Silhueta da tela principal
MyImage regua; //Regua da tela principal
MyImage arco; //Arco da tela principal

/*Dados*/
Mes mes;


RollingBtn diasBtn; //Botão deslizante com o 


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
  
  mes = new Mes("Janeiro", 30);
  
  diasBtn = new RollingBtn(0, 0, width, 36, 1, 40, 0, false, convertArrayIntToString(mes.getDays()));
  diasBtn.base_btn.botton_stroke = color(0,0,100);
  diasBtn.base_btn.fill = color(0,0,100);
  diasBtn.back_btn.botton_stroke = color(0,0,100);
  diasBtn.back_btn.fill = color(0,0,100);
  diasBtn.back_btn.text = "<";
  diasBtn.next_btn.botton_stroke = color(0,0,100);
  diasBtn.next_btn.fill = color(0,0,100);
  diasBtn.next_btn.text = ">";
}

void MostrarMainScreen(){
  backg_ceu_claro_main.mostrar();
  chao_main.mostrar();
  silhueta.mostrar();
  regua.mostrar();
  arco.mostrar();
  diasBtn.Mostrar(camada_ativa); 
}
