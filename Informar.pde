Botao btn;
Botao btn2;

boolean tela;

int camada_ativa;

void setup(){
size(500,500);
colorMode(HSB, 360, 100, 100, 100); //Definindo formato de edicao de cores
btn = new Botao(100, 100, 100, 100, "", "Botão", 0);
btn.fill = color(0,50,50);
btn2 = new Botao(425, 425, 50, 50, "", "Botão", 1);
btn2.fill = color(0);

}

void draw(){
background(255);

btn.Mostrar(camada_ativa);
btn2.Mostrar(camada_ativa);

if(tela){
fill(0,0,0,70);
rect(0,0, 400, 400);
}

if(btn.ativado){
background(100);
btn.ativado = false;
}
if(btn2.ativado){
  tela = !tela;
  if(tela){
  camada_ativa ++;
}else{
camada_ativa --;
}
btn2.ativado = false;
}
}