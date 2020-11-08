/*Elementos da tela de menu*/
  
MyImage backg_ceu_claro_main; //Fundo da tela principal
MyImage chao_main; //Chão da tela principal
MyImage silhueta; //Silhueta da tela principal
MyImage regua; //Regua da tela principal
MyImage arco; //Arco da tela principal

/*Dados*/
Ano[] ano = new Ano[10];
Mes[] mes = new Mes[12];
int year;
int month;
int day;
int totalDaysMonth;
RollingBtn diasBtn; //Botão deslizante dos dias
Botao tglCallender; //Botão que abre o calendário
int daySelected; //Variável auxiliar do botão dia selecionado
Botao calenderContainer; //Botão inverso que envolve o calendário
boolean showingCallendar; //Boleana que guarda se o calendário vai ser mostrado ou não

RollingBtn mesesBtn; //Botão deslizante dos meses
RollingBtn anosBtn; //Botão deslizante dos anos


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
  
  mes[0] = new Mes("Janeiro", 31); //Declarando array do mes de Janeiro para testes
  
  for(int i = 0; i < ano.length; i++){
    ano[i] = new Ano(2011+i); 
  }

  diasBtn = new RollingBtn(0, 0, width, 36, 1, 50, 1, false, convertArrayIntToString(mes[0].getDays())); //Inicializando valores no botão deslizante do slider de dias
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
  diasBtn.btnsHighLight = color(200,5,95);
  diasBtn.updateBtnsStyle();
  diasBtn.func = new MyInterface(){
     public void MyFunction() {
       UpdateDateVars();
     }
  };

  mesesBtn = new RollingBtn(width/2 - 130, 90, 120, 160, 1, 30, 1, true, toUpperCaseArray(getMonthNames())); //Inicializando valores no botão deslizante do slider de meses
  mesesBtn.base_btn.fill = color(0,0,100);
  mesesBtn.back_btn.fill = color(198,58,64);
  mesesBtn.back_btn.txt_color = color(0,0,100);
  mesesBtn.back_btn.text = "-";
  mesesBtn.next_btn.fill = color(198,58,64);
  mesesBtn.next_btn.txt_color = color(0,0,100);
  mesesBtn.next_btn.text = "+";
  mesesBtn.btnsFill = color(0,0,100);
  mesesBtn.fontScale = 0.5;
  mesesBtn.btnsHighLight = color(200,5,95);
  mesesBtn.updateBtnsStyle();
  mesesBtn.func = new MyInterface(){
   public void MyFunction() {
     UpdateDateVars();
     UpdateDays();    
   }
  };
  
  anosBtn = new RollingBtn(width/2 + 10, 90, 120, 160, 1, 30, 1, true, convertArrayIntToString(getOnlyYearArray(ano))); //Inicializando valores no botão deslizante do slider de anos
  anosBtn.base_btn.fill = color(0,0,100);
  anosBtn.back_btn.fill = color(198,58,64);
  anosBtn.back_btn.txt_color = color(0,0,100);
  anosBtn.back_btn.text = "-";
  anosBtn.next_btn.fill = color(198,58,64);
  anosBtn.next_btn.txt_color = color(0,0,100);
  anosBtn.next_btn.text = "+";
  anosBtn.btnsFill = color(0,0,100);
  anosBtn.fontScale = 0.5;
  anosBtn.btnsHighLight = color(200,5,95);
  anosBtn.updateBtnsStyle();
  anosBtn.func = new MyInterface(){
   public void MyFunction() {
     UpdateDateVars();
     UpdateDays();    
   }
  };
  
  tglCallender = new Botao(0, 36+4, width, 26, "", "", 0); //Inicializando botão calendário
  tglCallender.fill = color(0,0,100);  
  calenderContainer = new Botao(0, tglCallender.y + tglCallender.alt+4, width, 202, "", "", 1); //Inicializando container invertido do calendário
  calenderContainer.fill = color(0,0,100);
  calenderContainer.invertido = true;
  
  tglCallender.func = new MyInterface(){ //Adicionando a função ao botão que abre o calendário
     public void MyFunction() {
        showingCallendar = true;
     }
  };
  calenderContainer.func = new MyInterface(){ //Adicionando a função ao botão que fecha o calendário
     public void MyFunction() {
       if(!diasBtn.base_btn.focado && !diasBtn.hover){
        showingCallendar = false;
        }
     }
  };
  UpdateDateVars();
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
  toggleCalendar();
  
  //Block rolling over the invisible buttons
  if(diasBtn.mappedP > diasBtn.totalBtns-(31-ano[year-2011].mes[month-1].dias) || day > diasBtn.totalBtns-(31-ano[year-2011].mes[month-1].dias)){
      diasBtn.Snap(totalDaysMonth);
      day = diasBtn.selectedBtn;
      //diasBtn.mappedP = diasBtn.totalBtns-(31-ano[year-2011].mes[month-1].dias);
   }
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

void toggleCalendar(){ //Montando o bloco do calendário
  if(showingCallendar){
    camada_ativa = 1;
    tglCallender.fill = color(200, 5, 95);
    calenderContainer.Mostrar(camada_ativa);
    mesesBtn.Mostrar(camada_ativa);
    anosBtn.Mostrar(camada_ativa);
  }else{
    tglCallender.fill = color(0, 0, 100);
    camada_ativa = 0;
  }
}


void UpdateDays(){
  for(int i = 0; i < 31; i++){
    if(i < totalDaysMonth){
      diasBtn.btn[i].invisivel = false;
    }else{
      diasBtn.btn[i].invisivel = true;
    }
  }
}

void UpdateDateVars(){
  year = ano[anosBtn.selectedBtn-1].ano;
  month = mesesBtn.selectedBtn;
  totalDaysMonth = ano[year-2011].mes[month-1].dias;
  if(day > totalDaysMonth){
    day = totalDaysMonth;
  }else{
    day = diasBtn.selectedBtn;
  }
  print("Ano: "+year+"\n");
  print("Mes: "+month+"\n");
  print("Dia: "+day+"\n");
  print("Dias do meses: "+totalDaysMonth+"\n");
  print("-------- \n");
}
