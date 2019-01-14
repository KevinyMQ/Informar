class Dropmenu {
 Botao principal;

 int ext = 5; //Numero maximo de botoes por drop
 Botao[] btn_subdrop = new Botao[ext];

 boolean mostrando; //Estado do drop (mostrando botoes ou nao)
 boolean animando; //Estado que representa a animacao dos botoes do drop

 int n_btn; //Numero de botoes escolhido na instancia

 float anim_tempo; //Contador da animacao

 Dropmenu(float x, float y, float larg, float alt, String img, String text, int n_btn, int camada) {
  this.n_btn = n_btn;
  principal = new Botao(x, y, larg, alt, img, text, camada);
  for (int i = 0; i < n_btn; i++) {
   btn_subdrop[i] = new Botao(x, y, 40, 40, "", "0" + (i + 1), camada);
  }
 }


 void Mostrar(int camada_ativa) {

  if (mostrando || animando) {
   for (int i = 0; i < n_btn; i++) {
    btn_subdrop[i].travar = animando;
    btn_subdrop[i].Mostrar(camada_ativa);
   }
  }

  if (animando) {
   Animar();
  }

  if (principal.ativado) {
   mostrando = !mostrando;
   animando = true;
   principal.ativado = false;
  }

  principal.Mostrar(camada_ativa);
  principal.travar = animando;

 }

 void Animar() {

  if (mostrando) {
   for (int i = 0; i < n_btn; i++) {
    btn_subdrop[i].y = principal.y + (-50 - i * 50) * anim_tempo;
   }
  } else {
   for (int i = 0; i < n_btn; i++) {
    btn_subdrop[i].y = principal.y + (-50 - i * 50) - (-50 - i * 50) * anim_tempo;
   }
  }

  if (anim_tempo < 1) {
   anim_tempo += 2.5 / 60;
  } else {
   anim_tempo = 0;
   animando = false;
  }

 }

}