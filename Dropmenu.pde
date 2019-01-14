class Dropmenu{
 Botao principal;
 
 int ext = 5; //Numero maximo de botoes por drop
 Botao[] btn_subdrop = new Botao[ext];
 
 boolean mostrando; //Estado do drop (mostrando botoes ou nao)
 int n_btn; //Numero de botoes escolhido na instancia

 Dropmenu(float x, float y, float larg, float alt, String img, String text, int n_btn, int camada){
    this.n_btn = n_btn;
    principal = new Botao(x, y, larg, alt, img, text, camada);
    for (int i = 0; i < n_btn; i++) {
      btn_subdrop[i] = new Botao(x, y-50-i*50, 40, 40, "", "0"+(i+1), camada);
    }
 }
 
 void Mostrar(int camada_ativa){
   
    principal.Mostrar(camada_ativa);
    if(mostrando){
      for (int i = 0; i < n_btn; i++) {
        btn_subdrop[i].Mostrar(camada_ativa);
      } 
    }
    
    if(principal.ativado){
      mostrando = !mostrando;
      principal.ativado = false;
    }
    
 }
 
 
 

}