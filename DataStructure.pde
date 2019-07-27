class Estado{

  String name;
  ArrayList<Porto> porto = new ArrayList<Porto>();


  Estado(String name){
  this.name = name;
  }
  
}

class Porto{

 String name;
 ArrayList<Ano> ano = new ArrayList<Ano>();
 
 Porto(String name){
 this.name = name;
 }
}

class Ano{
 int ano;
 Mes[] mes = new Mes[12];
 
 Ano(int ano){
   this.ano = ano;
 }
 
}

class Mes{
  String name;
  ArrayList<Dia> dia = new ArrayList<Dia>();

  Mes(String name, int dias){
    this.name = name;
    for(int i = 0; i < dias; i++){
      dia.add(new Dia(i));
    }
  }

}

class Dia{
  int dia;
  Hora[] hora = new Hora[4];
  
  Dia(int dia){
    this.dia = dia;
  }
  
}

class Hora{
  String hora;
  int mare;
  
  Hora(String hora){
    this.hora = hora;
  }
  
}
