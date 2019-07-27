/*Elementos da tela de abertura*/
MyImage logo_smd_ini; //Tela da UFC na abertura
MyImage logo_app_ini; //Logo da tela inicial 
MyImage onda_ini; //Onda da tela inicial

int logo_screen_timer;
float expand_logo;
float altura_onda;

void SettingLogoScreenVars(){
  logo_app_ini = new MyImage("data/images/logo_app_ini.jpg"); //Definindo arquivo usado para a logo
  
  logo_smd_ini = new MyImage("data/images/logo_smd_ini.jpg"); //Definindo arquivo para a tela do smd da tela de abertura
  //logo_smd_ini.x = width/2;
  //logo_smd_ini.y = height/2;
  //logo_smd_ini.ancora_x = logo_smd_ini.largura/2;
  //logo_smd_ini.ancora_y = logo_smd_ini.altura/2;
  //logo_smd_ini.largura = width;
  //logo_smd_ini.altura = height;

  onda_ini = new MyImage("data/images/onda.png"); //Definindo arquivo para a onda da tela de abertura
  onda_ini.y = 485;

}

void MostrarLogoScreen(){
  logo_screen_timer++;
  
  if(logo_screen_timer <= 100){
    logo_app_ini.mostrar();
  }else if(logo_screen_timer > 100 && logo_screen_timer <= 225){
    if(logo_screen_timer > 125){
      expand_logo+=0.25;
      //logo_smd_ini.largura = width + expand_logo;
      //logo_smd_ini.altura = height + expand_logo;
      //logo_smd_ini.ancora_x = logo_smd_ini.largura/2;
      //logo_smd_ini.ancora_y = logo_smd_ini.altura/2;
      }
    if(logo_screen_timer > 80){
      altura_onda+=0.075;
      onda_ini.y-=altura_onda;
    }
      
      logo_smd_ini.mostrar();
      onda_ini.mostrar();
      
      if(logo_screen_timer == 225){
        Tela_Ativa = 0;
      }
      
  }
}