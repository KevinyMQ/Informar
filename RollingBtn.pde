class RollingBtn {    
  
  int MAX = 100;
    
  float x,y;
  float larg,alt;
  
  int totalBtns;
  int selectedBtn;
  
  int fontNormalSize = 12;
  int fontExpand = 20;
  
  float btnPxScale;
  int camada;

  boolean rotationMode;
  
  float initialP;
  float realP;

  float varianceP;

  float mappedP;
  float fixedP;

  Botao base_btn;
  Botao back_btn;
  Botao next_btn;
  
  Botao[] btn = new Botao[MAX];
  color btnsStroke = color(0,0,0);
  color btnsFill = color(0,50,50);
  color btnsHighLight = color(0,50,50);
  float fontScale = 1;
  color btnsTxtColor = color(0,0,0);
  boolean arrastando;
  
    RollingBtn(float x, float y, float larg, float alt, int selectedBtn, float btnPxScale, int camada, boolean rotationMode, String[] list){
      
       this.x = x;
       this.y = y;
      
       this.totalBtns = list.length;
       this.selectedBtn = selectedBtn;
       
       mappedP = selectedBtn;
       fixedP = mappedP;
       
       this.camada = camada;
       this.btnPxScale = btnPxScale;
       this.rotationMode = rotationMode;
       
       if(rotationMode == false){
         base_btn = new Botao(x+btnPxScale, y, larg-btnPxScale*2, alt, "", "", camada);
         back_btn = new Botao(x, y, btnPxScale, alt, "", "Back", camada);
         next_btn = new Botao(x+btnPxScale+base_btn.larg, y, btnPxScale, alt, "", "Next", camada);

         initialP = x + larg/2 - btnPxScale/2; 
         for(int i = 0; i < totalBtns; i++){
             btn[i] = new Botao(initialP, y, btnPxScale, alt, "", list[i], camada);
             btn[i].fill = btnsFill;
             btn[i].botton_stroke = btnsStroke;
             
         }
       }else{
         base_btn = new Botao(x, y+btnPxScale, larg, alt-btnPxScale*2, "", "", camada);
         back_btn = new Botao(x, y, larg, btnPxScale, "", "Back", camada);
         next_btn = new Botao(x, y+btnPxScale+base_btn.alt, larg, btnPxScale, "", "Next", camada);
         initialP = y + alt/2 - btnPxScale/2; 
         for(int i = 0; i < totalBtns; i++){
             btn[i] = new Botao(x, initialP, larg, btnPxScale, "", list[i], camada);
             btn[i].fill = btnsFill;
             btn[i].botton_stroke = btnsStroke;
             fontNormalSize = 11;
             fontExpand = 16;
         }
       }
       
       
       base_btn.botton_stroke = color(0,0,0);
       back_btn.botton_stroke = color(0,0,0);
       next_btn.botton_stroke = color(0,0,0);
       
       base_btn.fill = color(50,50,50);;
       back_btn.fill = color(150,150,50);
       next_btn.fill = color(150,150,50);  
       
       back_btn.func = new MyInterface(){
         public void MyFunction() {
             DecrementSelectedBtn();
         }
       };
       next_btn.func = new MyInterface(){
         public void MyFunction() {
             IncrementSelectedBtn();
         }
       };

  }
  
  void Mostrar(int camada_ativa){
    
    base_btn.Mostrar(camada_ativa);
 
    selectedBtn = round( mappedP);
    realP = map(mappedP,1,totalBtns,initialP,initialP - btnPxScale*(totalBtns-1));
  
            for(int i = 0; i < totalBtns; i++){  
              if(rotationMode == false){
                if(btn[i].x > x && btn[i].x < base_btn.x+base_btn.larg){
                     btn[i].Mostrar(camada_ativa);
                }
                btn[i].x = btn[i].larg*i+realP;
              
              }else{
                if(btn[i].y > y && btn[i].y < base_btn.y+base_btn.alt){
                     btn[i].Mostrar(camada_ativa);
                }
                btn[i].y = btn[i].alt*i+realP;
              }
              
              if(i == selectedBtn-1){
                this.btn[i].fontSize = fontExpand;
                this.btn[i].fill = btnsHighLight;
              }else{
                this.btn[i].fontSize = fontNormalSize;
                this.btn[i].fill = btnsFill;
              }
              
            }
            
    back_btn.Mostrar(camada_ativa);
    next_btn.Mostrar(camada_ativa);
    Mexendo(camada_ativa);
  }
  
  void Mexendo(int camada_ativa){
    
    if(base_btn.camada <= camada_ativa){
       if(base_btn.hover){
        if(Mouse.disparado){
            arrastando = true;
        }
       }
    }
    if(Mouse.solto){
      arrastando = false;
    }
    
    if(arrastando == true){
      if(rotationMode == false){
        varianceP = Mouse.clickedX - Mouse.x;
      }else{
        varianceP = Mouse.clickedY - Mouse.y;
      }
      mappedP = fixedP + varianceP/btnPxScale;
      if(mappedP < 1){
      mappedP = 1;
      }else if(mappedP > totalBtns){
      mappedP = totalBtns;
      }
    }
   if(Mouse.soltado){
     Snap();
     fixedP = mappedP;
   }
  
  }
  void updateBtnsStyle(){
    for(int i = 0; i < totalBtns; i++){
      btn[i].fill = btnsFill;
      btn[i].botton_stroke = btnsStroke;
      btn[i].txt_color = btnsTxtColor;
    }
  }
  void Snap(){
    mappedP = selectedBtn;
  }
  
  void IncrementSelectedBtn(){
    if(selectedBtn < totalBtns){
      selectedBtn ++;
      mappedP = selectedBtn;
      }
  }
  void DecrementSelectedBtn(){
    if(selectedBtn > 1){
      selectedBtn --;
      mappedP = selectedBtn;
      }
  }
   
  
}
