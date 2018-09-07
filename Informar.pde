Botao btn;
void setup(){
size(500,500);
colorMode(HSB, 360, 100, 100); //Definindo formato de edicao de cores
btn = new Botao(100, 100, 100, 100, "", "Botão");
}

void draw(){
  background(255);

btn.Mostrar();

if(btn.ativado){
background(100);
btn.ativado = false;
}

}