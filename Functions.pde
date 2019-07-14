void Functions(){

  btn.func = new MyInterface(){
     public void MyFunction() {
       background(100);
   }
  };
  
  btn2.func = new MyInterface(){
     public void MyFunction() {
     tela = true;
     camada_ativa = btn2.camada;
   }
  };
  
  btn3_back.func = new MyInterface(){
     public void MyFunction() {
     tela = false;
     camada_ativa = 0;
   }
  };
  
}